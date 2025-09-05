clc;clear all;close all;

%% Set the path to load files
cd('C:\Users\USER\OneDrive\Desktop\data\MJES\MJES_KOR\CTD_prcssed\10_asciiout')
files = dir('P*.asc');

%% Define each variable
ds = {};temp = {};sal = {};prs = {};dnsty = {};do = {};
cndctvty = {};lat = {};lon = {};TEMP = {};fl = {};

%% Put files into dataset according to location
% P line
n = 0;
for i = 1:length(files)
    n = n+1;
    ds{n} = importdata([files(i).folder,'\',files(i).name],' ');
end

%% Classify variables
% P line
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
% P line
for h = 1:length(files)
    ds_size(h) = max(size(ds{1,h}));
end
num_max_row = max(ds_size);prs_cllcted = nan(num_max_row,length(ds_size));
TEMP_cllcted = nan(num_max_row,length(ds_size));sal_cllcted = nan(num_max_row,length(ds_size));
do_cllcted = nan(num_max_row,length(ds_size));dnsty_cllcted = nan(num_max_row,length(ds_size));
cndctvty_cllcted = nan(num_max_row,length(ds_size));fl_cllcted = nan(num_max_row,length(ds_size));
lon_cllcted = nan(num_max_row,length(ds_size));lat_cllcted = nan(num_max_row,length(ds_size));

%% Assign each variable
% P line
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
    lat_mcllcted(i) = nanmean(lat_cllcted(:,i));
    lon_mcllcted(i) = nanmean(lon_cllcted(:,i));
end
for i = 1:n_sz
    prs_length(i) = length(prs{1,i});
end
idx_prs = find(prs_length == max(prs_length));
[mlat mprs] = meshgrid(lat_mcllcted,prs{1,idx_prs}(:,1)); %arbitrary chosen

%% Bottom topography
lon_for_bathy = linspace(min(lon_mcllcted),max(lon_mcllcted),100);
lat_for_bathy = linspace(min(lat_mcllcted),max(lat_mcllcted),100);

for i = 1:length(lon_for_bathy)
    [BATHY(i),XGRID(i),YGRID(i)] = gebconetcdf('C:\matlib\gebco_2021\gebco_08.nc',lon_for_bathy(i),lon_for_bathy(i),lat_for_bathy(i),lat_for_bathy(i));
end

%% Buoyancy Frequency
[SA_P, in_ocean_P] = gsw_SA_from_SP(sal_cllcted,prs_cllcted,lon_cllcted,lat_cllcted);
CT_P = gsw_CT_from_pt(SA_P,TEMP_cllcted);
[N2_P, p_mid_P] = gsw_Nsquared(SA_P,CT_P,prs_cllcted,lat_cllcted);

%% Get a geostrophic component
n = 0;
for i = 1:length(files)
    n = n+1;
    ds_P_CTD_target{n} = importdata(files(i).name);
end

%% Get maximum size of row of each column
for i = 1:length(files)
    num_of_row_max_P(i) = max(size(ds_P_CTD_target{1,i}));
end

%% Assign pressure
for i = 1:length(files)
    prs_P{i} = ds_P_CTD_target{1,i}.data(:,2);
end

%% Creat nan matrix for each variable
prs_new_P = nan(max(num_of_row_max_P),length(files));
potemp_new_P = nan(max(num_of_row_max_P),length(files));
psal_new_P = nan(max(num_of_row_max_P),length(files));

%% Assign rest variables
for i = 1:length(files)
    prs_new_P(prs_P{1,i},i) = ds_P_CTD_target{1,i}.data(:,2);
    potemp_new_P(prs_P{1,i},i) = ds_P_CTD_target{1,i}.data(:,11);
    psal_new_P(prs_P{1,i},i) = ds_P_CTD_target{1,i}.data(:,5);
end

%% Slice some rows to make a consistent form of matrix(otherwise errors hit)
for i = 1:length(files)
    ga_P(4:125,i) = sw_gpan(psal_new_P(4:125,i),potemp_new_P(4:125,i),prs_new_P(4:125,i));
end

%% Assign lat, lon from VS, VP CTD data
for i = 1:length(files)
    lat_P{i} = ds_P_CTD_target{1,i}.data(19,6);
    lon_P{i} = ds_P_CTD_target{1,i}.data(19,7);
end

%% Convert them into a double form
lat_P = cell2mat(lat_P);
lon_P = cell2mat(lon_P);

%% Calculate geostrophic velocity
gvel_P = sw_gvel(ga_P,lat_P,lon_P);

%% Level of no motion (lnm)
[m_gvel_P n_gvel_P] = size(gvel_P);
for i = 1:n_gvel_P
    if gvel_P(end,i) < 0
        gvel_P(4:end,i) = gvel_P(4:end,i) + abs(gvel_P(m_gvel_P,i));
    elseif gvel_P(end,i) > 0
        gvel_P(4:end,i) = gvel_P(4:end,i) - abs(gvel_P(m_gvel_P,i));
    end
end

%% Find middle points of each lon
for i = 1:length(lat_P)-1
    lat_mean_P(i) = (lat_P(i)+lat_P(i+1))./2;
end

%% Define new meshgrids
[mlat_P_geo mdepth_P_geo] = meshgrid(lat_mean_P,prs_new_P(4:125,2));

%% Plot
% P line
%get(gcf,'Position')
figure;hold on;set(gcf,'position',[1 1 1920 1003]);
ax(1) = subplot(2,3,1);
pcolor(mlat,mprs,TEMP_cllcted(mprs(1,1):end,:));shading interp;hold on;
colormap(ax(1),'jet');
set(gca,'YDir','reverse');
[c1 h1] = contour(mlat,mprs,TEMP_cllcted(mprs(1,1):end,:),[0:0.1:1 5:1.5:20],'-w','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','w','FontSize',11,'FontName','Times New Roman','FontWeight','b');
xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','FontName','Times New Roman','FontSize',25);
xlim([min(lat_mcllcted) max(lat_mcllcted)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 17;
title(h,'[\circC]','Fontname','Times New Roman','fontweight','b','FontSize',17);
title('Potential temperature','Fontname','Times New Roman','FontWeight','b','FontSize',25);
set(ax(1).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
set(ax(1).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',30);
area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(2) = subplot(2,3,2);
pcolor(mlat,mprs,sal_cllcted(mprs(1,1):end,:));shading interp;hold on;
colormap(ax(2),'jet');
set(gca,'YDir','reverse');
caxis([34.0 34.5]);
[c1 h1] = contour(mlat,mprs,sal_cllcted(mprs(1,1):end,:),[34:0.1:34.5],'-w','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','w','FontSize',11,'FontName','Times New Roman','FontWeight','b');
xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',25);
xlim([min(lat_mcllcted) max(lat_mcllcted)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 17;
h.Ruler.TickLabelFormat = '%.1f';
title(h,'[psu]','Fontname','Times New Roman','FontWeight','b','FontSize',17);
title('Practical salinity','Fontname','Times New Roman','FontWeight','b','FontSize',25);
set(ax(2).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
set(ax(2).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(3) = subplot(2,3,3);
pcolor(mlat,mprs,dnsty_cllcted(mprs(1,1):end,:));shading interp;hold on;
colormap(ax(3),'jet');
set(gca,'YDir','reverse');
caxis([24.5 27.5]);
[c1 h1] = contour(mlat,mprs,dnsty_cllcted(mprs(1,1):end,:),[24.5:0.25:27.5],'-w','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','w','FontSize',11,'FontName','Times New Roman','FontWeight','b');
xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',25);
xlim([min(lat_mcllcted) max(lat_mcllcted)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 17;
h.Ruler.TickLabelFormat = '%.1f';
title(h,'[kg/m^3]','Fontname','Times New Roman','FontWeight','b','FontSize',17);
title('Potential density','Fontname','Times New Roman','FontWeight','b','FontSize',25);
set(ax(3).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
set(ax(3).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(4) = subplot(2,3,4);
pcolor(mlat,p_mid_P(2:end,:),N2_P(2:end,:));shading interp;hold on;
CT = cbrewer('seq','Reds',50,'linear');
colormap(ax(4),CT);
set(gca,'YDir','reverse');
caxis([0 0.0006]);
[c1 h1] = contour(mlat,mprs,dnsty_cllcted(mprs(1,1):end,:),[24.5:0.25:27.5],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',11,'FontName','Times New Roman','FontWeight','b');
xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5,  ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center','fontname','Times New Roman','FontWeight','b','FontSize',25);
xlim([min(lat_mcllcted) max(lat_mcllcted)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; 
title('N^2','fontname','Times New Roman','fontweight','b','fontsize',25);
h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontname','Times New Roman','fontweight','b','fontsize',17);
h.FontWeight = 'b';h.FontSize = 17;h.FontName = 'Times New Roman';
set(ax(4).XAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
set(ax(4).YAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
xlabel('Latitude (^oN)','fontname','Times New Roman','fontsize',30,'fontweight','b');
ylabel('Pressure (db)','fontname','Times New Roman','fontsize',30,'fontweight','b');
area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(5) = subplot(2,3,5);
pcolor(mlat_LADCP,mdepth_LADCP,S2_P);shading interp;hold on;
c1 = colormap(ax(5),'jet');
set(gca,'YDir','reverse');
caxis([0 0.0012]);
% [c1 h1] = contour(mlat_LADCP,mdepth_LADCP,FY_u_squared+FY_v_squared,[0:0.0006:0.0012],'-k','LabelSpacing',1000);
% clabel(c1,h1,'color','k');
xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5,  ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center','fontname','Times New Roman','FontWeight','b','FontSize',25);
xlim([min(lat_mcllcted) max(lat_mcllcted)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; 
title('S^2','fontname','Times New Roman','fontweight','b','fontsize',25);
h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontname','Times New Roman','fontweight','b','fontsize',17);
h.FontWeight = 'b';h.FontSize = 17;h.FontName = 'Times New Roman';
set(ax(5).XAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
set(ax(5).YAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
xlabel('Latitude (^oN)','fontname','Times New Roman','fontsize',30,'fontweight','b');
area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(6) = subplot(2,3,6);
pcolor(mlat_LADCP,mdepth_LADCP,Ri);shading interp;hold on;
J = customcolormap([0 0.5 0.795 1],{'#ffffff','#ffffff','#0000ff','#ff0000'});
colormap(ax(6),J);
set(gca,'YDir','reverse');
caxis([0 2]);
xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5,  ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center','fontname','Times New Roman','FontWeight','b','FontSize',25);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; 
title('Ri','fontname','Times New Roman','fontweight','b','fontsize',25);
h.Ruler.TickLabelFormat = '%.1f';h.Ticks = [0 0.25 1 2];h.TickLabels = [0 0.25 1 2];
h.FontWeight = 'b';h.FontSize = 17;h.FontName = 'Times New Roman';
set(ax(6).XAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
set(ax(6).YAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
xlabel('Latitude (^oN)','fontname','Times New Roman','fontsize',30,'fontweight','b');
area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

% ax(6) = subplot(2,3,6);
% pcolor(mlat_P_geo,mdepth_P_geo,gvel_P(4:end,:));shading interp;hold on;
% CT = flip(cbrewer('div','RdBu',50,'linear'),1);
% colormap(ax(6),CT);
% set(gca,'YDir','reverse');
% caxis([-0.3 0.3001]);
% [c1 h1] = contour(mlat_P_geo,mdepth_P_geo,gvel_P(4:end,:),[-0.3:0.1:0.3],'-k','LineWidth',1.5);
% clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
% xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5,  ...
%     'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center','fontname','Times New Roman','FontWeight','b','FontSize',25);
% xlim([min(lat_mcllcted) max(lat_mcllcted)]);
% ylim([0 200]);
% xtickformat('%.2f');
% h = colorbar; 
% h.FontWeight = 'b';h.FontSize = 17;h.FontName = 'Times New Roman';
% h.Ruler.TickLabelFormat = '%.1f';
% title(h,'[m/s]','FontName','Times New Roman','FontWeight','b','FontSize',17);
% title('Geostrophic velocity','FontName','Times New Roman','FontWeight','b','FontSize',25);
% set(ax(6).XAxis,'FontName','Times New Roman','FontWeight','b','FontSize',17);
% set(ax(6).YAxis,'FontName','Times New Roman','FontWeight','b','FontSize',17);
% xlabel('Latitude (^oN)','fontname','Times New Roman','fontsize',30,'fontweight','b');
% area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
% hold off;

%% Vertical gradient of physical properties
[FX_temp FY_temp] = gradient(TEMP_cllcted);
[FX_sal FY_sal] = gradient(sal_cllcted);
[FX_dnsty FY_dnsty] = gradient(dnsty_cllcted);

%% Vertical profiles of physical properties
figure;set(gcf,'position',[201 42 1564 954]);
ax(1) = subplot(1,5,1);
[lineh_1,ax_m_1] = plotmultix(FY_dnsty(3:end,1),mprs(:,1),'-k', ...
    FY_sal(3:end,1),mprs(:,1),'-b', ...
    FY_temp(3:end,1),mprs(:,1),'-r','ydir','reverse','LineWidth',1.5);
set(ax_m_1(:,2),'ylim',[0 270]);
set(ax_m_1(1,:),'xlim',[0 0.2],'xtick',[0,0.05,0.1,0.15,0.2],'XMinorTick','off','LineWidth',1.5); 
set(ax_m_1(2,:),'xlim',[-0.06 0.06],'LineWidth',1.5); 
set(ax_m_1(3,:),'xlim',[-1 1],'LineWidth',1.5); 
set(ax_m_1(:),'FontName','Times New Roman','fontsize',14,'linewi',1.5);
set(ax(1).XAxis,'FontName','Times New Roman','FontWeight','b','fontsize',16);
set(ax(1).YAxis,'FontName','Times New Roman','FontWeight','b','fontsize',16);
xlabel(ax_m_1(1,1),'\Delta\rho (km/m^3)','FontName','Times New Roman','FontWeight','b','Fontsize',19,'Position',[0.1,291.966,-1]);
xlabel(ax_m_1(2,1),'\Deltapsu','FontName','Times New Roman','FontWeight','b','Fontsize',19);
xlabel(ax_m_1(3,1),'\Delta\theta (^oC)','FontName','Times New Roman','FontWeight','b','Fontsize',19);
ylabel('Pressure (db)','FontName','Times New Roman','FontWeight','b','Fontsize',22);
title('P1','FontName','Times New Roman','FontWeight','b','Fontsize',26);

ax(2) = subplot(1,5,2);
[lineh_2,ax_m_2] = plotmultix(FY_dnsty(3:end,2),mprs(:,2),'-k', ...
    FY_sal(3:end,2),mprs(:,2),'-b', ...
    FY_temp(3:end,2),mprs(:,2),'-r','ydir','reverse','LineWidth',1.5);
set(ax_m_2(:,2),'ylim',[0 270]);
set(ax_m_2(1,:),'xlim',[0 0.2],'xtick',[0,0.05,0.1,0.15,0.2],'XMinorTick','off','LineWidth',1.5); 
set(ax_m_2(2,:),'xlim',[-0.06 0.06],'LineWidth',1.5); 
set(ax_m_2(3,:),'xlim',[-1 1],'LineWidth',1.5); 
set(ax_m_2(:),'FontName','Times New Roman','fontsize',14,'linewi',1.5);
set(ax(2).XAxis,'FontName','Times New Roman','FontWeight','b','fontsize',16);
set(ax(2).YAxis,'FontName','Times New Roman','FontWeight','b','fontsize',16);
xlabel(ax_m_2(1,1),'\Delta\rho (km/m^3)','FontName','Times New Roman','FontWeight','b','Fontsize',19,'Position',[0.1,291.966,-1]);
xlabel(ax_m_2(2,1),'\Deltapsu','FontName','Times New Roman','FontWeight','b','Fontsize',19);
xlabel(ax_m_2(3,1),'\Delta\theta (^oC)','FontName','Times New Roman','FontWeight','b','Fontsize',19);
title('P2','FontName','Times New Roman','FontWeight','b','Fontsize',26);

ax(3) = subplot(1,5,3);
[lineh_3,ax_m_3] = plotmultix(FY_dnsty(3:end,3),mprs(:,3),'-k', ...
    FY_sal(3:end,3),mprs(:,3),'-b', ...
    FY_temp(3:end,3),mprs(:,3),'-r','ydir','reverse','LineWidth',1.5);
set(ax_m_3(:,2),'ylim',[0 270]);
set(ax_m_3(1,:),'xlim',[0 0.2],'xtick',[0,0.05,0.1,0.15,0.2],'XMinorTick','off','LineWidth',1.5); 
set(ax_m_3(2,:),'xlim',[-0.06 0.06],'LineWidth',1.5); 
set(ax_m_3(3,:),'xlim',[-1 1],'LineWidth',1.5); 
set(ax_m_3(:),'FontName','Times New Roman','fontsize',14,'linewi',1.5);
set(ax(3).XAxis,'FontName','Times New Roman','FontWeight','b','fontsize',16);
set(ax(3).YAxis,'FontName','Times New Roman','FontWeight','b','fontsize',16);
xlabel(ax_m_3(1,1),'\Delta\rho (km/m^3)','FontName','Times New Roman','FontWeight','b','Fontsize',19,'Position',[0.1,291.966,-1]);
xlabel(ax_m_3(2,1),'\Deltapsu','FontName','Times New Roman','FontWeight','b','Fontsize',19);
xlabel(ax_m_3(3,1),'\Delta\theta (^oC)','FontName','Times New Roman','FontWeight','b','Fontsize',19);
title('P3','FontName','Times New Roman','FontWeight','b','Fontsize',26);

ax(4) = subplot(1,5,4);
[lineh_4,ax_m_4] = plotmultix(FY_dnsty(3:end,4),mprs(:,4),'-k', ...
    FY_sal(3:end,4),mprs(:,4),'-b', ...
    FY_temp(3:end,4),mprs(:,4),'-r','ydir','reverse','LineWidth',1.5);
set(ax_m_4(:,2),'ylim',[0 270]);
set(ax_m_4(1,:),'xlim',[0 0.2],'xtick',[0,0.05,0.1,0.15,0.2],'XMinorTick','off','LineWidth',1.5); 
set(ax_m_4(2,:),'xlim',[-0.06 0.06],'LineWidth',1.5); 
set(ax_m_4(3,:),'xlim',[-1 1],'LineWidth',1.5); 
set(ax_m_4(:),'FontName','Times New Roman','fontsize',14,'linewi',1.5);
set(ax(4).XAxis,'FontName','Times New Roman','FontWeight','b','fontsize',16);
set(ax(4).YAxis,'FontName','Times New Roman','FontWeight','b','fontsize',16);
xlabel(ax_m_4(1,1),'\Delta\rho (km/m^3)','FontName','Times New Roman','FontWeight','b','Fontsize',19,'Position',[0.1,291.966,-1]);
xlabel(ax_m_4(2,1),'\Deltapsu','FontName','Times New Roman','FontWeight','b','Fontsize',19);
xlabel(ax_m_4(3,1),'\Delta\theta (^oC)','FontName','Times New Roman','FontWeight','b','Fontsize',19);
title('P4','FontName','Times New Roman','FontWeight','b','Fontsize',26);

ax(5) = subplot(1,5,5);
[lineh_5,ax_m_5] = plotmultix(FY_dnsty(3:end,5),mprs(:,5),'-k', ...
    FY_sal(3:end,5),mprs(:,5),'-b', ...
    FY_temp(3:end,5),mprs(:,5),'-r','ydir','reverse','LineWidth',1.5);
set(ax_m_5(:,2),'ylim',[0 270]);
set(ax_m_5(1,:),'xlim',[0 0.2],'xtick',[0,0.05,0.1,0.15,0.2],'XMinorTick','off','LineWidth',1.5); 
set(ax_m_5(2,:),'xlim',[-0.06 0.06],'LineWidth',1.5); 
set(ax_m_5(3,:),'xlim',[-1 1],'LineWidth',1.5); 
set(ax_m_5(:),'FontName','Times New Roman','fontsize',14,'linewi',1.5);
set(ax(5).XAxis,'FontName','Times New Roman','FontWeight','b','fontsize',16);
set(ax(5).YAxis,'FontName','Times New Roman','FontWeight','b','fontsize',16);
xlabel(ax_m_5(1,1),'\Delta\rho (km/m^3)','FontName','Times New Roman','FontWeight','b','Fontsize',19,'Position',[0.1,291.966,-1]);
xlabel(ax_m_5(2,1),'\Deltapsu','FontName','Times New Roman','FontWeight','b','Fontsize',19);
xlabel(ax_m_5(3,1),'\Delta\theta (^oC)','FontName','Times New Roman','FontWeight','b','Fontsize',19);
title('P5','FontName','Times New Roman','FontWeight','b','Fontsize',26);











