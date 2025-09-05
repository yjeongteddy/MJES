clc;clear all;close all;

%% Load SADCP data 
ds_sadcp = load_getmat('C:\codas_shared\unprocessed\allbins_');

%% Draw target map
% drawmap(129.4,130.0,36.2,36.8); % North IOP
% drawmap(129.4,130.4,35.0,36.0); % South IOP
% drawmap(128,131,34,37); % whole map

%% Identify ship track
% South IOP
B_line1 = m_line(ds_sadcp.lon(2624:2696),ds_sadcp.lat(2624:2696),'Color','b','linewidth',1.8);
% VS_dot1 = m_plot(ds_sadcp.lon(2624:2624), ds_sadcp.lat(2624:2624), 's', 'markersize',12, ...
%     'markerfacecolor','y','markeredgecolor','b','linestyle','none','linewidth',1.5);
% VS_dot2 = m_plot(ds_sadcp.lon(2632:2632), ds_sadcp.lat(2632:2632), 's', 'markersize',12, ...
%     'markerfacecolor','y','markeredgecolor','b','linestyle','none','linewidth',1.5);
% VS_dot3 = m_plot(ds_sadcp.lon(2643:2643), ds_sadcp.lat(2643:2643), 's', 'markersize',12, ...
%     'markerfacecolor','y','markeredgecolor','b','linestyle','none','linewidth',1.5);
% VS_dot4 = m_plot(ds_sadcp.lon(2650:2650), ds_sadcp.lat(2650:2650), 's', 'markersize',12, ...
%     'markerfacecolor','y','markeredgecolor','b','linestyle','none','linewidth',1.5);
% VS_dot5 = m_plot(ds_sadcp.lon(2661:2661), ds_sadcp.lat(2661:2661), 's', 'markersize',12, ...
%     'markerfacecolor','y','markeredgecolor','b','linestyle','none','linewidth',1.5);
% VS_dot6 = m_plot(ds_sadcp.lon(2667:2667), ds_sadcp.lat(2667:2667), 's', 'markersize',12, ...
%     'markerfacecolor','y','markeredgecolor','b','linestyle','none','linewidth',1.5);
% VS_dot7 = m_plot(ds_sadcp.lon(2678:2678), ds_sadcp.lat(2678:2678), 's', 'markersize',12, ...
%     'markerfacecolor','y','markeredgecolor','b','linestyle','none','linewidth',1.5);
% VS_dot8 = m_plot(ds_sadcp.lon(2684:2684), ds_sadcp.lat(2684:2684), 's', 'markersize',12, ...
%     'markerfacecolor','y','markeredgecolor','b','linestyle','none','linewidth',1.5);
% VS_dot9 = m_plot(ds_sadcp.lon(2696:2696), ds_sadcp.lat(2696:2696), 's', 'markersize',12, ...
%     'markerfacecolor','y','markeredgecolor','b','linestyle','none','linewidth',1.5);
B_line2 = m_line(ds_sadcp.lon(2696:2721),ds_sadcp.lat(2696:2721),'Color','b','linewidth',1.8);
% P_dot7 = m_plot(ds_sadcp.lon(2696:2696), ds_sadcp.lat(2696:2696), 's', 'markersize',12, ...
%     'markerfacecolor','y','markeredgecolor','b','linestyle','none','linewidth',1.5);
% P_dot7 = m_plot(ds_sadcp.lon(2721:2721), ds_sadcp.lat(2721:2721), 's', 'markersize',12, ...
%     'markerfacecolor','y','markeredgecolor','b','linestyle','none','linewidth',1.5);
Bline3 =  m_line(ds_sadcp.lon(3432:3510),ds_sadcp.lat(3432:3510),'Color','b','linewidth',1.8);
% P_dot7 = m_plot(ds_sadcp.lon(3432:3432), ds_sadcp.lat(3432:3432), 's', 'markersize',12, ...
%     'markerfacecolor','y','markeredgecolor','b','linestyle','none','linewidth',1.5);
% P_dot7 = m_plot(ds_sadcp.lon(3510:3510), ds_sadcp.lat(3510:3510), 's', 'markersize',12, ...
%     'markerfacecolor','y','markeredgecolor','b','linestyle','none','linewidth',1.5);
% P_dot7 = m_plot(ds_sadcp.lon(2385:3535), ds_sadcp.lat(2385:3535), 's', 'markersize',5, ...
%     'markerfacecolor','y','markeredgecolor','r','linestyle','none','linewidth',1.5);

% 1673:1692 half_of_VB_line_South_to_North
% 2385:2405 % Another_half_of_VB_line_North_to_South_closer_to_continental_slope
% 2624:2696 SouthIOP_zigzag
% 2696:2721 SouthIOP_from_VS1_to_VS25_straight
% 3432:3510 SouthIOP_from_VP3_to_VP19
% 1066:1120 SouthIOP_from_VS1_to_VS25_1st_of_3_same_route_diff_from_upper_one % Barny TRBM
% Same but 2nd one 1261:1285 % SE -> NW
% same but 3rd one 1286:1311 % NW -> SE

%% Get target depth, trail, and time
% close all;
depth_idxed = 1:30; % surface ~ 250m
trail_idxed_1 = 2696:2721; % SouthIOP_from_VS1_to_VS25_straight
depth_target_1 = ds_sadcp.depth(depth_idxed,trail_idxed_1);
lon_target_1 = ds_sadcp.lon(1,trail_idxed_1);
lat_target_1 = ds_sadcp.lat(1,trail_idxed_1);
u_target_1 = ds_sadcp.u(depth_idxed,trail_idxed_1);
v_target_1 = ds_sadcp.v(depth_idxed,trail_idxed_1);
time_target_1 = ds_sadcp.time(1:6,trail_idxed_1);

trail_idxed_2 = 3432:3510; % SouthIOP_from_VP3_to_VP19
depth_target_2 = ds_sadcp.depth(depth_idxed,trail_idxed_2);
lon_target_2 = ds_sadcp.lon(1,trail_idxed_2);
lat_target_2 = ds_sadcp.lat(1,trail_idxed_2);
u_target_2 = ds_sadcp.u(depth_idxed,trail_idxed_2);
v_target_2 = ds_sadcp.v(depth_idxed,trail_idxed_2);
time_target_2 = ds_sadcp.time(1:6,trail_idxed_2);

idx_overlapped = [5:1:11 14:1:21 25:1:30 33:1:38 41:1:47 51:1:57 60:1:65 69:1:75 79];
depth_target_2(:,idx_overlapped) = [];
lon_target_2(idx_overlapped) = [];
lat_target_2(idx_overlapped) = [];
u_target_2(:,idx_overlapped) = [];
v_target_2(:,idx_overlapped) = [];
v_target_2([22 30],6) = nan;
time_target_2(:,idx_overlapped) = [];

% trail_idxed_3 = 2624:2696; % SouthIOP_zigzag
% depth_target_3 = ds_sadcp.depth(depth_idxed,trail_idxed_3);
% lon_target_3 = ds_sadcp.lon(1,trail_idxed_3);
% lat_target_3 = ds_sadcp.lat(1,trail_idxed_3);
% u_target_3 = ds_sadcp.u(depth_idxed,trail_idxed_3);
% v_target_3 = ds_sadcp.v(depth_idxed,trail_idxed_3);
% time_target_3 = ds_sadcp.time(1:6,trail_idxed_3);

% VS25_VS1 = combine(lat_target_1,lon_target_1,time_target_1)';
% VP3_VP19 = combine(lat_target_2,lon_target_2,time_target_2)';
% VS_zigzag = combine(lat_target_3,lon_target_3,time_target_3)';

% writematrix(VS25_VS1,'C:\matlib\tmd_toolbox\tmd_toolbox\LAT_LON\VS25_VS1.txt','Delimiter','tab');
% writematrix(VP3_VP19,'C:\matlib\tmd_toolbox\tmd_toolbox\LAT_LON\VP3_VP19.txt','Delimiter','tab');
% writematrix(VS_zigzag,'C:\matlib\tmd_toolbox\tmd_toolbox\LAT_LON\VS_zigzag.txt','Delimiter','tab');

%% Depth average
u_target_1_avg = mean(u_target_1,'omitnan');
v_target_1_avg = mean(v_target_1,'omitnan');
u_target_2_avg = mean(u_target_2,'omitnan');
v_target_2_avg = mean(v_target_2,'omitnan');
u_target_3_avg = mean(u_target_3,'omitnan');
v_target_3_avg = mean(v_target_3,'omitnan');

%% Remove tidal constituents
cd('C:\matlib\tmd_toolbox\tmd_toolbox')
TMD
cd('C:\matlib\tmd_toolbox\tmd_toolbox\OUT')
VS_track_u = load('VS25_VS1_u.mat');
VS_track_v = load('VS25_VS1_v.mat');
VP_track_u = load('VP3_VP19_u.mat');
VP_track_v = load('VP3_VP19_v.mat');
VZ_track_u = load('VS_zigzag_u.mat');
VZ_track_v = load('VS_zigzag_v.mat');

VS_utide = VS_track_u.TimeSeries./100;
VS_vtide = VS_track_v.TimeSeries./100;
VP_utide = VP_track_u.TimeSeries./100;
VP_vtide = VP_track_v.TimeSeries./100;
VZ_utide = VZ_track_u.TimeSeries./100;
VZ_vtide = VZ_track_v.TimeSeries./100;

dtided_u_VS = u_target_1_avg - VS_utide;
dtided_v_VS = v_target_1_avg - VS_vtide;
dtided_u_VP = u_target_2_avg - VP_utide;
dtided_v_VP = v_target_2_avg - VP_vtide;
dtided_u_VZ = u_target_3_avg - VZ_utide;
dtided_v_VZ = v_target_3_avg - VZ_vtide;

%% Plot vectors
% close all;
drawmap(129.4,130.4,35.0,36.0); % time: Dec 10^{th} 18:22 ~ Dec 10^{th} 20:27
orgnl_vec_1 = m_quiver(lon_target_1,lat_target_1,u_target_1_avg./5,v_target_1_avg./5,0,'k','LineWidth',1.5);
tidal_vec_1 = m_quiver(lon_target_1,lat_target_1,VS_utide./5,VS_vtide./5,0,'b','LineWidth',1.5);
dtided_vec_1 = m_quiver(lon_target_1,lat_target_1,dtided_u_VS./5,dtided_v_VS./5,0,'r','LineWidth',1.5);
m_quiver(130.15,35.3,0.5/5,0,'k','linewidth',1);
m_text(130.15,35.28,'0.5 m/s','FontSize',22,'FontName', 'Times New Roman','FontWeight','b','FontSize',20);
m_line(lon_target_1,lat_target_1,'Color','k');
legend([orgnl_vec_1 tidal_vec_1 dtided_vec_1],'Original','Tidal','Detided','Location','northwest','FontName','Times New Roman','FontWeight','b','FontSize',20);

drawmap(129.4,130.4,35.0,36.0); % time: Dec 13^{th} 09:30 ~ Dec 13^{th} 16:00
orgnl_vec_2 = m_quiver(lon_target_2,lat_target_2,u_target_2_avg./5,v_target_2_avg./5,0,'k','LineWidth',1.5);
tidal_vec_2 = m_quiver(lon_target_2,lat_target_2,VP_utide./5,VP_vtide./5,0,'b','LineWidth',1.5);
dtided_vec_2 = m_quiver(lon_target_2,lat_target_2,dtided_u_VP./5,dtided_v_VP./5,0,'r','LineWidth',1.5);
m_quiver(130.15,35.3,0.5/5,0,'k','linewidth',1);
m_text(130.15,35.28,'0.5 m/s','FontSize',22,'FontName','Times New Roman','FontWeight','b','FontSize',20);
m_line(lon_target_2,lat_target_2,'Color','k');
legend([orgnl_vec_2 tidal_vec_2 dtided_vec_2],'Original','Tidal','Detided','Location','northwest','FontName','Times New Roman','FontWeight','b','FontSize',20);

drawmap(129.4,130.4,35.0,36.0); % time: Dec 10^{th} 12:22 ~ Dec 10^{th} 18:22
orgnl_vec_3 = m_quiver(lon_target_3,lat_target_3,u_target_3_avg./5,v_target_3_avg./5,0,'k','LineWidth',1.);
tidal_vec_3 = m_quiver(lon_target_3,lat_target_3,VZ_utide./5,VZ_vtide./5,0,'b','LineWidth',1.);
dtided_vec_3 = m_quiver(lon_target_3,lat_target_3,dtided_u_VZ./5,dtided_v_VZ./5,0,'r','LineWidth',1.);
m_quiver(130.15,35.3,0.5/5,0,'k','linewidth',1);
m_text(130.15,35.28,'0.5 m/s','fontsize',9,'fontname', ...
    'Times New Romans','fontweight','b');
m_line(lon_target_3,lat_target_3,'Color','k');
legend([orgnl_vec_3 tidal_vec_3 dtided_vec_3],'Original','Tidal','Detided','Location','northwest','FontName','Times New Roman','FontWeight','b','FontSize',20);

%% Bathymetry 
lon_for_bathy_1 = linspace(min(lon_target_1),max(lon_target_1),100);
lat_for_bathy_1 = linspace(min(lat_target_1),max(lat_target_1),100);
for i = 1:length(lon_target_1)
    [BATHY_1(i),XGRID_1(i),YGRID_1(i)] = gebconetcdf('C:\matlib\gebco_2021\gebco_08.nc',lon_target_1(i),lon_target_1(i),lat_target_1(i),lat_target_1(i));
end

lon_for_bathy_2 = linspace(min(lon_target_2),max(lon_target_2),100);
lat_for_bathy_2 = linspace(min(lat_target_2),max(lat_target_2),100);
for i = 1:length(lon_target_2)
    [BATHY_2(i),XGRID_2(i),YGRID_2(i)] = gebconetcdf('C:\matlib\gebco_2021\gebco_08.nc',lon_target_2(i),lon_target_2(i),lat_target_2(i),lat_target_2(i));
end

%% Vertical detided velocity structure(Cross-section)

% Creat a meshgrid based on longitude and depth
[mlon_1 mdepth_1] = meshgrid(lon_target_1,depth_target_1(:,1));
[mlon_2 mdepth_2] = meshgrid(lon_target_2,depth_target_2(:,1));

%%%%%%%%% VS line %%%%%%%%%%%%%%%%
figure;hold on;set(gcf,'position',[111 216 1698 636]);
ax(1) = subplot(1,2,1);
pcolor(mlon_1,mdepth_1,u_target_1-VS_utide);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_1,mdepth_1,u_target_1-VS_utide,[-0.7:0.1:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',15,'FontWeight','b');
xline(lon_mcllcted,'-r',{'VS25','VS15','VS13','VS3','VS1'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center','FontWeight','b','FontName','Times New Roman','FontSize',22);
xlim([min(lon_target_1)-0.001 max(lon_target_1)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 20;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',20);
title('Zonal','Fontname','Times New Roman','FontWeight','b','FontSize',35);
set(ax(1).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',20);
set(ax(1).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',20);
xlabel('Longitude (^oE)','Fontname','Times New Roman','FontWeight','b','FontSize',35);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',35);
area(lon_target_1,-BATHY_1,max(mdepth_1(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(2) = subplot(1,2,2);
pcolor(mlon_1,mdepth_1,v_target_1-VS_vtide);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_1,mdepth_1,v_target_1-VS_vtide,[-0.7:0.1:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',15,'FontWeight','b');
xline(lon_mcllcted,'-r',{'VS25','VS15','VS13','VS3','VS1'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center','FontWeight','b','FontName','Times New Roman','FontSize',22);
xlim([min(lon_target_1)-0.001 max(lon_target_1)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 20;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',20);
title('Meridional','Fontname','Times New Roman','FontWeight','b','FontSize',35);
set(ax(2).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',20);
set(ax(2).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',20);
xlabel('Longitude (^oE)','Fontname','Times New Roman','FontWeight','b','FontSize',35);
% ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',35);
area(lon_target_1,-BATHY_1,max(mdepth_1(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;


%%%%%%%%%% VP line %%%%%%%%%%%%%
% close all;
figure;hold on;set(gcf,'position',[111 216 1698 636]);
ax(1) = subplot(1,2,1);
pcolor(mlon_2,mdepth_2,u_target_2-VP_utide);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_2,mdepth_2,u_target_2-VP_utide,[-0.7:0.1:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',15,'FontWeight','b');
xline(lon_mcllcted,'-r',{'VP3','VP7','VP11','VP15','VP19'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center','FontWeight','b','FontName','Times New Roman','FontSize',22);
xlim([min(lon_target_2)-0.001 max(lon_target_2)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 20;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',20);
title('Zonal','Fontname','Times New Roman','FontWeight','b','FontSize',35);
set(ax(1).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',20);
set(ax(1).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',20);
xlabel('Longitude (^oE)','Fontname','Times New Roman','FontWeight','b','FontSize',35);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',35);
area(lon_target_2,-BATHY_2,max(mdepth_2(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(2) = subplot(1,2,2);
pcolor(mlon_2,mdepth_2,v_target_2-VP_vtide);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_2,mdepth_2,v_target_2-VP_vtide,[-0.7:0.1:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',15,'FontWeight','b');
xline(lon_mcllcted,'-r',{'VP3','VP7','VP11','VP15','VP19'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center','FontWeight','b','FontName','Times New Roman','FontSize',22);
xlim([min(lon_target_2)-0.001 max(lon_target_2)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 20;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',20);
title('Meridional','Fontname','Times New Roman','FontWeight','b','FontSize',35);
set(ax(2).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',20);
set(ax(2).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',20);
xlabel('Longitude (^oE)','Fontname','Times New Roman','FontWeight','b','FontSize',35);
% ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',35);
area(lon_target_2,-BATHY_2,max(mdepth_2(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

%% Get a geostrophic component
cd('C:\Users\USER\OneDrive\바탕 화면\data\MJES\MJES_KOR\CTD_prcssed\10_asciiout')
files_VS = dir('VS*.asc');files_VP = dir('VP*.asc');
n = 0;m = 0;
% Load each dataset from VS
for i = [9 4 3 10 1]
    n = n+1;
    ds_VS_CTD_target{n} = importdata(files_VS(i).name);
end
% Load each dataset from VP
for i = [4 5 1 2 3]
    m = m+1;
    ds_VP_CTD_target{m} = importdata(files_VP(i).name);
end
% Get maximum size of row of each column
for i = 1:5
    num_of_row_max_VS(i) = max(size(ds_VS_CTD_target{1,i}));
    num_of_row_max_VP(i) = max(size(ds_VP_CTD_target{1,i}));
end
% Assign pressure
for i = 1:5
    prs_VS{i} = ds_VS_CTD_target{1,i}(:,2);
    prs_VP{i} = ds_VP_CTD_target{1,i}(:,2);
end
% Creat nan matrix for each variable
prs_new_VS = nan(max(num_of_row_max_VS),5);prs_new_VP = nan(max(num_of_row_max_VP),5);
potemp_new_VS = nan(max(num_of_row_max_VS),5);potemp_new_VP = nan(max(num_of_row_max_VP),5);
psal_new_VS = nan(max(num_of_row_max_VS),5);psal_new_VP = nan(max(num_of_row_max_VP),5); 
% Assign rest variables
for i = 1:5
    prs_new_VS(prs_VS{1,i},i) = ds_VS_CTD_target{1,i}(:,2);
    potemp_new_VS(prs_VS{1,i},i) = ds_VS_CTD_target{1,i}(:,11);
    psal_new_VS(prs_VS{1,i},i) = ds_VS_CTD_target{1,i}(:,9);
    prs_new_VP(prs_VP{1,i},i) = ds_VP_CTD_target{1,i}(:,2);
    potemp_new_VP(prs_VP{1,i},i) = ds_VP_CTD_target{1,i}(:,11);
    psal_new_VP(prs_VP{1,i},i) = ds_VP_CTD_target{1,i}(:,9);
end
% Slice some rows to make a consistent form of matrix(otherwise errors hit)
for i = 1:5
    ga_VS(7:140,i) = sw_gpan(psal_new_VS(7:140,i),potemp_new_VS(7:140,i),prs_new_VS(7:140,i));
    ga_VP(8:127,i) = sw_gpan(psal_new_VP(8:127,i),potemp_new_VP(8:127,i),prs_new_VP(8:127,i));
end
% Assign lat, lon from VS, VP CTD data
for i = 1:5   
    lat_VS{i} = ds_VS_CTD_target{1,i}(1,6);
    lon_VS{i} = ds_VS_CTD_target{1,i}(1,7);
    lat_VP{i} = ds_VP_CTD_target{1,i}(1,6);
    lon_VP{i} = ds_VP_CTD_target{1,i}(1,7);
end
% Convert them into a double form
lat_VS = cell2mat(lat_VS);
lon_VS = cell2mat(lon_VS);
lat_VP = cell2mat(lat_VP);
lon_VP = cell2mat(lon_VP);
% Calculate geostrophic velocity
gvel_VS = sw_gvel(ga_VS,lat_VS,lon_VS);
gvel_VP = sw_gvel(ga_VP,lat_VP,lon_VP);
% Level of no motion(lnm)
gvel_lnm_VS(7:140,:) = flip(-gvel_VS(7:140,:),1);
gvel_lnm_VP(8:127,:) = flip(-gvel_VP(8:127,:),1);
% Find middle points of each lon
for i = 1:length(lon_VS)-1
    lon_mean_VS(i) = (lon_VS(i)+lon_VS(i+1))./2;
end
for i = 1:length(lon_VP)-1
    lon_mean_VP(i) = (lon_VP(i)+lon_VP(i+1))./2;
end
% Define new meshgrids
[mlon_VS mdepth_VS] = meshgrid(lon_mean_VS,prs_new_VS(1:140,1));
[mlon_VP mdepth_VP] = meshgrid(lon_mean_VP,prs_new_VP(1:127,1));

%%%%%%%%% VS and VP line %%%%%%%%%%%%%%%%
% close all;
ax(1) = subplot(1,2,1);
pcolor(mlon_VS,mdepth_VS,gvel_lnm_VS);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Longitude (^oE)');
h = colorbar; 
h.FontWeight = 'b';
title(h,'[m/s]','fontweight','b');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_VS,mdepth_VS,gvel_lnm_VS,[-0.4:0.05:0.4],'-k');
clabel(c1,'color','k');
ylim([0 180]);
xlim([min(lon_target_1) max(lon_target_1)]);
xtickformat('%.2f');
title('Geostrophic velocity at VS line','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

ax(2) = subplot(1,2,2);
pcolor(mlon_VP,mdepth_VP,gvel_lnm_VP);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Longitude (^oE)');
h = colorbar;
h.FontWeight = 'b';
title(h,'[m/s]','fontweight','b');
caxis([-0.7 0.7001]);
[c2 h2] = contour(mlon_VP,mdepth_VP,gvel_lnm_VP,[-0.4:0.05:0.4],'-k');
clabel(c2,'color','k');
ylim([0 180]);
xlim([min(lon_target_2) max(lon_target_2)]);
xtickformat('%.2f');
title('Geostrophic velocity at VP line','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

%% Axes transformation
tx_VS = txsite('Name','VS25','Latitude',lat_target_1(1,1),'Longitude',lon_target_1(1,1));
rx_VS = rxsite('Name','VS1','Latitude',lat_target_1(1,end),'Longitude',lon_target_1(1,end));
angl_VS_deg = angle(tx_VS,rx_VS,'greatcircle');
angl_VS = deg2rad(angl_VS_deg);

tx_VP = txsite('Name','VP3','Latitude',lat_target_2(1,1),'Longitude',lon_target_2(1,1));
rx_VP = rxsite('Name','VP19','Latitude',lat_target_2(1,end),'Longitude',lon_target_2(1,end));
angl_VP_deg = angle(tx_VP,rx_VP,'greatcircle');
angl_VP = deg2rad(angl_VP_deg);

tx_VZ_1 = txsite('Name','VZ_1','Latitude',lat_target_3(1,9),'Longitude',lon_target_3(1,9));
rx_VZ_1 = rxsite('Name','VZ_1','Latitude',lat_target_3(1,20),'Longitude',lon_target_3(1,20));
angl_VZ_1_deg = angle(tx_VZ_1,rx_VZ_1,'greatcircle');
angl_VZ_1 = deg2rad(angl_VZ_1_deg);

tx_VZ_2 = txsite('Name','VZ_2','Latitude',lat_target_3(1,38),'Longitude',lon_target_3(1,38));
rx_VZ_2 = rxsite('Name','VZ_2','Latitude',lat_target_3(1,27),'Longitude',lon_target_3(1,27));
angl_VZ_2_deg = angle(tx_VZ_2,rx_VZ_2,'greatcircle');
angl_VZ_2 = deg2rad(angl_VZ_2_deg);

tx_VZ_3 = txsite('Name','VZ_3','Latitude',lat_target_3(1,44),'Longitude',lon_target_3(1,44));
rx_VZ_3 = rxsite('Name','VZ_3','Latitude',lat_target_3(1,55),'Longitude',lon_target_3(1,55));
angl_VZ_3_deg = angle(tx_VZ_3,rx_VZ_3,'greatcircle');
angl_VZ_3 = deg2rad(angl_VZ_3_deg);

tx_VZ_4 = txsite('Name','VZ_4','Latitude',lat_target_3(1,73),'Longitude',lon_target_3(1,73));
rx_VZ_4 = rxsite('Name','VZ_4','Latitude',lat_target_3(1,61),'Longitude',lon_target_3(1,61));
angl_VZ_4_deg = angle(tx_VZ_4,rx_VZ_4,'greatcircle');
angl_VZ_4 = deg2rad(angl_VZ_4_deg);

%% Vertical velocity structure on transformed axes

% Detide over the whole water column
u_non_vrtcl_avged_dtdd_VS = u_target_1(:,:) - VS_utide;
v_non_vrtcl_avged_dtdd_VS = v_target_1(:,:) - VS_vtide;
u_non_vrtcl_avged_dtdd_VP = u_target_2(:,:) - VP_utide;
v_non_vrtcl_avged_dtdd_VP = v_target_2(:,:) - VP_vtide;
u_non_vrtcl_avged_dtdd_VZ = u_target_3(:,:) - VZ_utide;
v_non_vrtcl_avged_dtdd_VZ = v_target_3(:,:) - VZ_vtide;

% Slice VS zigzag track
u_non_vrtcl_avged_dtdd_VZ_1 = u_non_vrtcl_avged_dtdd_VZ(:,9:20);
v_non_vrtcl_avged_dtdd_VZ_1 = v_non_vrtcl_avged_dtdd_VZ(:,9:20);
u_non_vrtcl_avged_dtdd_VZ_2 = u_non_vrtcl_avged_dtdd_VZ(:,27:38);
v_non_vrtcl_avged_dtdd_VZ_2 = v_non_vrtcl_avged_dtdd_VZ(:,27:38);
u_non_vrtcl_avged_dtdd_VZ_3 = u_non_vrtcl_avged_dtdd_VZ(:,44:55);
v_non_vrtcl_avged_dtdd_VZ_3 = v_non_vrtcl_avged_dtdd_VZ(:,44:55);
u_non_vrtcl_avged_dtdd_VZ_4 = u_non_vrtcl_avged_dtdd_VZ(:,61:73);
v_non_vrtcl_avged_dtdd_VZ_4 = v_non_vrtcl_avged_dtdd_VZ(:,61:73);

% Transform coordinates
u_prime_non_vrtcl_avged_dtdd_VS = cos(angl_VS).*u_non_vrtcl_avged_dtdd_VS + sin(angl_VS).*v_non_vrtcl_avged_dtdd_VS;
v_prime_non_vrtcl_avged_dtdd_VS = -sin(angl_VS).*u_non_vrtcl_avged_dtdd_VS + cos(angl_VS).*v_non_vrtcl_avged_dtdd_VS;
u_prime_non_vrtcl_avged_dtdd_VP = cos(angl_VP).*u_non_vrtcl_avged_dtdd_VP + sin(angl_VP).*v_non_vrtcl_avged_dtdd_VP;
v_prime_non_vrtcl_avged_dtdd_VP = -sin(angl_VP).*u_non_vrtcl_avged_dtdd_VP + cos(angl_VP).*v_non_vrtcl_avged_dtdd_VP;
u_prime_non_vrtcl_avged_dtdd_VZ_1 = cos(angl_VZ_1).*u_non_vrtcl_avged_dtdd_VZ_1 + sin(angl_VZ_1).*v_non_vrtcl_avged_dtdd_VZ_1;
v_prime_non_vrtcl_avged_dtdd_VZ_1 = -sin(angl_VZ_1).*u_non_vrtcl_avged_dtdd_VZ_1 + cos(angl_VZ_1).*v_non_vrtcl_avged_dtdd_VZ_1;
u_prime_non_vrtcl_avged_dtdd_VZ_2 = cos(angl_VZ_2).*u_non_vrtcl_avged_dtdd_VZ_2 + sin(angl_VZ_2).*v_non_vrtcl_avged_dtdd_VZ_2;
v_prime_non_vrtcl_avged_dtdd_VZ_2 = -sin(angl_VZ_2).*u_non_vrtcl_avged_dtdd_VZ_2 + cos(angl_VZ_2).*v_non_vrtcl_avged_dtdd_VZ_2;
u_prime_non_vrtcl_avged_dtdd_VZ_3 = cos(angl_VZ_3).*u_non_vrtcl_avged_dtdd_VZ_3 + sin(angl_VZ_3).*v_non_vrtcl_avged_dtdd_VZ_3;
v_prime_non_vrtcl_avged_dtdd_VZ_3 = -sin(angl_VZ_3).*u_non_vrtcl_avged_dtdd_VZ_3 + cos(angl_VZ_3).*v_non_vrtcl_avged_dtdd_VZ_3;
u_prime_non_vrtcl_avged_dtdd_VZ_4 = cos(angl_VZ_4).*u_non_vrtcl_avged_dtdd_VZ_4 + sin(angl_VZ_4).*v_non_vrtcl_avged_dtdd_VZ_4;
v_prime_non_vrtcl_avged_dtdd_VZ_4 = -sin(angl_VZ_4).*u_non_vrtcl_avged_dtdd_VZ_4 + cos(angl_VZ_4).*v_non_vrtcl_avged_dtdd_VZ_4;

% Creat a meshgrid based on longitude and depth for VS zigzag
[mlat_VZ_1 mdepth_VZ_1] = meshgrid(lat_target_3(:,9:20),depth_target_3(:,1));
[mlat_VZ_2 mdepth_VZ_2] = meshgrid(lat_target_3(:,27:38),depth_target_3(:,1));
[mlat_VZ_3 mdepth_VZ_3] = meshgrid(lat_target_3(:,44:55),depth_target_3(:,1));
[mlat_VZ_4 mdepth_VZ_4] = meshgrid(lat_target_3(:,61:73),depth_target_3(:,1));

% close all
%%%%%%%% VS line %%%%%%%%%%%%%
ax(1) = subplot(1,2,1);
pcolor(mlon_1,mdepth_1,u_prime_non_vrtcl_avged_dtdd_VS);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Longitude (^oE)');
% h = colorbar; 
% h.FontWeight = 'b';
% title(h,'[m/s]','fontweight','b');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_1,mdepth_1,u_prime_non_vrtcl_avged_dtdd_VS,[-0.7:0.1:0.1],'-k');
clabel(c1,'color','k');
xlim([min(lon_VS) max(lon_VS)]);
ylim([0 180]);
xline(lon_VS,'-r', ...
    {'VS25','VS15','VS13','VS3','VS1'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
xtickformat('%.2f');
title('u''_{obs} at VS25-VS1','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

ax(2) = subplot(1,2,2);
pcolor(mlon_1,mdepth_1,v_prime_non_vrtcl_avged_dtdd_VS);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Longitude (^oE)');
h = colorbar; 
h.FontWeight = 'b';
title(h,'[m/s]','fontweight','b');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_1,mdepth_1,v_prime_non_vrtcl_avged_dtdd_VS,[-0.1:0.1:0.7],'-k');
clabel(c1,'color','k');
xlim([min(lon_VS) max(lon_VS)]);
ylim([0 180]);
xline(lon_VS,'-r', ...
    {'VS25','VS15','VS13','VS3','VS1'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
xtickformat('%.2f');
title('v''_{obs} at VS25-VS1','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

%%%%%%%%%% VP line %%%%%%%%%%%%%%%%
ax(1) = subplot(1,2,1);
pcolor(mlon_2,mdepth_2,u_prime_non_vrtcl_avged_dtdd_VP);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Longitude (^oE)');
h = colorbar; 
h.FontWeight = 'b';
h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','fontweight','b');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_2,mdepth_2,u_prime_non_vrtcl_avged_dtdd_VP,[-0.7:0.1:0.1],'-k');
clabel(c1,'color','k');
xlim([min(lon_VP) max(lon_VP)]);
ylim([0 180]);
xline(lon_VP,'-r', ...
    {'VP3','VP7','VP11','VP15','VP19'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
xtickformat('%.2f');
title('u''_{obs} at VP3-VP19','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

ax(2) = subplot(1,2,2);
pcolor(mlon_2,mdepth_2,v_prime_non_vrtcl_avged_dtdd_VP);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Longitude (^oE)');
h = colorbar; 
h.FontWeight = 'b';
h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','fontweight','b');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_2,mdepth_2,v_prime_non_vrtcl_avged_dtdd_VP,[-0.7:0.1:0.7],'-k');
clabel(c1,'color','k');
xlim([min(lon_VP) max(lon_VP)]);
ylim([0 180]);
xline(lon_VP,'-r', ...
    {'VP3','VP7','VP11','VP15','VP19'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
xtickformat('%.2f');
title('v''_{obs} at VP3-VP19','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

%%%%%%%%% VS zigzag %%%%%%%%%%%%%%
ax(1) = subplot(1,4,1);
pcolor(mlat_VZ_4,mdepth_VZ_4,v_prime_non_vrtcl_avged_dtdd_VZ_4);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Latitude (^oN)');
h = colorbar; 
h.FontWeight = 'b';
title(h,'[m/s]','fontweight','b');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlat_VZ_4,mdepth_VZ_4,v_prime_non_vrtcl_avged_dtdd_VZ_4,[-0.2:0.1:0.7],'-k');
clabel(c1,'color','k');
xlim([min(mlat_VZ_4(1,:)) max(mlat_VZ_4(1,:))]);
ylim([0 300]);
xtickformat('%.2f');
title('4_{th} at VZ','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

ax(2) = subplot(1,4,2);
pcolor(mlat_VZ_3,mdepth_VZ_3,v_prime_non_vrtcl_avged_dtdd_VZ_3);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Latitude (^oN)');
h = colorbar; 
h.FontWeight = 'b';
title(h,'[m/s]','fontweight','b');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlat_VZ_3,mdepth_VZ_3,v_prime_non_vrtcl_avged_dtdd_VZ_3,[-0.7:0.1:0.2],'-k');
clabel(c1,'color','k');
xlim([min(mlat_VZ_3(1,:)) max(mlat_VZ_3(1,:))]);
ylim([0 300]);
xtickformat('%.2f');
title('3_{rd} at VZ','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

ax(3) = subplot(1,4,3);
pcolor(mlat_VZ_2,mdepth_VZ_2,v_prime_non_vrtcl_avged_dtdd_VZ_2);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Latitude (^oN)');
h = colorbar; 
h.FontWeight = 'b';
title(h,'[m/s]','fontweight','b');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlat_VZ_2,mdepth_VZ_2,v_prime_non_vrtcl_avged_dtdd_VZ_2,[-0.1:0.1:0.7],'-k');
clabel(c1,'color','k');
xlim([min(mlat_VZ_2(1,:)) max(mlat_VZ_2(1,:))]);
ylim([0 300]);
xtickformat('%.2f');
title('2_{nd} at VZ','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

ax(4) = subplot(1,4,4);
pcolor(mlat_VZ_1,mdepth_VZ_1,v_prime_non_vrtcl_avged_dtdd_VZ_1);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Latitude (^oN)');
h = colorbar; 
h.FontWeight = 'b';
title(h,'[m/s]','fontweight','b');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlat_VZ_1,mdepth_VZ_1,v_prime_non_vrtcl_avged_dtdd_VZ_1,[-0.7:0.1:0.2],'-k');
clabel(c1,'color','k');
xlim([min(mlat_VZ_1(1,:)) max(mlat_VZ_1(1,:))]);
ylim([0 300]);
xtickformat('%.2f');
title('1_{st} at VZ','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

%% NW, NE, SW, SE vertical profile
% NW_prfle_VS = mean(v_prime_non_vrtcl_avged_dtdd_VS(1:14,1:13),2,'omitnan');
% NE_prfle_VS = mean(v_prime_non_vrtcl_avged_dtdd_VS(1:14,14:26),2,'omitnan');
% SW_prfle_VP = mean(v_prime_non_vrtcl_avged_dtdd_VP(1:14,1:12),2,'omitnan');
% SE_prfle_VP = mean(v_prime_non_vrtcl_avged_dtdd_VP(1:14,13:24),2,'omitnan');
% 
% NW = plot(NW_prfle_VS,mdepth_1(1:14,1),'r','LineWidth',1);hold on;
% set(gca,'YDir','reverse');
% NE = plot(NE_prfle_VS,mdepth_1(1:14,1),'k','LineWidth',1);
% SW = plot(SW_prfle_VP,mdepth_1(1:14,1),'--r','LineWidth',1);
% SE = plot(SE_prfle_VP,mdepth_1(1:14,1),'--k','LineWidth',1);
% ylabel('Depth (m)','fontweight','b','fontname','Times New Romans');
% xlabel('Speed (m/s)','fontweight','b','fontname','Times New Romans');
% title('Vertical current profile over VS and VP track','fontweight','b','fontname','Times New Romans')
% legend([NW NE SW SE],'NW','NE','SW','SE','Location','southeast');
% set(get(gca,'XAxis'),'FontWeight','b');
% set(get(gca,'YAxis'),'FontWeight','b');
% grid on;xtickformat('%.1f');

%% Obs - Geo
v_prime_non_vrtcl_avged_dtdd_VS_regridded = interp2(mlon_1,mdepth_1,v_prime_non_vrtcl_avged_dtdd_VS,mlon_VS,mdepth_VS);
v_prime_non_vrtcl_avged_dtdd_VP_regridded = interp2(mlon_2,mdepth_2,v_prime_non_vrtcl_avged_dtdd_VP,mlon_VP,mdepth_VP);

v_ageo_VS = v_prime_non_vrtcl_avged_dtdd_VS_regridded - gvel_lnm_VS;
v_ageo_VP = v_prime_non_vrtcl_avged_dtdd_VP_regridded - gvel_lnm_VP;

% close all;
ax(1) = subplot(2,3,1);
pcolor(mlon_1,mdepth_1,v_prime_non_vrtcl_avged_dtdd_VS);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Longitude (^oE)');
h = colorbar; 
h.FontWeight = 'b';
h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','fontweight','b');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_1,mdepth_1,v_prime_non_vrtcl_avged_dtdd_VS,[-0.1:0.1:0.7],'-k');
clabel(c1,'color','k');
ylim([0 180]);
xtickformat('%.2f');
xlim([min(lon_VS) max(lon_VS)]);
xline(lon_VS,'-r', ...
    {'VS25','VS15','VS13','VS3','VS1'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
title('v''_{obs} at VS25-VS1','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

ax(2) = subplot(2,3,2);
pcolor(mlon_VS,mdepth_VS,gvel_lnm_VS);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Longitude (^oE)');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_VS,mdepth_VS,gvel_lnm_VS,[-0.4:0.1:0.4],'-k');
clabel(c1,'color','k');
ylim([0 180]);
xlim([min(lon_VS) max(lon_VS)]);
xline(lon_VS,'-r', ...
    {'VS25','VS15','VS13','VS3','VS1'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
xtickformat('%.2f');
title('v''_{geo} at VS25-VS1','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

ax(3) = subplot(2,3,3);
pcolor(mlon_VS,mdepth_VS,v_ageo_VS);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Longitude (^oE)');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_VS,mdepth_VS,v_ageo_VS,[-0.7:0.1:0.7],'-k');
clabel(c1,'color','k');
ylim([0 180]);
xlim([min(lon_VS) max(lon_VS)]);
xline(lon_VS,'-r', ...
    {'VS25','VS15','VS13','VS3','VS1'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
xtickformat('%.2f');
title('v''_{ageo} at VS25-VS1','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

ax(4) = subplot(2,3,4);
pcolor(mlon_2,mdepth_2,v_prime_non_vrtcl_avged_dtdd_VP);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Longitude (^oE)');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_2,mdepth_2,v_prime_non_vrtcl_avged_dtdd_VP,[-0.7:0.1:0.7],'-k');
clabel(c1,'color','k');
ylim([0 180]);
xlim([min(lon_VP) max(lon_VP)]);
xline(lon_VP,'-r', ...
    {'VP3','VP7','VP11','VP15','VP19'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
xtickformat('%.2f');
title('v''_{obs} at VP3-VP19','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

ax(5) = subplot(2,3,5);
pcolor(mlon_VP,mdepth_VP,gvel_lnm_VP);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Longitude (^oE)');
caxis([-0.7 0.7001]);
[c2 h2] = contour(mlon_VP,mdepth_VP,gvel_lnm_VP,[-0.4:0.1:0.4],'-k');
clabel(c2,'color','k');
ylim([0 180]);
xlim([min(lon_VP) max(lon_VP)]);
xline(lon_VP,'-r', ...
    {'VP3','VP7','VP11','VP15','VP19'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
xtickformat('%.2f');
title('v''_{geo} at VP3-VP19','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');

ax(6) = subplot(2,3,6);
pcolor(mlon_VP,mdepth_VP,v_ageo_VP);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
ylabel('Depth (m)');
xlabel('Longitude (^oE)');
caxis([-0.7 0.7001]);
[c2 h2] = contour(mlon_VP,mdepth_VP,v_ageo_VP,[-0.7:0.1:0.7],'-k');
clabel(c2,'color','k');
ylim([0 180]);
xlim([min(lon_VP) max(lon_VP)]);
xline(lon_VP,'-r', ...
    {'VP3','VP7','VP11','VP15','VP19'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
xtickformat('%.2f');
title('v''_{ageo} at VP3-VP19','fontweight','b');
set(get(gca,'XAxis'),'FontWeight','b');
set(get(gca,'YAxis'),'FontWeight','b');





