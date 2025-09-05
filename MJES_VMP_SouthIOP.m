clc;clear all;close all;

%% Buoyancy Frequency
[SA_VB, in_ocean_VB] = gsw_SA_from_SP(sal_cllcted,prs_cllcted,lon_cllcted,lat_cllcted);
CT_VB = gsw_CT_from_pt(SA_VB,TEMP_cllcted);
[N2_VB, p_mid_VB] = gsw_Nsquared(SA_VB,CT_VB,prs_cllcted,lat_cllcted);

[SA_VP, in_ocean_VP] = gsw_SA_from_SP(sal_cllcted,prs_cllcted,lon_cllcted,lat_cllcted);
CT_VP = gsw_CT_from_pt(SA_VP,TEMP_cllcted);
[N2_VP, p_mid_VP] = gsw_Nsquared(SA_VP,CT_VP,prs_cllcted,lat_cllcted);

[SA_VS1, in_ocean_VS1] = gsw_SA_from_SP(sal_cllcted,prs_cllcted,lon_cllcted,lat_cllcted);
CT_VS1 = gsw_CT_from_pt(SA_VS1,TEMP_cllcted);
[N2_VS1, p_mid_VS1] = gsw_Nsquared(SA_VS1,CT_VS1,prs_cllcted,lat_cllcted);

[SA_VS2, in_ocean_VS2] = gsw_SA_from_SP(sal_cllcted,prs_cllcted,lon_cllcted,lat_cllcted);
CT_VS2 = gsw_CT_from_pt(SA_VS2,TEMP_cllcted);
[N2_VS2, p_mid_VS2] = gsw_Nsquared(SA_VS2,CT_VS2,prs_cllcted,lat_cllcted);

[SA_VS3, in_ocean_VS3] = gsw_SA_from_SP(sal_cllcted,prs_cllcted,lon_cllcted,lat_cllcted);
CT_VS3 = gsw_CT_from_pt(SA_VS3,TEMP_cllcted);
[N2_VS3, p_mid_VS3] = gsw_Nsquared(SA_VS3,CT_VS3,prs_cllcted,lat_cllcted);

%% Plot
% VB line
figure;set(gcf,'position',[1783 42 621 954]);
ax(1) = subplot(1,1,1);
pcolor(mlat,mprs,N2_VB(3:end,:));shading interp;hold on;
CT = cbrewer('seq','Reds',50,'linear');
colormap(CT);
set(gca,'YDir','reverse');
caxis([0 0.0017]);
[c1 h1] = contour(mlat,mprs,N2_VB(3:end,:),[0.0002:0.0004:0.0006],'-k','LabelSpacing',1000);
clabel(c1,h1,'color','k');
hold off;
xline(lat_cllcted(18,:),'-r', ...
    {'VB1','VB4','VB7','VB11','VB13','VB17','VB21','VB23','VB25','VB26'},'LineWidth',.5, ...
    'FontSize',15,'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
ylim([0 426]);
xtickformat('%.2f');
h = colorbar; 
title('N^2','fontweight','b','fontsize',30);
h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontweight','b','fontsize',20);
h.FontWeight = 'b';h.FontSize = 20;
set(ax(1).XAxis,'FontWeight','b','fontsize',22);
set(ax(1).YAxis,'FontWeight','b','fontsize',22);
ylabel('Depth (m)','fontsize',30,'fontweight','b');
xlabel('Latitude (^oN)','fontsize',30,'fontweight','b');

% VP line
ax(1) = subplot(1,1,1);
pcolor(mlon,mprs,N2_VP(2:end,:));shading interp;hold on;
CT = cbrewer('seq','Reds',50,'linear');
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Pressure (db)','fontsize',22,'fontweight','b');
xlabel('Longitude (^oE)','fontsize',22,'fontweight','b');
caxis([0 0.0017]);
[c1 h1] = contour(mlon,mprs,N2_VP(2:end,:),[0.0002:0.0004:0.0006],'-k','LabelSpacing',1000);
clabel(c1,h1,'color','k');
hold off;
xline(lon_cllcted(18,:),'-r', ...
    {'VP3','VP7','VP11','VP15','VP19'},'LineWidth',.5, 'FontSize',15, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
ylim([0 150]);
xtickformat('%.2f');
h = colorbar; 
title('N^2 at VP line','fontweight','b','fontsize',25);
h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontweight','b','fontsize',15);
h.FontWeight = 'b';h.FontSize = 15;
set(ax(1).XAxis,'FontWeight','b','fontsize',18);
set(ax(1).YAxis,'FontWeight','b','fontsize',18);

% VS1 line (VS25_VS1_straight)
ax(1) = subplot(1,1,1);
pcolor(mlon,mprs,N2_VS1(2:end,:));shading interp;hold on;
CT = cbrewer('seq','Reds',50,'linear');
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Pressure (db)','fontsize',22,'fontweight','b');
xlabel('Longitude (^oE)','fontsize',22,'fontweight','b');
caxis([0 0.0017]);
[c1 h1] = contour(mlon,mprs,N2_VS1(2:end,:),[0.0002:0.0004:0.0006],'-k','LabelSpacing',1000);
clabel(c1,h1,'color','k');
hold off;
xline(lon_cllcted(18,:),'-r', ...
    {'VS25','V15','VS13','VS3','VS1'},'LineWidth',.5, 'FontSize',15, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
ylim([0 176]);
xtickformat('%.2f');
h = colorbar; 
title('N^2 at VS1 line','fontweight','b','fontsize',25);
h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontweight','b','fontsize',15);
h.FontWeight = 'b';h.FontSize = 15;
set(ax(1).XAxis,'FontWeight','b','fontsize',18);
set(ax(1).YAxis,'FontWeight','b','fontsize',18);

% VS2 line (VS23_VB21_straight)
ax(1) = subplot(1,1,1);
pcolor(mlon,mprs,N2_VS2(3:end,:));shading interp;hold on;
CT = cbrewer('seq','Reds',50,'linear');
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Pressure (db)','fontsize',22,'fontweight','b');
xlabel('Longitude (^oE)','fontsize',22,'fontweight','b');
caxis([0 0.0017]);
[c1 h1] = contour(mlon,mprs,N2_VS2(3:end,:),[0.0002:0.0004:0.0006],'-k','LabelSpacing',1000);
clabel(c1,h1,'color','k');
hold off;
xline(lon_cllcted(18,:),'-r', ...
    {'VS23','VS17','VS11','VS5','VB21'},'LineWidth',.5, 'FontSize',15, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
ylim([0 228]);
xtickformat('%.2f');
h = colorbar; 
title('N^2 at VS2 line','fontweight','b','fontsize',25);
h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontweight','b','fontsize',15);
h.FontWeight = 'b';h.FontSize = 15;
set(ax(1).XAxis,'FontWeight','b','fontsize',18);
set(ax(1).YAxis,'FontWeight','b','fontsize',18);

% VS3 line (VS21_VB26_straight)
ax(1) = subplot(1,1,1);
pcolor(mlon,mprs,N2_VS3(2:end,:));shading interp;hold on;
CT = cbrewer('seq','Reds',50,'linear');
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Pressure (db)','fontsize',22,'fontweight','b');
xlabel('Longitude (^oE)','fontsize',22,'fontweight','b');
caxis([0 0.0017]);
[c1 h1] = contour(mlon,mprs,N2_VS3(2:end,:),[0.0002 0.0002],'-k','LabelSpacing',1000);
clabel(c1,h1,'color','k');
hold off;
xline(lon_cllcted(18,:),'-r', ...
    {'VS21','VS19','VS9','VS7','VB26'},'LineWidth',.5, 'FontSize',15, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
ylim([0 510]);
xtickformat('%.2f');
h = colorbar; 
title('N^2 at VS3 line','fontweight','b','fontsize',25);
h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontweight','b','fontsize',15);
h.FontWeight = 'b';h.FontSize = 15;
set(ax(1).XAxis,'FontWeight','b','fontsize',18);
set(ax(1).YAxis,'FontWeight','b','fontsize',18);

%%  Vertical velocity from LADCP
cd('C:\Users\USER\OneDrive\Desktop\data\MJES\MJES_KOR\LADCP\processed')
files_LADCP = dir('VB*.mat');
n = 0;
for i = [1 9 10 2:1:8]
    n = n+1;
    VB{n} = load(files_LADCP(i).name);
end
for i = 1:10
    VB_u{i} = VB{1,i}.dr.u;
    VB_v{i} = VB{1,i}.dr.v;
    VB_z{i} = VB{1,i}.dr.z;
end
for i = 1:10
    VB_z_rdd{i} = round(VB_z{1,i}); % rdd: rounded
end
for i = 1:10
    VB_z_new(:,i) = 1:1:427;
    VB_u_new(:,i) = interp1(VB_z_rdd{1,i},VB_u{1,i},VB_z_new(:,i));
    VB_v_new(:,i) = interp1(VB_z_rdd{1,i},VB_v{1,i},VB_z_new(:,i));
end

% Define grid
[mlat_LADCP mdepth_LADCP] = meshgrid(lat_cllcted(20,:),VB_z_new(:,1));

% VB line of LADCP
ax(1) = subplot(1,2,1);
pcolor(mlat_LADCP,mdepth_LADCP,VB_u_new);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.9 0.9]);
[c1 h1] = contour(mlat_LADCP,mdepth_LADCP,VB_u_new,[-0.9:0.1:0.9],'-k','LabelSpacing',1000);
clabel(c1,h1,'color','k');
hold off;
xline(lat_cllcted(18,:),'-r', ...
    {'VB1','VB4','VB7','VB11','VB13','VB17','VB21','VB23','VB25','VB26'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
xlim([35.2003 35.6118]);
ylim([0 427]);
xtickformat('%.2f');
h = colorbar; 
title('u','fontweight','b','fontsize',30);
h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','fontweight','b','fontsize',20);
h.FontWeight = 'b';h.FontSize = 20;
set(ax(1).XAxis,'FontWeight','b','fontsize',22);
set(ax(1).YAxis,'FontWeight','b','fontsize',22);
ylabel('Depth (m)','fontsize',30,'fontweight','b');
xlabel('Latitude (^oN)','fontsize',30,'fontweight','b');

ax(2) = subplot(1,2,2);
pcolor(mlat_LADCP,mdepth_LADCP,VB_v_new);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.9 0.9]);
[c1 h1] = contour(mlat_LADCP,mdepth_LADCP,VB_v_new,[-0.9:0.1:0.9],'-k','LabelSpacing',1000);
clabel(c1,h1,'color','k');
hold off;
xline(lat_cllcted(18,:),'-r', ...
    {'VB1','VB4','VB7','VB11','VB13','VB17','VB21','VB23','VB25','VB26'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
xlim([35.2003 35.6118]);
ylim([0 427]);
xtickformat('%.2f');
h = colorbar;
title('v','fontweight','b','fontsize',30);
h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','fontweight','b','fontsize',20);
h.FontWeight = 'b';h.FontSize = 20;
set(ax(2).XAxis,'FontWeight','b','fontsize',22);
set(ax(2).YAxis,'FontWeight','b','fontsize',22);
ylabel('Depth (m)','fontsize',30,'fontweight','b');
xlabel('Latitude (^oN)','fontsize',30,'fontweight','b');

%% Richardson Number
% Denominator for Ri
[FX_u FY_u] = gradient(VB_u_new);
[FX_v FY_v] = gradient(VB_v_new);
FY_u = -FY_u;
FY_v = -FY_v;
FY_u_squared = FY_u.^2;
FY_v_squared = FY_v.^2;

% Numerator for Ri
% N2_VB_for_Ri = N2_VB(3:272,:);

% Mask redundant data
for i = 1:427
    for j = 1:10
        target_Ri = N2_VB(i,j)/(FY_u_squared(i,j) + FY_v_squared(i,j));
        if target_Ri < 0
            Ri(i,j) = 999e+99;
        else
            Ri(i,j) = target_Ri;
        end
     end
end

% Plot velocity shear
figure;set(gcf,'position',[1783 42 621 954]);
ax(1) = subplot(1,1,1);
pcolor(mlat_LADCP,mdepth_LADCP,FY_u_squared+FY_v_squared);shading interp;hold on;
c1 = colormap('jet');
set(gca,'YDir','reverse');
caxis([0 0.0012]);
[c1 h1] = contour(mlat_LADCP,mdepth_LADCP,FY_u_squared+FY_v_squared,[0:0.0006:0.0012],'-k','LabelSpacing',1000);
clabel(c1,h1,'color','k');
hold off;
xline(lat_cllcted(18,:),'-r', ...
    {'VB1','VB4','VB7','VB11','VB13','VB17','VB21','VB23','VB25','VB26'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
xlim([35.2003 35.6118]);
ylim([0 427]);
xtickformat('%.2f');
h = colorbar; 
title('Velocity shear','fontweight','b','fontsize',30);
h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontweight','b','fontsize',20);
h.FontWeight = 'b';h.FontSize = 20;
set(ax(1).XAxis,'FontWeight','b','fontsize',22);
set(ax(1).YAxis,'FontWeight','b','fontsize',22);
ylabel('Depth (m)','fontsize',30,'fontweight','b');
xlabel('Latitude (^oN)','fontsize',30,'fontweight','b');

% Plot Richardson number
figure;set(gcf,'position',[1783 42 621 954]);
ax(1) = subplot(1,1,1);
pcolor(mlat_LADCP,mdepth_LADCP,Ri);shading interp;hold on;
CT = flip(cbrewer('seq','OrRd',50,'linear'),1);
c2 = colormap(CT);
set(gca,'YDir','reverse');
caxis([0 2.5]);
[c1 h1] = contour(mlat_LADCP,mdepth_LADCP,Ri,[0.25:0.01:0.26],'-k','LabelSpacing',1000);
clabel(c1,h1,'color','k');
hold off;
xline(lat_cllcted(18,:),'-r', ...
    {'VB1','VB4','VB7','VB11','VB13','VB17','VB21','VB23','VB25','VB26'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
xlim([35.2003 35.6118]);
ylim([0 427]);
xtickformat('%.2f');
h = colorbar; 
title('Ri','fontweight','b','fontsize',30);
h.Ruler.TickLabelFormat = '%.1f';
title(h,' ','fontweight','b','fontsize',20);
h.FontWeight = 'b';h.FontSize = 20;
set(ax(1).XAxis,'FontWeight','b','fontsize',22);
set(ax(1).YAxis,'FontWeight','b','fontsize',22);
ylabel('Depth (m)','fontsize',30,'fontweight','b');
xlabel('Latitude (^oN)','fontsize',30,'fontweight','b');



















