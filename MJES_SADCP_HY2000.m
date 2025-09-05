clc;clear all;close all;

%% Load SADCP data
ds_sadcp = load_getmat('C:\codas_shared\MJES_HY2000_SADCP\allbins_');

%% Draw target map
% drawmap(129.4,130.0,36.2,36.8); % North IOP
% drawmap(129.4,130.4,35.0,36.0); % South IOP
% drawmap(128,131,34,37); % whole map

%% Identify ship track
% South IOP
P_dot1 = m_plot(ds_sadcp.lon(58:363), ds_sadcp.lat(58:363), 'o', 'markersize',8, ...
    'markerfacecolor','y','markeredgecolor','r','linestyle','none','linewidth',1);    
P_dot3 = m_plot(ds_sadcp.lon(374:431), ds_sadcp.lat(374:431), 'o', 'markersize',8, ...
    'markerfacecolor','y','markeredgecolor','k','linestyle','none','linewidth',1); 

% North IOP
P_dot4 = m_plot(ds_sadcp.lon(492:530), ds_sadcp.lat(492:530), 'o', 'markersize',8, ...
    'markerfacecolor','g','markeredgecolor','k','linestyle','none','linewidth',1);
P_dot6 = m_plot(ds_sadcp.lon(535:573), ds_sadcp.lat(535:573), 'o', 'markersize',8, ...
    'markerfacecolor','y','markeredgecolor','k','linestyle','none','linewidth',1);
P_dot6 = m_plot(ds_sadcp.lon(578:614), ds_sadcp.lat(578:614), 'o', 'markersize',8, ...
    'markerfacecolor','y','markeredgecolor','k','linestyle','none','linewidth',1);
P_dot6 = m_plot(ds_sadcp.lon(620:659), ds_sadcp.lat(620:659), 'o', 'markersize',8, ...
    'markerfacecolor','y','markeredgecolor','k','linestyle','none','linewidth',1);
mline = m_line(ds_sadcp.lon(492:659),ds_sadcp.lat(492:659),'Color','k','linewidth',2.5);

P_dot6 = m_plot(ds_sadcp.lon(696:763), ds_sadcp.lat(696:763), 'o', 'markersize',8, ...
    'markerfacecolor','r','markeredgecolor','k','linestyle','none','linewidth',1);
P_dot6 = m_plot(ds_sadcp.lon(696:763), ds_sadcp.lat(696:763), 'o', 'markersize',8, ...
    'markerfacecolor','r','markeredgecolor','k','linestyle','none','linewidth',1);
P_dot6 = m_plot(ds_sadcp.lon(763:871), ds_sadcp.lat(763:871), 'o', 'markersize',8, ...
    'markerfacecolor','r','markeredgecolor','k','linestyle','none','linewidth',1);
P_dot6 = m_plot(ds_sadcp.lon(782:815), ds_sadcp.lat(782:815), 'o', 'markersize',8, ...
    'markerfacecolor','g','markeredgecolor','k','linestyle','none','linewidth',1);
% m_line(ds.lon(1535:1553),ds.lat(1535:1553),'Color','r','linewidth',1.5);
% m_line(ds.lon(1552:1562),ds.lat(1552:1562),'Color','r','linewidth',1.5);
% m_line(ds_sadcp.lon(849:905),ds_sadcp.lat(849:905),'Color','r','linewidth',1.5);
P_dot7 = m_plot(ds_sadcp.lon(600:700), ds_sadcp.lat(600:700), 'o', 'markersize',8, ...
    'markerfacecolor','r','markeredgecolor','k','linestyle','none','linewidth',1);
% m_line(ds.lon(796:827),ds.lat(796:827),'Color','r','linewidth',1.5);
P_dot7 = m_plot(ds_sadcp.lon(700:end), ds_sadcp.lat(700:end), 'o', 'markersize',8, ...
    'markerfacecolor','w','markeredgecolor','k','linestyle','none','linewidth',1);

% IOP-South
% 58:363 KU3 24hrs 
% 374:451 SST CTD casting points
% 596:763 On the way back 2nd SST 3-2, 3-3, 3-4, 3-5, 3-6
% 782:815 weird moving
% 831:842 passing over a deep valley 

% IOP-North
% 492:530 NST1
% 535:573 NST2
% 578:614 NST3
% 620:659 NST4

%% Get target depth, trail, and time
depth_idxed = 1:45; % surface ~ 371m
trail_idxed_1 = 492:530; % NST1
depth_target_1 = ds_sadcp.depth(depth_idxed,trail_idxed_1);
lon_target_1 = ds_sadcp.lon(1,trail_idxed_1);
lat_target_1 = ds_sadcp.lat(1,trail_idxed_1);
u_target_1 = ds_sadcp.u(depth_idxed,trail_idxed_1);
v_target_1 = ds_sadcp.v(depth_idxed,trail_idxed_1);
time_target_1 = ds_sadcp.time(1:6,trail_idxed_1);

idx_overlapped_1 = [2:1:9 14:1:21 26:1:32 37:1:39];
depth_target_1(:,idx_overlapped_1) = [];
lon_target_1(idx_overlapped_1) = [];
lat_target_1(idx_overlapped_1) = [];
u_target_1(:,idx_overlapped_1) = [];
v_target_1(:,idx_overlapped_1) = [];
time_target_1(:,idx_overlapped_1) = [];

trail_idxed_2 = 535:573; % NST2
depth_target_2 = ds_sadcp.depth(depth_idxed,trail_idxed_2);
lon_target_2 = ds_sadcp.lon(1,trail_idxed_2);
lat_target_2 = ds_sadcp.lat(1,trail_idxed_2);
u_target_2 = ds_sadcp.u(depth_idxed,trail_idxed_2);
v_target_2 = ds_sadcp.v(depth_idxed,trail_idxed_2);
time_target_2 = ds_sadcp.time(1:6,trail_idxed_2);

idx_overlapped_2 = [2:1:4 10:1:12 17:1:25 30:1:39];
depth_target_2(:,idx_overlapped_2) = [];
lon_target_2(idx_overlapped_2) = [];
lat_target_2(idx_overlapped_2) = [];
u_target_2(:,idx_overlapped_2) = [];
v_target_2(:,idx_overlapped_2) = [];
time_target_2(:,idx_overlapped_2) = [];

trail_idxed_3 = 578:614; % NST3
depth_target_3 = ds_sadcp.depth(depth_idxed,trail_idxed_3);
lon_target_3 = ds_sadcp.lon(1,trail_idxed_3);
lat_target_3 = ds_sadcp.lat(1,trail_idxed_3);
u_target_3 = ds_sadcp.u(depth_idxed,trail_idxed_3);
v_target_3 = ds_sadcp.v(depth_idxed,trail_idxed_3);
time_target_3 = ds_sadcp.time(1:6,trail_idxed_3);

idx_overlapped_3 = [2:1:9 14:1:20 26:1:29 34:1:37];
depth_target_3(:,idx_overlapped_3) = [];
lon_target_3(idx_overlapped_3) = [];
lat_target_3(idx_overlapped_3) = [];
u_target_3(:,idx_overlapped_3) = [];
v_target_3(:,idx_overlapped_3) = [];
time_target_3(:,idx_overlapped_3) = [];

trail_idxed_4 = 620:659; % NST4
depth_target_4 = ds_sadcp.depth(depth_idxed,trail_idxed_4);
lon_target_4 = ds_sadcp.lon(1,trail_idxed_4);
lat_target_4 = ds_sadcp.lat(1,trail_idxed_4);
u_target_4 = ds_sadcp.u(depth_idxed,trail_idxed_4);
v_target_4 = ds_sadcp.v(depth_idxed,trail_idxed_4);
time_target_4 = ds_sadcp.time(1:6,trail_idxed_4);

idx_overlapped_4 = [2:1:5 11:1:14 21:1:28 34:1:40];
depth_target_4(:,idx_overlapped_4) = [];
lon_target_4(idx_overlapped_4) = [];
lat_target_4(idx_overlapped_4) = [];
u_target_4(:,idx_overlapped_4) = [];
v_target_4(:,idx_overlapped_4) = [];
time_target_4(:,idx_overlapped_4) = [];

% NST1 = combine(lat_target_1,lon_target_1,time_target_1)';  
% NST2 = combine(lat_target_2,lon_target_2,time_target_2)'; 
% NST3 = combine(lat_target_3,lon_target_3,time_target_3)';
% NST4 = combine(lat_target_4,lon_target_4,time_target_4)'; 
% 
% writematrix(NST1,'C:\matlib\tmd_toolbox\tmd_toolbox\LAT_LON\NST1.txt','Delimiter','tab');
% writematrix(NST2,'C:\matlib\tmd_toolbox\tmd_toolbox\LAT_LON\NST2.txt','Delimiter','tab');
% writematrix(NST3,'C:\matlib\tmd_toolbox\tmd_toolbox\LAT_LON\NST3.txt','Delimiter','tab');
% writematrix(NST4,'C:\matlib\tmd_toolbox\tmd_toolbox\LAT_LON\NST4.txt','Delimiter','tab');

%% Depth average
% whole depth average
u_target_1_avg = mean(u_target_1,'omitnan');
v_target_1_avg = mean(v_target_1,'omitnan');
u_target_1_avg = mean(u_target_1,'omitnan');
v_target_1_avg = mean(v_target_1,'omitnan');
u_target_2_avg = mean(u_target_2,'omitnan');
v_target_2_avg = mean(v_target_2,'omitnan');
u_target_3_avg = mean(u_target_3,'omitnan');
v_target_3_avg = mean(v_target_3,'omitnan');
u_target_4_avg = mean(u_target_4,'omitnan');
v_target_4_avg = mean(v_target_4,'omitnan');

%% Remove tidal constituents
cd('C:\matlib\tmd_toolbox\tmd_toolbox')
% TMD
cd('C:\matlib\tmd_toolbox\tmd_toolbox\OUT')
NST1_track_u = load('NST1_u.mat');
NST1_track_v = load('NST1_v.mat');
NST2_track_u = load('NST2_u.mat');
NST2_track_v = load('NST2_v.mat');
NST3_track_u = load('NST3_u.mat');
NST3_track_v = load('NST3_v.mat');
NST4_track_u = load('NST4_u.mat');
NST4_track_v = load('NST4_v.mat');

NST1_utide = NST1_track_u.TimeSeries./100;
NST1_vtide = NST1_track_v.TimeSeries./100;
NST2_utide = NST2_track_u.TimeSeries./100;
NST2_vtide = NST2_track_v.TimeSeries./100;
NST3_utide = NST3_track_u.TimeSeries./100;
NST3_vtide = NST3_track_v.TimeSeries./100;
NST4_utide = NST4_track_u.TimeSeries./100;
NST4_vtide = NST4_track_v.TimeSeries./100;

NST1_u_dtdd = u_target_1_avg - NST1_utide;
NST1_v_dtdd = v_target_1_avg - NST1_vtide;
NST2_u_dtdd = u_target_2_avg - NST2_utide;
NST2_v_dtdd = v_target_2_avg - NST2_vtide;
NST3_u_dtdd = u_target_3_avg - NST3_utide;
NST3_v_dtdd = v_target_3_avg - NST3_vtide;
NST4_u_dtdd = u_target_4_avg - NST4_utide;
NST4_v_dtdd = v_target_4_avg - NST4_vtide;

%% Plot current vectors
% close all;
drawmap(129.4,130.0,36.2,36.8); % time: 
orgnl_vec_1 = m_quiver(lon_target_1,lat_target_1,u_target_1_avg./5,v_target_1_avg./5,0,'k','LineWidth',1.);
tidal_vec_1 = m_quiver(lon_target_1,lat_target_1,NST1_utide./5,NST1_vtide./5,0,'b','LineWidth',1.);
dtided_vec_1 = m_quiver(lon_target_1,lat_target_1,NST1_u_dtdd./5,NST1_v_dtdd./5,0,'r','LineWidth',1.);
m_quiver(129.42,36.3,0.5/5,0,'k','linewidth',1);
m_text(129.44,36.28,'0.5 m/s','fontsize',17,'fontname', ...
    'Times New Romans','fontweight','b');
m_line(lon_target_1,lat_target_1,'Color','k');
legend([orgnl_vec_1 tidal_vec_1 dtided_vec_1],'Origianal','Tidal','Detided');

drawmap(129.4,130.0,36.2,36.8); % time: 
orgnl_vec_2 = m_quiver(lon_target_2,lat_target_2,u_target_2_avg./5,v_target_2_avg./5,0,'k','LineWidth',1.);
tidal_vec_2 = m_quiver(lon_target_2,lat_target_2,NST2_utide./5,NST2_vtide./5,0,'b','LineWidth',1.);
dtided_vec_2 = m_quiver(lon_target_2,lat_target_2,NST2_u_dtdd./5,NST2_v_dtdd./5,0,'r','LineWidth',1.);
m_quiver(129.42,36.3,0.5/5,0,'k','linewidth',1);
m_text(129.43,36.28,'0.5 m/s','fontsize',11,'fontname', ...
    'Times New Romans','fontweight','b');
m_line(lon_target_2,lat_target_2,'Color','k');
legend([orgnl_vec_2 tidal_vec_2 dtided_vec_2],'Origianal','Tidal','Detided');

drawmap(129.4,130.0,36.2,36.8); % time: 
orgnl_vec_3 = m_quiver(lon_target_3,lat_target_3,u_target_3_avg./5,v_target_3_avg./5,0,'k','LineWidth',1.);
tidal_vec_3 = m_quiver(lon_target_3,lat_target_3,NST3_utide./5,NST3_vtide./5,0,'b','LineWidth',1.);
dtided_vec_3 = m_quiver(lon_target_3,lat_target_3,NST3_u_dtdd./5,NST3_v_dtdd./5,0,'r','LineWidth',1.);
m_quiver(129.42,36.3,0.5/5,0,'k','linewidth',1);
m_text(129.43,36.28,'0.5 m/s','fontsize',11,'fontname', ...
    'Times New Romans','fontweight','b');
m_line(lon_target_3,lat_target_3,'Color','k');
legend([orgnl_vec_3 tidal_vec_3 dtided_vec_3],'Origianal','Tidal','Detided');

drawmap(129.4,130.0,36.2,36.8); % time: 
orgnl_vec_4 = m_quiver(lon_target_4,lat_target_4,u_target_4_avg./5,v_target_4_avg./5,0,'k','LineWidth',1.);
tidal_vec_4 = m_quiver(lon_target_4,lat_target_4,NST4_utide./5,NST4_vtide./5,0,'b','LineWidth',1.);
dtided_vec_4 = m_quiver(lon_target_4,lat_target_4,NST4_u_dtdd./5,NST4_v_dtdd./5,0,'r','LineWidth',1.);
m_quiver(129.42,36.3,0.5/5,0,'k','linewidth',1);
m_text(129.43,36.28,'0.5 m/s','fontsize',11,'fontname', ...
    'Times New Romans','fontweight','b');
m_line(lon_target_4,lat_target_4,'Color','k');
legend([orgnl_vec_4 tidal_vec_4 dtided_vec_4],'Origianal','Tidal','Detided','FontName','Times New Romans', ...
    'FontWeight','b','FontSize',13);

%% Detide over the whole water column
u_non_vrtcl_avged_dtdd_NST1 = u_target_1;%(:,:)-NST1_utide;
v_non_vrtcl_avged_dtdd_NST1 = v_target_1;%(:,:)-NST1_vtide;
u_non_vrtcl_avged_dtdd_NST2 = u_target_2;%(:,:)-NST2_utide;
v_non_vrtcl_avged_dtdd_NST2 = v_target_2;%(:,:)-NST2_vtide;
u_non_vrtcl_avged_dtdd_NST3 = u_target_3;%(:,:)-NST3_utide;
v_non_vrtcl_avged_dtdd_NST3 = v_target_3;%(:,:)-NST3_vtide;
u_non_vrtcl_avged_dtdd_NST4 = u_target_4;%(:,:)-NST4_utide;
v_non_vrtcl_avged_dtdd_NST4 = v_target_4;%(:,:)-NST4_vtide;

u_non_vrtcl_avged_dtdd_NST1 = flip(u_non_vrtcl_avged_dtdd_NST1,2);
v_non_vrtcl_avged_dtdd_NST1 = flip(v_non_vrtcl_avged_dtdd_NST1,2);
u_non_vrtcl_avged_dtdd_NST3 = flip(u_non_vrtcl_avged_dtdd_NST3,2);
v_non_vrtcl_avged_dtdd_NST3 = flip(v_non_vrtcl_avged_dtdd_NST3,2);

%% Define a grid
lon_target_1 = flip(lon_target_1);
lon_target_3 = flip(lon_target_3);

[mlon_1 mdepth_1] = meshgrid(lon_target_1,depth_target_1(:,1));
[mlon_2 mdepth_2] = meshgrid(lon_target_2,depth_target_2(:,1));
[mlon_3 mdepth_3] = meshgrid(lon_target_3,depth_target_3(:,1));
[mlon_4 mdepth_4] = meshgrid(lon_target_4,depth_target_4(:,1));

%% Plot Cross-section
% NST1
figure;hold on;set(gcf,'position',[4 2 744 994]);
ax(1) = subplot(4,2,1);
pcolor(mlon_1,mdepth_1,u_non_vrtcl_avged_dtdd_NST1);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.8 0.8001]);
[c1 h1] = contour(mlon_1,mdepth_1,u_non_vrtcl_avged_dtdd_NST1,[-0.5:0.2:0.5],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lon_mcllcted,'-r',{'NST1-2','NST1-3','NST1-4','NST1-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',10);
xlim([min(lon_mcllcted) max(lon_mcllcted)]);
ylim([0 400]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Zonal','Fontname','Times New Roman','FontWeight','b','FontSize',15);
set(ax(1).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(1).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',15);
area(lon_for_bathy,-BATHY,max(mprs_nst1(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(2) = subplot(4,2,2);
pcolor(mlon_1,mdepth_1,v_non_vrtcl_avged_dtdd_NST1);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.8 0.8001]);
[c1 h1] = contour(mlon_1,mdepth_1,v_non_vrtcl_avged_dtdd_NST1,[-0.8:0.2:0.8],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lon_mcllcted,'-r',{'NST1-2','NST1-3','NST1-4','NST1-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',10);
xlim([min(lon_mcllcted) max(lon_mcllcted)]);
ylim([0 400]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Meridional','Fontname','Times New Roman','FontWeight','b','FontSize',15);
set(ax(2).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(2).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
area(lon_for_bathy,-BATHY,max(mprs_nst1(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

% NST2
ax(3) = subplot(4,2,3);
pcolor(mlon_2,mdepth_2,u_non_vrtcl_avged_dtdd_NST2);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.8 0.8001]);
[c1 h1] = contour(mlon_2,mdepth_2,u_non_vrtcl_avged_dtdd_NST2,[-0.5:0.2:0.5],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lon_mcllcted,'-r',{'NST2-2','NST2-3','NST2-4','NST2-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',10);
xlim([min(lon_mcllcted) max(lon_mcllcted)]);
ylim([0 400]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Zonal','Fontname','Times New Roman','FontWeight','b','FontSize',15);
set(ax(3).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(3).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',15);
area(lon_for_bathy,-BATHY,max(mprs_nst2(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(4) = subplot(4,2,4);
pcolor(mlon_2,mdepth_2,v_non_vrtcl_avged_dtdd_NST2);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.8 0.8001]);
[c1 h1] = contour(mlon_2,mdepth_2,v_non_vrtcl_avged_dtdd_NST2,[-0.8:0.2:0.8],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lon_mcllcted,'-r',{'NST2-2','NST2-3','NST2-4','NST2-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',10);
xlim([min(lon_mcllcted) max(lon_mcllcted)]);
ylim([0 400]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Meridional','Fontname','Times New Roman','FontWeight','b','FontSize',15);
set(ax(4).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(4).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
area(lon_for_bathy,-BATHY,max(mprs_nst2(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

% NST3
figure;hold on;set(gcf,'position',[4 342 1915 640]);
ax(5) = subplot(4,2,5);
pcolor(mlon_3,mdepth_3,u_non_vrtcl_avged_dtdd_NST3);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.8 0.8001]);
[c1 h1] = contour(mlon_3,mdepth_3,u_non_vrtcl_avged_dtdd_NST3,[-0.5:0.2:0.5],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lon_mcllcted,'-r',{'NST3-2','NST3-3','NST3-4','NST3-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',10);
xlim([min(lon_mcllcted) max(lon_mcllcted)]);
ylim([0 400]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Zonal','Fontname','Times New Roman','FontWeight','b','FontSize',15);
set(ax(5).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(5).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',15);
area(lon_for_bathy,-BATHY,max(mprs_nst3(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(6) = subplot(4,2,6);
pcolor(mlon_3,mdepth_3,v_non_vrtcl_avged_dtdd_NST3);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.8 0.8001]);
[c1 h1] = contour(mlon_3,mdepth_3,v_non_vrtcl_avged_dtdd_NST3,[-0.8:0.2:0.8],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lon_mcllcted,'-r',{'NST3-2','NST3-3','NST3-4','NST3-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',10);
xlim([min(lon_mcllcted) max(lon_mcllcted)]);
ylim([0 400]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Meridional','Fontname','Times New Roman','FontWeight','b','FontSize',15);
set(ax(6).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(6).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
area(lon_for_bathy,-BATHY,max(mprs_nst3(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

% NST4
figure;hold on;set(gcf,'position',[4 342 1915 640]);
ax(7) = subplot(4,2,7);
pcolor(mlon_4,mdepth_4,u_non_vrtcl_avged_dtdd_NST4);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.8 0.8001]);
[c1 h1] = contour(mlon_4,mdepth_4,u_non_vrtcl_avged_dtdd_NST4,[-0.5:0.2:0.5],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lon_mcllcted,'-r',{'NST4-2','NST4-3','NST4-4','NST4-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',10);
xlim([min(lon_mcllcted) max(lon_mcllcted)]);
ylim([0 400]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Zonal','Fontname','Times New Roman','FontWeight','b','FontSize',15);
set(ax(7).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(7).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
xlabel('Longitude (^oE)','Fontname','Times New Roman','FontWeight','b','FontSize',15);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',15);
area(lon_for_bathy,-BATHY,max(mprs_nst4(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(8) = subplot(4,2,8);
pcolor(mlon_4,mdepth_4,v_non_vrtcl_avged_dtdd_NST4);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.8 0.8001]);
[c1 h1] = contour(mlon_4,mdepth_4,v_non_vrtcl_avged_dtdd_NST4,[-0.8:0.2:0.8],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lon_mcllcted,'-r',{'NST4-2','NST4-3','NST4-4','NST4-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',10);
xlim([min(lon_mcllcted) max(lon_mcllcted)]);
ylim([0 400]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Meridional','Fontname','Times New Roman','FontWeight','b','FontSize',15);
set(ax(8).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(8).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
xlabel('Longitude (^oE)','Fontname','Times New Roman','FontWeight','b','FontSize',15);
area(lon_for_bathy,-BATHY,max(mprs_nst4(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

%% 3D plot

[mlon_1 mlat_1 mdepth_1] = meshgrid(lon_target_1,lat_target_1,depth_target_1(:,1));

figure;hold on;set(gcf,'position',[468 175 898 701]);
m = meshz(X,Y,Z);grid on;
zlim([-630 0])
m.FaceColor = [.7 .7 .7];m.EdgeColor = 'k';
xtickformat('%.2f');
set(get(gca,'XAxis'),'FontName','Times New Roman','FontWeight','b','FontSize',16);
set(get(gca,'YAxis'),'FontName','Times New Roman','FontWeight','b','FontSize',16);
set(get(gca,'ZAxis'),'FontName','Times New Roman','FontWeight','b','FontSize',16);
xlabel('Longitude (^oE)','FontName','Times New Roman','FontWeight','b','FontSize',20);
ylabel('Latitude (^oN)','FontName','Times New Roman','FontWeight','b','FontSize',20);
zlabel('Depth (m)','FontName','Times New Roman','FontWeight','b','FontSize',20);
hold off;

mesh(mlon_1,mlat_1,v_non_vrtcl_avged_dtdd_NST1);shading interp;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');

figure;hold on;set(gcf,'position',[468 175 898 701]);
ax(1) = subplot(1,1,1);
pcolor(mlon_1,mdepth_1,v_non_vrtcl_avged_dtdd_NST1);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
h = colorbar;h.FontWeight = 'b';h.FontSize = 18;h.FontName = 'Times New Roman';
title(h,'[m/s]','FontName','Times New Roman','FontWeight','b','FontSize',18);
caxis([-0.5 0.5001]);
[c1 h1] = contour(mlon_1,mdepth_1,v_non_vrtcl_avged_dtdd_NST1,[-0.5:0.1:0.5],'-k');
clabel(c1,h1,'color','k','FontName','Times New Roman','FontWeight','b');
xlim([min(lon_mcllcted) max(lon_mcllcted)]);
ylim([0 400]);
xline(lon_mcllcted,'-r', {'NST1-2','NST1-3','NST1-4','NST1-5'},'LineWidth',.5, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center', ...
    'FontName','Times New Roman','FontWeight','b','FontSize',14);
xtickformat('%.2f');
title('v_{obs} at NST_1','FontName','Times New Roman','FontWeight','b','FontSize',28);
set(get(gca,'XAxis'),'FontName','Times New Roman','FontWeight','b','FontSize',16);
set(get(gca,'YAxis'),'FontName','Times New Roman','FontWeight','b','FontSize',16);
xlabel('Longitude (^oE)','FontName','Times New Roman','FontWeight','b','FontSize',20);
ylabel('Depth (m)','FontName','Times New Roman','FontWeight','b','FontSize',20);
area(lon_for_bathy,-BATHY,max(mprs_nst1(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

pcolor 함수 자체를 3D로 그릴 수 있는지










































