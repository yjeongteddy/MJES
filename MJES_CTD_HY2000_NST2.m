clc;clear all;close all;

%% Set the path to load files
cd('C:\Users\USER\OneDrive\Desktop\data\MJES\38_MJES_202111_Haeyang_ES\CTD\processed\10_asciiout\1m_avgd\down')
files = dir('nst2*.asc');

%% Define each variable
ds = {};temp = {};sal = {};prs = {};dnsty = {};do = {};
cndctvty = {};lat = {};lon = {};TEMP = {};fl = {};

%% Put files into dataset according to location
% NST 2 line
n = 0;
for i = 1:length(files)
    n = n+1;
    ds{n} = importdata([files(i).folder,'\',files(i).name],' ');
end

%% Classify variables
% NST 2 line
n = 0;
for j = 1:length(files)
    n = n+1;
    prs{n} = ds{1,j}.data(:,2);
    temp{n} = ds{1,j}.data(:,3);
    cndctvty{n} = ds{1,j}.data(:,4);
    sal{n} = ds{1,j}.data(:,5);
    lat{n} = ds{1,j}.data(:,6);
    lon{n} = ds{1,j}.data(:,7);
    fl{n} = ds{1,j}.data(:,8);
    dnsty{n} = ds{1,j}.data(:,10);
    TEMP{n} = ds{1,j}.data(:,11);
    do{n} = ds{1,j}.data(:,14);
end

%% Creat a Nan matrix and put data
% NST 2 line
for h = 1:length(files)
    ds_size(h) = max(size(ds{1,h}));
end
num_max_row = max(ds_size);prs_cllcted = nan(num_max_row,length(ds_size));
TEMP_cllcted = nan(num_max_row,length(ds_size));sal_cllcted = nan(num_max_row,length(ds_size));
do_cllcted = nan(num_max_row,length(ds_size));dnsty_cllcted = nan(num_max_row,length(ds_size));
cndctvty_cllcted = nan(num_max_row,length(ds_size));fl_cllcted = nan(num_max_row,length(ds_size));
lon_cllcted = nan(num_max_row,length(ds_size));lat_cllcted = nan(num_max_row,length(ds_size));

%% Assign each variable
% NST 2 line
for g = 1:length(files)
    TEMP_cllcted(prs{g},g) = TEMP{1,g};
    sal_cllcted(prs{g},g) = sal{1,g};
    do_cllcted(prs{g},g) = do{1,g};
    dnsty_cllcted(prs{g},g) = dnsty{1,g};
    cndctvty_cllcted(prs{g},g) = cndctvty{1,g};
    fl_cllcted(prs{g},g) = fl{1,g};
    lon_cllcted(prs{g},g) = lon{1,g};
    lat_cllcted(prs{g},g) = lat{1,g};
    prs_cllcted(prs{g},g) = prs{1,g};
end

% Replace zero with nan
TEMP_cllcted(TEMP_cllcted == 0) = nan;
sal_cllcted(sal_cllcted == 0) = nan;
do_cllcted(do_cllcted == 0) = nan;
dnsty_cllcted(dnsty_cllcted == 0) = nan;
cndctvty_cllcted(cndctvty_cllcted == 0) = nan;
fl_cllcted(fl_cllcted == 0) = nan;

%% Detect error value and replace it with regular one
[num_of_row_lat num_of_col_lat] = size(lat_cllcted);
for i = 1:num_of_row_lat
    for j = 1:num_of_col_lat
        if lat_cllcted(i,j) < 0
            idx_lat_err = find(lat_cllcted(:,j) < 0);
            lat_cllcted(idx_lat_err,j) = lat_cllcted(max(idx_lat_err)+3,j);
        end
        
        if lon_cllcted(i,j) < 0
            idx_lon_err = find(lon_cllcted(:,j) < 0);
            lon_cllcted(idx_lon_err,j) = lon_cllcted(max(idx_lon_err)+3,j);
        end
    end
end

%% Detect unrecorded location info and fill them with reasonable values
lat_cllcted(lat_cllcted == 0) = nan; lon_cllcted(lon_cllcted == 0) = nan;
[m_sz n_sz] = size(lat_cllcted);
for i = 1:n_sz
    if isnan(nanmean(lat_cllcted(:,i))) == 1 
        prs_cllcted(prs_cllcted == 0)  = nan;
        prs_cllcted_nandroped = find(isnan(prs_cllcted(:,i)) == 0);
        fst_elmt = min(prs_cllcted_nandroped);
        lst_elmt = max(prs_cllcted_nandroped);
        sam1 = lat_cllcted(:,i-1);sam2 = lat_cllcted(:,i+1);
        sam1(sam1 == 0) = nan;sam2(sam2 == 0) = nan;
        sam1_mn = nanmean(sam1);sam2_mn = nanmean(sam2);
        target_lat = (sam1_mn + sam2_mn)/2;
        lat_cllcted(fst_elmt:lst_elmt,i) = target_lat;
        sam3 = lon_cllcted(:,i-1);sam4 = lon_cllcted(:,i+1);
        sam3(sam3 == 0) = nan;sam4(sam4 == 0) = nan;
        sam3_mn = nanmean(sam3);sam4_mn = nanmean(sam4);
        target_lon = (sam3_mn + sam4_mn)/2;
        lon_cllcted(fst_elmt:lst_elmt,i) = target_lon;
    elseif isnan(nanmean(lat_cllcted(:,i))) == 0
        sprintf('%d col no prob',i)
    end                
end

%% Replace unreasonable location info
for i = 1:m_sz
    testset_for_mntnus_lat = lat_cllcted(i,:);
    testset_for_mntnus_lon = lon_cllcted(i,:);
    if std(testset_for_mntnus_lat) > 0.2
        lat_cllcted(i,:) = nan;
        lat_cllcted(i,:) = lat_cllcted(i-1,:);
    end
    if std(testset_for_mntnus_lon) > 0.2
        lon_cllcted(i,:) = nan;
        lon_cllcted(i,:) = lon_cllcted(i-1,:);
    end
end

%% Make x and y have 2D
for i = 1:n_sz
    lat_mcllcted_nst2(i) = nanmean(lat_cllcted(:,i));
    lon_mcllcted_nst2(i) = nanmean(lon_cllcted(:,i));
end
for i = 1:n_sz
    prs_length(i) = length(prs{1,i});
end
idx_prs = find(prs_length == max(prs_length));
[mlon_nst2 mprs_nst2] = meshgrid(lon_mcllcted_nst2,prs{1,idx_prs}(:,1)); %arbitrary chosen

%% Bottom topography
lon_for_bathy_nst2 = linspace(min(lon_mcllcted_nst2),max(lon_mcllcted_nst2),100);
lat_for_bathy_nst2 = linspace(max(lat_mcllcted_nst2),min(lat_mcllcted_nst2),100);

for i = 1:length(lon_for_bathy_nst2)
    [BATHY_nst2(i),XGRID_nst2(i),YGRID_nst2(i)] = gebconetcdf('C:\matlib\gebco_2021\gebco_08.nc',lon_for_bathy_nst2(i),lon_for_bathy_nst2(i),lat_for_bathy_nst2(i),lat_for_bathy_nst2(i));
end

%% Plot
% NST 2 line 
figure;hold on;set(gcf,'position',[252 42 1271 954]);
ax(1) = subplot(2,2,1);
pcolor(mlon_nst2,mprs_nst2,TEMP_cllcted(mprs_nst2(1,1):end,:));shading interp;hold on;
colormap('jet');
set(gca,'YDir','reverse');
[c1 h1] = contour(mlon_nst2,mprs_nst2,TEMP_cllcted(mprs_nst2(1,1):end,:),[0:0.1:1 5:1.5:20],'-w','LabelSpacing',1000);
clabel(c1,h1,'color','w');
xline(lon_mcllcted_nst2,'-r',{'NST2-2','NST2-3','NST2-4','NST2-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',15);
xlim([min(lon_mcllcted_nst2) max(lon_mcllcted_nst2)]);
xtickformat('%.2f');
ylim([0 500]);
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 11;
title(h,'[\circC]','Fontname','Times New Roman','fontweight','b','FontSize',13);
title('Potential temperature','Fontname','Times New Roman','FontWeight','b','FontSize',22);
set(ax(1).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',15);
set(ax(1).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',15);
xlabel('Longitude (^oE)','Fontname','Times New Roman','FontWeight','b','FontSize',18);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',18);
area(lon_for_bathy_nst2,-BATHY_nst2,max(mprs_nst2(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(2) = subplot(2,2,2);
pcolor(mlon_nst2,mprs_nst2,sal_cllcted(mprs_nst2(1,1):end,:));shading interp;hold on;
colormap('jet');
set(gca,'YDir','reverse');
caxis([34.0 34.5]);
[c1 h1] = contour(mlon_nst2,mprs_nst2,sal_cllcted(mprs_nst2(1,1):end,:),[34:0.1:34.5],'-w','LabelSpacing',1000);
clabel(c1,h1,'color','w');
xline(lon_mcllcted_nst2,'-r',{'NST2-2','NST2-3','NST2-4','NST2-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',15);
xlim([min(lon_mcllcted_nst2) max(lon_mcllcted_nst2)]);
xtickformat('%.2f');
ylim([0 500]);
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 11;
h.Ruler.TickLabelFormat = '%.2f';
title(h,'[psu]','Fontname','Times New Roman','FontWeight','b','FontSize',13);
title('Practical salinity','Fontname','Times New Roman','FontWeight','b','FontSize',22);
set(ax(2).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',15);
set(ax(2).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',15);
xlabel('Longitude (^oE)','Fontname','Times New Roman','FontWeight','b','FontSize',18);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',18);
area(lon_for_bathy_nst2,-BATHY_nst2,max(mprs_nst2(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(3) = subplot(2,2,3);
pcolor(mlon_nst2,mprs_nst2,dnsty_cllcted(mprs_nst2(1,1):end,:));shading interp;hold on;
colormap('jet');
set(gca,'YDir','reverse');
caxis([24.5 27.5]);
[c1 h1] = contour(mlon_nst2,mprs_nst2,dnsty_cllcted(mprs_nst2(1,1):end,:),[24.5:0.5:27.5],'-w','LabelSpacing',1000);
clabel(c1,h1,'color','w');
xline(lon_mcllcted_nst2,'-r',{'NST2-2','NST2-3','NST2-4','NST2-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',15);
xlim([min(lon_mcllcted_nst2) max(lon_mcllcted_nst2)]);
xtickformat('%.2f');
ylim([0 500]);
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 11;
h.Ruler.TickLabelFormat = '%.1f';
title(h,'[kg/m^3]','Fontname','Times New Roman','FontWeight','b','FontSize',13);
title('Potential density','Fontname','Times New Roman','FontWeight','b','FontSize',22);
set(ax(3).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',15);
set(ax(3).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',15);
xlabel('Longitude (^oE)','Fontname','Times New Roman','FontWeight','b','FontSize',18);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',18);
area(lon_for_bathy_nst2,-BATHY_nst2,max(mprs_nst2(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(4) = subplot(2,2,4);
pcolor(mlon_nst2,mprs_nst2,fl_cllcted(mprs_nst2(1,1):end,:));shading interp;hold on;
colormap('jet');
set(gca,'YDir','reverse');
caxis([0 0.9]);
[c1 h1] = contour(mlon_nst2,mprs_nst2,fl_cllcted(mprs_nst2(1,1):end,:),[0.2 0.3],'-w','LabelSpacing',1000);
clabel(c1,h1,'color','w');
xline(lon_mcllcted_nst2,'-r',{'NST2-2','NST2-3','NST2-4','NST2-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',15);
xlim([min(lon_mcllcted_nst2) max(lon_mcllcted_nst2)]);
xtickformat('%.2f');
ylim([0 500]);
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 11;
h.Ruler.TickLabelFormat = '%.1f';
title(h,'[mg/m^3]','Fontname','Times New Roman','FontWeight','b','FontSize',13);
title('Fluorescence','Fontname','Times New Roman','FontWeight','b','FontSize',22);
set(ax(4).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',15);
set(ax(4).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',15);
xlabel('Longitude (^oE)','Fontname','Times New Roman','FontWeight','b','FontSize',18);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',18);
area(lon_for_bathy_nst2,-BATHY_nst2,max(mprs_nst2(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

%% Get a geostrophic component
clc;clear all;close all;
cd('C:\Users\USER\OneDrive\Desktop\data\MJES\38_MJES_202111_Haeyang_ES\CTD\processed\10_ascii\down')
files = dir('nst2*.asc');

%% Load each dataset from P
n = 0;
for i = 1:length(files)
    n = n+1;
    ds_NST2_CTD_target{n} = importdata(files(i).name);
end

%% Get maximum size of row of each column
for i = 1:length(files)
    num_of_row_max_NST2(i) = max(size(ds_NST2_CTD_target{1,i}));
end

%% Assign pressure
for i = 1:length(files)
    prs_NST2{i} = ds_NST2_CTD_target{1,i}.data(:,2);
end

%% Creat nan matrix for each variable
prs_new_NST2 = nan(max(num_of_row_max_NST2),length(files));
potemp_new_NST2 = nan(max(num_of_row_max_NST2),length(files));
psal_new_NST2 = nan(max(num_of_row_max_NST2),length(files));

%% Assign rest variables
for i = 1:length(files)
    prs_new_NST2(prs_NST2{1,i},i) = ds_NST2_CTD_target{1,i}.data(:,2);
    potemp_new_NST2(prs_NST2{1,i},i) = ds_NST2_CTD_target{1,i}.data(:,11);
    psal_new_NST2(prs_NST2{1,i},i) = ds_NST2_CTD_target{1,i}.data(:,5);
end

%% Slice some rows to make a consistent form of matrix(otherwise errors hit)
for i = 1:length(files)
    ga_NST2(3:102,i) = sw_gpan(psal_new_NST2(3:102,i),potemp_new_NST2(3:102,i),prs_new_NST2(3:102,i));
end

%% Assign lat, lon from VS, VP CTD data
for i = 1:length(files)
    lat_NST2{i} = ds_NST2_CTD_target{1,i}.data(19,6);
    lon_NST2{i} = ds_NST2_CTD_target{1,i}.data(19,7);
end

%% Convert them into a double form
lat_NST2 = cell2mat(lat_NST2);
lon_NST2 = cell2mat(lon_NST2);

%% Calculate geostrophic velocity
gvel_NST2 = sw_gvel(ga_NST2,lat_NST2,lon_NST2);

%% Level of no motion (lnm)
[m_gvel_NST2 n_gvel_NST2] = size(gvel_NST2);
for i = 1:n_gvel_NST2
    if gvel_NST2(end,i) < 0
        gvel_NST2(4:end,i) = gvel_NST2(4:end,i) + abs(gvel_NST2(m_gvel_NST2,i));
    elseif gvel_NST2(end,i) > 0
        gvel_NST2(4:end,i) = gvel_NST2(4:end,i) - abs(gvel_NST2(m_gvel_NST2,i));
    end
end

%% Find middle points of each lon
for i = 1:length(lon_NST2)-1
    lon_mean_NST2(i) = (lon_NST2(i)+lon_NST2(i+1))./2;
end

%% Define new meshgrids
[mlon_NST2 mdepth_NST2] = meshgrid(lon_mean_NST2,prs_new_NST2(3:102,2));

%% Plot
figure;set(gcf,'position',[403 42 1149 954]);
ax(2) = subplot(2,2,2);
pcolor(mlon_NST2,mdepth_NST2,gvel_NST2(3:end,:));shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_NST2,mdepth_NST2,gvel_NST2(3:end,:),[-0.7:0.1:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lon_mcllcted_nst2,'-r',{'NST2-2','NST2-3','NST2-4','NST2-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',15);
xlim([min(lon_mcllcted_nst2) max(lon_mcllcted_nst2)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar;h.FontWeight = 'b';h.FontSize = 20;h.FontName = 'Times New Roman';h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','FontName','Times New Roman','FontWeight','b','FontSize',17);
title('NST2','FontName','Times New Roman','FontWeight','b','FontSize',35);
set(ax(2).XAxis,'FontName','Times New Roman','FontWeight','b','FontSize',17);
set(ax(2).YAxis,'FontName','Times New Roman','FontWeight','b','FontSize',17);
xlabel('Longitude (^oE)','FontName','Times New Roman','FontSize',30,'FontWeight','b');
% ylabel('Pressure (db)','FontName','Times New Roman','FontSize',30,'FontWeight','b');
area(lon_for_bathy_nst2,-BATHY_nst2,max(mprs_nst2(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);












