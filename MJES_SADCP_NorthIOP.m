clc;clear all;close all;

%% Load SADCP data
ds_sadcp = load_getmat('C:\codas_shared\unprocessed\allbins_');

%% Draw target map
% drawmap(129.4,130.0,36.2,36.8); % North IOP
% drawmap(129.4,130.4,35.0,36.0); % South IOP

%% Identify ship track
% North IOP
% P_dot1 = m_plot(ds.lon(1535:1535), ds.lat(1535:1535), 'o', 'markersize',8, ...
%     'markerfacecolor','y','markeredgecolor','r','linestyle','none','linewidth',1);
% P_dot2 = m_plot(ds.lon(1553:1553), ds.lat(1553:1553), 'o', 'markersize',8, ...
%     'markerfacecolor','y','markeredgecolor','r','linestyle','none','linewidth',1);  
% P_dot3 = m_plot(ds.lon(1563:1563), ds.lat(1563:1563), 'o', 'markersize',8, ...
%     'markerfacecolor','y','markeredgecolor','r','linestyle','none','linewidth',1);      
% P_dot4 = m_plot(ds.lon(1583:1583), ds.lat(1583:1583), 'o', 'markersize',8, ...
%     'markerfacecolor','y','markeredgecolor','r','linestyle','none','linewidth',1);
% m_line(ds.lon(1535:1553),ds.lat(1535:1553),'Color','r','linewidth',1.5);
% m_line(ds.lon(1552:1562),ds.lat(1552:1562),'Color','r','linewidth',1.5);
m_line(ds_sadcp.lon(801:827),ds_sadcp.lat(801:827),'Color','r','linewidth',1.5);
P_dot1 = m_line(ds_sadcp.lon(849:861),ds_sadcp.lat(849:861),'Color','r','linewidth',1.5);
m_line(ds_sadcp.lon(800:849),ds_sadcp.lat(800:849),'Color','r','linewidth',1.5);
Pline = m_line(ds_sadcp.lon(849:880),ds_sadcp.lat(849:880),'Color','k','linewidth',1.5);
m_line(ds_sadcp.lon(880:888),ds_sadcp.lat(880:888),'Color','k','linewidth',1.5);
m_line(ds_sadcp.lon(888:905),ds_sadcp.lat(888:905),'Color','k','linewidth',1.5);
P_dot6 = m_plot(ds_sadcp.lon(849:849), ds_sadcp.lat(849:849), 'o', 'markersize',13, ...
    'markerfacecolor','y','markeredgecolor','r','linestyle','none','linewidth',1);
P_dot6 = m_plot(ds_sadcp.lon(861:861), ds_sadcp.lat(861:861), 'o', 'markersize',13, ...
    'markerfacecolor','y','markeredgecolor','r','linestyle','none','linewidth',1);
P_dot6 = m_plot(ds_sadcp.lon(880:880), ds_sadcp.lat(880:880), 'o', 'markersize',13, ...
    'markerfacecolor','y','markeredgecolor','r','linestyle','none','linewidth',1);
P_dot6 = m_plot(ds_sadcp.lon(888:888), ds_sadcp.lat(888:888), 'o', 'markersize',13, ...
    'markerfacecolor','y','markeredgecolor','r','linestyle','none','linewidth',1);
P_dot7 = m_plot(ds_sadcp.lon(905:905), ds_sadcp.lat(905:905), 'o', 'markersize',13, ...
    'markerfacecolor','y','markeredgecolor','r','linestyle','none','linewidth',1);
legend([P_dot1],'SADCP track','fontsize',20,'fontname','Times New Roman', ...
    'fontweight','b','Position',[.1643 .8459 .3759 .044]);

% 796:827 NorthIOP_P1_P5_straight 
% 849:905 NorthIOP_P1_P5_CTD_casting
% 919:940 NorhIOP_belower_than_bottom_long_of_4
% 1535:1553 NorthIOP_middle_straight_of_4
% 1554:1562 NorthIOP_left_of_4
% 1563:1584 NorthIOP_bottom_long_of_4

%% Get target depth, trail, and time
depth_idxed = 1:30; % surface ~ 250m
trail_idxed_1 = 796:827; % P1 to P5
depth_target_1 = ds_sadcp.depth(depth_idxed,trail_idxed_1);
lon_target_1 = ds_sadcp.lon(1,trail_idxed_1);
lat_target_1 = ds_sadcp.lat(1,trail_idxed_1);
u_target_1 = ds_sadcp.u(depth_idxed,trail_idxed_1);
v_target_1 = ds_sadcp.v(depth_idxed,trail_idxed_1);
time_target_1 = ds_sadcp.time(1:6,trail_idxed_1);

trail_idxed_1 = 849:905; % P1 to P5 CTD casting
depth_target_1 = ds_sadcp.depth(depth_idxed,trail_idxed_1);
lon_target_1 = ds_sadcp.lon(1,trail_idxed_1);
lat_target_1 = ds_sadcp.lat(1,trail_idxed_1);
u_target_1 = ds_sadcp.u(depth_idxed,trail_idxed_1);
v_target_1 = ds_sadcp.v(depth_idxed,trail_idxed_1);
time_target_1 = ds_sadcp.time(1:6,trail_idxed_1);

idx_overlapped = [11:1:20 25:1:35 41:1:49 56 57];
depth_target_1(:,idx_overlapped) = [];
lon_target_1(idx_overlapped) = [];
lat_target_1(idx_overlapped) = [];
u_target_1(:,idx_overlapped) = [];
v_target_1(:,idx_overlapped) = [];
v_target_1([22 30],6) = nan;
time_target_1(:,idx_overlapped) = [];

trail_idxed_2 = 1535:1553; % NorthIOP_middle_straight_of_4
depth_target_2 = ds_sadcp.depth(depth_idxed,trail_idxed_2);
lon_target_2 = ds_sadcp.lon(1,trail_idxed_2);
lat_target_2 = ds_sadcp.lat(1,trail_idxed_2);
u_target_2 = ds_sadcp.u(depth_idxed,trail_idxed_2);
v_target_2 = ds_sadcp.v(depth_idxed,trail_idxed_2);
time_target_2 = ds_sadcp.time(1:6,trail_idxed_2);

trail_idxed_3 = 1554:1562; % NorthIOP_left_of_4
depth_target_3 = ds_sadcp.depth(depth_idxed,trail_idxed_3);
lon_target_3 = ds_sadcp.lon(1,trail_idxed_3);
lat_target_3 = ds_sadcp.lat(1,trail_idxed_3);
u_target_3 = ds_sadcp.u(depth_idxed,trail_idxed_3);
v_target_3 = ds_sadcp.v(depth_idxed,trail_idxed_3);
time_target_3 = ds_sadcp.time(1:6,trail_idxed_3);

trail_idxed_4 = 1563:1584; % NorthIOP_left_of_4
depth_target_4 = ds_sadcp.depth(depth_idxed,trail_idxed_4);
lon_target_4 = ds_sadcp.lon(1,trail_idxed_4);
lat_target_4 = ds_sadcp.lat(1,trail_idxed_4);
u_target_4 = ds_sadcp.u(depth_idxed,trail_idxed_4);
v_target_4 = ds_sadcp.v(depth_idxed,trail_idxed_4);
time_target_4 = ds_sadcp.time(1:6,trail_idxed_4);

% P_1st = combine(lat_target_1,lon_target_1,time_target_1)'; % P1 to P5_CTD_casting_point
% P_2nd = combine(lat_target_2,lon_target_2,time_target_2)'; % NorthIOP_middle_straight_of_4
% P_3rd = combine(lat_target_3,lon_target_3,time_target_3)'; % NorthIOP_left_of_4
% P_4th = combine(lat_target_4,lon_target_4,time_target_4)'; % NorthIOP_left_of_4

% writematrix(P_1st,'C:\matlib\tmd_toolbox\tmd_toolbox\LAT_LON\P_1st_CTD.txt','Delimiter','tab');
% writematrix(P_2nd,'C:\matlib\tmd_toolbox\tmd_toolbox\LAT_LON\P_2nd.txt','Delimiter','tab');
% writematrix(P_3rd,'C:\matlib\tmd_toolbox\tmd_toolbox\LAT_LON\P_3rd.txt','Delimiter','tab');
% writematrix(P_4th,'C:\matlib\tmd_toolbox\tmd_toolbox\LAT_LON\P_4th.txt','Delimiter','tab');

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
% cd('C:\matlib\tmd_toolbox\tmd_toolbox')
% TMD
cd('C:\matlib\tmd_toolbox\tmd_toolbox\OUT')
P_1st_track_u = load('P_1st_CTD_u.mat');
P_1st_track_v = load('P_1st_CTD_v.mat');
% P_2nd_track_u = load('P_2nd_u.mat');
% P_2nd_track_v = load('P_2nd_v.mat');
% P_3rd_track_u = load('P_3rd_u.mat');
% P_3rd_track_v = load('P_3rd_v.mat');
% P_4th_track_u = load('P_4th_u.mat');
% P_4th_track_v = load('P_4th_v.mat');

P_1st_utide = P_1st_track_u.TimeSeries./100;
P_1st_vtide = P_1st_track_v.TimeSeries./100;
% P_2nd_utide = P_2nd_track_u.TimeSeries./100;
% P_2nd_vtide = P_2nd_track_v.TimeSeries./100;
% P_3rd_utide = P_3rd_track_u.TimeSeries./100;
% P_3rd_vtide = P_3rd_track_v.TimeSeries./100;
% P_4th_utide = P_4th_track_u.TimeSeries./100;
% P_4th_vtide = P_4th_track_v.TimeSeries./100;

P_1st_u_dtdd = u_target_1_avg - P_1st_utide;
P_1st_v_dtdd = v_target_1_avg - P_1st_vtide;
% P_2nd_u_dtdd = u_target_2_avg - P_2nd_utide;
% P_2nd_v_dtdd = v_target_2_avg - P_2nd_vtide;
% P_3rd_u_dtdd = u_target_3_avg - P_3rd_utide;
% P_3rd_v_dtdd = v_target_3_avg - P_3rd_vtide;
% P_4th_u_dtdd = u_target_4_avg - P_4th_utide;
% P_4th_v_dtdd = v_target_4_avg - P_4th_vtide;

%% Plot vectors
% close all;
% drawmap(129.4,130.0,36.2,36.8); % time: Dec 4^{th} 00:10 ~ Dec 4^{th} 02:45
% orgnl_vec_1 = m_quiver(lon_target_1,lat_target_1,u_target_1_avg./5,v_target_1_avg./5,0,'k','LineWidth',1.);
% tidal_vec_1 = m_quiver(lon_target_1,lat_target_1,P_1st_utide./5,P_1st_vtide./5,0,'b','LineWidth',1.);
% dtided_vec_1 = m_quiver(lon_target_1,lat_target_1,P_1st_u_dtdd./5,P_1st_v_dtdd./5,0,'r','LineWidth',1.);
% m_quiver(129.42,36.3,0.5/5,0,'k','linewidth',1);
% m_text(129.43,36.28,'0.5 m/s','fontsize',11,'fontname', ...
%     'Times New Romans','fontweight','b');
% m_line(lon_target_1,lat_target_1,'Color','k');
% legend([orgnl_vec_1 tidal_vec_1 dtided_vec_1],'Origianal','Tidal','Detided');

% drawmap(129.4,130.0,36.2,36.8); % time: Dec 6^{th} 13:45 ~ Dec 6^{th} 15:15
% orgnl_vec_2 = m_quiver(lon_target_2,lat_target_2,u_target_2_avg./5,v_target_2_avg./5,0,'k','LineWidth',1.);
% tidal_vec_2 = m_quiver(lon_target_2,lat_target_2,P_2nd_utide./5,P_2nd_vtide./5,0,'b','LineWidth',1.);
% dtided_vec_2 = m_quiver(lon_target_2,lat_target_2,P_2nd_u_dtdd./5,P_2nd_v_dtdd./5,0,'r','LineWidth',1.);
% m_quiver(129.42,36.3,0.5/5,0,'k','linewidth',1);
% m_text(129.43,36.28,'0.5 m/s','fontsize',11,'fontname', ...
%     'Times New Romans','fontweight','b');
% m_line(lon_target_2,lat_target_2,'Color','k');
% legend([orgnl_vec_2 tidal_vec_2 dtided_vec_2],'Origianal','Tidal','Detided');
% 
% drawmap(129.4,130.0,36.2,36.8); % time: Dec 6^{th} 15:20 ~ Dec 6^{th} 16:00
% orgnl_vec_3 = m_quiver(lon_target_3,lat_target_3,u_target_3_avg./5,v_target_3_avg./5,0,'k','LineWidth',1.);
% tidal_vec_3 = m_quiver(lon_target_3,lat_target_3,P_3rd_utide./5,P_3rd_vtide./5,0,'b','LineWidth',1.);
% dtided_vec_3 = m_quiver(lon_target_3,lat_target_3,P_3rd_u_dtdd./5,P_3rd_v_dtdd./5,0,'r','LineWidth',1.);
% m_quiver(129.42,36.3,0.5/5,0,'k','linewidth',1);
% m_text(129.43,36.28,'0.5 m/s','fontsize',11,'fontname', ...
%     'Times New Romans','fontweight','b');
% m_line(lon_target_3,lat_target_3,'Color','k');
% legend([orgnl_vec_3 tidal_vec_3 dtided_vec_3],'Origianal','Tidal','Detided');
% 
% drawmap(129.4,130.0,36.2,36.8); % time: Dec 6^{th} 16:05 ~ Dec 6^{th} 17:50
% orgnl_vec_4 = m_quiver(lon_target_4,lat_target_4,u_target_4_avg./5,v_target_4_avg./5,0,'k','LineWidth',1.);
% tidal_vec_4 = m_quiver(lon_target_4,lat_target_4,P_4th_utide./5,P_4th_vtide./5,0,'b','LineWidth',1.);
% dtided_vec_4 = m_quiver(lon_target_4,lat_target_4,P_4th_u_dtdd./5,P_4th_v_dtdd./5,0,'r','LineWidth',1.);
% m_quiver(129.42,36.3,0.5/5,0,'k','linewidth',1);
% m_text(129.43,36.28,'0.5 m/s','fontsize',11,'fontname', ...
%     'Times New Romans','fontweight','b');
% m_line(lon_target_4,lat_target_4,'Color','k');
% legend([orgnl_vec_4 tidal_vec_4 dtided_vec_4],'Origianal','Tidal','Detided');

%% Axes transformation
% close all;
% p_1st_P = polyfit(P_1st_u_dtdd,P_1st_v_dtdd,1);
% angl_1st_P = atan(p_1st_P(1));

% ax(1) = subplot(121);
% plot(P_1st_u_dtdd,P_1st_v_dtdd,'.k');
% ylim([-0.7 0.7]);xline([0]);xlim([-0.4 0.4])
% ax(2) = subplot(122);
% plot(a,b,'.r');
% ylim([-0.7 0.7]);xline([0]);xlim([-0.4 0.4])

% tx = txsite('Name','P1','Latitude',ds_sadcp.lat(796:796),'Longitude',ds_sadcp.lon(796:796));
% rx = rxsite('Name','P5','Latitude',ds_sadcp.lat(827:827),'Longitude',ds_sadcp.lon(827:827));
% angl_1st_P_deg = angle(tx,rx,'greatcircle');
% angl_1st_P = deg2rad(angl_1st_P_deg);

%% Vertical velocity structure on transformed axes

% Detide over the whole water column
u_non_vrtcl_avged_dtdd_P_1st = u_target_1(:,:);%-P_1st_utide;
v_non_vrtcl_avged_dtdd_P_1st = v_target_1(:,:);%-P_1st_vtide;
u_non_vrtcl_avged_dtdd_P_2nd = u_target_2(:,:);%-P_2nd_utide;
v_non_vrtcl_avged_dtdd_P_2nd = v_target_2(:,:);%-P_2nd_vtide;
u_non_vrtcl_avged_dtdd_P_3rd = u_target_3(:,:);%-P_3rd_utide;
v_non_vrtcl_avged_dtdd_P_3rd = v_target_3(:,:);%-P_3rd_vtide;
u_non_vrtcl_avged_dtdd_P_4th = u_target_4(:,:);%-P_4th_utide;
v_non_vrtcl_avged_dtdd_P_4th = v_target_4(:,:);%-P_4th_vtide;

% Transform coordinates
% u_prime_non_vrtcl_avged_dtdd_P_1st = cos(angl_1st_P).*u_non_vrtcl_avged_dtdd_P_1st + sin(angl_1st_P).*v_non_vrtcl_avged_dtdd_P_1st;
% v_prime_non_vrtcl_avged_dtdd_P_1st = -sin(angl_1st_P).*u_non_vrtcl_avged_dtdd_P_1st + cos(angl_1st_P).*v_non_vrtcl_avged_dtdd_P_1st;

% close all
[mlat_1 mdepth_1] = meshgrid(lat_target_1,depth_target_1(:,1));
[mlat_2 mdepth_2] = meshgrid(lat_target_2,depth_target_2(:,1));
[mlat_3 mdepth_3] = meshgrid(lat_target_3,depth_target_3(:,1));
[mlon_4 mdepth_4] = meshgrid(lon_target_4,depth_target_4(:,1));

%% Get a geostrophic component
cd('C:\Users\USER\OneDrive\Desktop\data\MJES\MJES_KOR\CTD_prcssed\10_asciiout')
files_P = dir('P*.asc');
n = 0;
% Load each dataset from P
for i = 1:5
    n = n+1;
    ds_P_CTD_target{n} = importdata(files_P(i).name);
end
% Get maximum size of row of each column
for i = 1:5
    num_of_row_max_P(i) = max(size(ds_P_CTD_target{1,i}.data));
end
% Assign pressure
for i = 1:5
    prs_P{i} = ds_P_CTD_target{1,i}.data(:,2);
end
% Creat nan matrix for each variable
prs_new_P = nan(max(num_of_row_max_P),5);
potemp_new_P = nan(max(num_of_row_max_P),5);
psal_new_P = nan(max(num_of_row_max_P),5);
% Assign rest variables
for i = 1:5
    prs_new_P(prs_P{1,i},i) = ds_P_CTD_target{1,i}.data(:,2);
    potemp_new_P(prs_P{1,i},i) = ds_P_CTD_target{1,i}.data(:,11);
    psal_new_P(prs_P{1,i},i) = ds_P_CTD_target{1,i}.data(:,5);
end
% Slice some rows to make a consistent form of matrix(otherwise errors hit)
for i = 1:5
    ga_P(4:125,i) = sw_gpan(psal_new_P(4:125,i),potemp_new_P(4:125,i),prs_new_P(4:125,i));
end
% Assign lat, lon from VS, VP CTD data
for i = 1:5   
    lat_P{i} = ds_P_CTD_target{1,i}.data(19,6);
    lon_P{i} = ds_P_CTD_target{1,i}.data(19,7);
end
% Convert them into a double form
lat_P = cell2mat(lat_P);
lon_P = cell2mat(lon_P);

% Calculate geostrophic velocity
gvel_P = sw_gvel(ga_P,lat_P,lon_P);

% Level of no motion (lnm)
[m_gvel_P n_gvel_P] = size(gvel_P);
for i = 1:n_gvel_P
    if gvel_P(end,i) < 0
        gvel_P(4:end,i) = gvel_P(4:end,i) + abs(gvel_P(m_gvel_P,i));
    elseif gvel_P(end,i) > 0
        gvel_P(4:end,i) = gvel_P(4:end,i) - abs(gvel_P(m_gvel_P,i));
    end
end

% Find middle points of each lon
for i = 1:length(lat_P)-1
    lat_mean_P(i) = (lat_P(i)+lat_P(i+1))./2;
end

% Define new meshgrids
[mlat_P mdepth_P] = meshgrid(lat_mean_P,prs_new_P(4:125,2));

% Obs - Geo 
v_prime_non_vrtcl_avged_dtdd_P_1st_regridded = interp2(mlat_1,mdepth_1,v_prime_non_vrtcl_avged_dtdd_P_1st,mlat_P,mdepth_P);
v_ageo_P = v_prime_non_vrtcl_avged_dtdd_P_1st_regridded - gvel_lnm_P;

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

lon_for_bathy_3 = linspace(min(lon_target_3),max(lon_target_3),100);
lat_for_bathy_3 = linspace(min(lat_target_3),max(lat_target_3),100);
for i = 1:length(lon_target_3)
    [BATHY_3(i),XGRID_3(i),YGRID_3(i)] = gebconetcdf('C:\matlib\gebco_2021\gebco_08.nc',lon_target_3(i),lon_target_3(i),lat_target_3(i),lat_target_3(i));
end

lon_for_bathy_4 = linspace(min(lon_target_4),max(lon_target_4),100);
lat_for_bathy_4 = linspace(min(lat_target_4),max(lat_target_4),100);
for i = 1:length(lon_target_4)
    [BATHY_4(i),XGRID_4(i),YGRID_4(i)] = gebconetcdf('C:\matlib\gebco_2021\gebco_08.nc',lon_target_4(i),lon_target_4(i),lat_target_4(i),lat_target_4(i));
end


%% Plot
figure;hold on;set(gcf,'position',[111 2 568 994]);
ax(1) = subplot(5,2,1);
pcolor(mlat_1,mdepth_1,u_non_vrtcl_avged_dtdd_P_1st);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlat_1,mdepth_1,u_non_vrtcl_avged_dtdd_P_1st,[-0.7:0.2:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',10);
xlim([min(lat_target_1)-0.001 max(lat_target_1)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Zonal','Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(1).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(1).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
xlabel('Latitude (^oN)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
area(lat_for_bathy,-BATHY,max(mdepth_1(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(2) = subplot(5,2,2);
pcolor(mlat_1,mdepth_1,v_non_vrtcl_avged_dtdd_P_1st);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlat_1,mdepth_1,v_non_vrtcl_avged_dtdd_P_1st,[-0.7:0.2:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',10);
xlim([min(lat_target_1)-0.001 max(lat_target_1)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Meridional','Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(2).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(2).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
xlabel('Latitude (^oN)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
area(lat_for_bathy,-BATHY,max(mdepth_1(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(3) = subplot(5,2,3);
pcolor(mlat_1,mdepth_1,u_non_vrtcl_avged_dtdd_P_1st);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlat_1,mdepth_1,u_non_vrtcl_avged_dtdd_P_1st,[-0.7:0.2:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xlim([min(lat_target_1)-0.001 max(lat_target_1)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Zonal','Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(3).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(3).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
xlabel('Latitude (^oN)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
area(lat_target_1,-BATHY_1,max(mdepth_1(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(4) = subplot(5,2,4);
pcolor(mlat_1,mdepth_1,v_non_vrtcl_avged_dtdd_P_1st);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlat_1,mdepth_1,v_non_vrtcl_avged_dtdd_P_1st,[-0.7:0.2:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xlim([min(lat_target_1)-0.001 max(lat_target_1)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Meridional','Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(4).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(4).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
xlabel('Latitude (^oN)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
area(lat_target_1,-BATHY_1,max(mdepth_1(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(5) = subplot(5,2,5);
pcolor(mlat_2,mdepth_2,u_non_vrtcl_avged_dtdd_P_2nd);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlat_2,mdepth_2,u_non_vrtcl_avged_dtdd_P_2nd,[-0.7:0.2:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xlim([min(lat_target_2)-0.001 max(lat_target_2)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Zonal','Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(5).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(5).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
xlabel('Latitude (^oN)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
area(lat_target_2,-BATHY_2,max(mdepth_2(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(6) = subplot(5,2,6);
pcolor(mlat_2,mdepth_2,v_non_vrtcl_avged_dtdd_P_2nd);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlat_2,mdepth_2,v_non_vrtcl_avged_dtdd_P_2nd,[-0.7:0.2:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xlim([min(lat_target_2)-0.001 max(lat_target_2)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Meridional','Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(6).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(6).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
xlabel('Latitude (^oN)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
area(lat_target_2,-BATHY_2,max(mdepth_2(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(7) = subplot(5,2,7);
pcolor(mlat_3,mdepth_3,u_non_vrtcl_avged_dtdd_P_3rd);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlat_3,mdepth_3,u_non_vrtcl_avged_dtdd_P_3rd,[-0.7:0.2:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xlim([min(lat_target_3)-0.001 max(lat_target_3)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Zonal','Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(7).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(7).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
xlabel('Latitude (^oN)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
area(lat_target_3,-BATHY_3,max(mdepth_3(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(8) = subplot(5,2,8);
pcolor(mlat_3,mdepth_3,v_non_vrtcl_avged_dtdd_P_3rd);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlat_3,mdepth_3,v_non_vrtcl_avged_dtdd_P_3rd,[-0.7:0.2:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xlim([min(lat_target_3)-0.001 max(lat_target_3)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Meridional','Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(8).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(8).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
xlabel('Latitude (^oN)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
area(lat_target_3,-BATHY_3,max(mdepth_3(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(9) = subplot(5,2,9);
pcolor(mlon_4,mdepth_4,u_non_vrtcl_avged_dtdd_P_4th);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_4,mdepth_4,u_non_vrtcl_avged_dtdd_P_4th,[-0.7:0.2:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xlim([min(lon_target_4)-0.001 max(lon_target_4)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Zonal','Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(9).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(9).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
xlabel('Longitude (^oN)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
area(lon_target_4,-BATHY_4,max(mdepth_4(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(10) = subplot(5,2,10);
pcolor(mlon_4,mdepth_4,v_non_vrtcl_avged_dtdd_P_4th);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.7 0.7001]);
[c1 h1] = contour(mlon_4,mdepth_4,v_non_vrtcl_avged_dtdd_P_4th,[-0.7:0.2:0.7],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xlim([min(lon_target_4)-0.001 max(lon_target_4)+0.001]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 10;h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','Fontname','Times New Roman','fontweight','b','FontSize',10);
title('Meridional','Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(10).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
set(ax(10).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',10);
xlabel('Longitude (^oN)','Fontname','Times New Roman','FontWeight','b','FontSize',10);
area(lon_target_4,-BATHY_4,max(mdepth_4(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

%% Partial depth average
u_non_vrtcl_avged_dtdd_P_1st_upr = mean(u_non_vrtcl_avged_dtdd_P_1st(1:11,:),'omitnan'); % surface ~ 99m
u_non_vrtcl_avged_dtdd_P_1st_btm = mean(u_non_vrtcl_avged_dtdd_P_1st(12:end,:),'omitnan');
v_non_vrtcl_avged_dtdd_P_1st_upr = mean(v_non_vrtcl_avged_dtdd_P_1st(1:11,:),'omitnan');
v_non_vrtcl_avged_dtdd_P_1st_btm = mean(v_non_vrtcl_avged_dtdd_P_1st(12:end,:),'omitnan');

u_non_vrtcl_avged_dtdd_P_2nd_upr = mean(u_non_vrtcl_avged_dtdd_P_2nd(1:8,:),'omitnan'); % surface ~ 75m
u_non_vrtcl_avged_dtdd_P_2nd_btm = mean(u_non_vrtcl_avged_dtdd_P_2nd(9:end,:),'omitnan');
v_non_vrtcl_avged_dtdd_P_2nd_upr = mean(v_non_vrtcl_avged_dtdd_P_2nd(1:8,:),'omitnan');
v_non_vrtcl_avged_dtdd_P_2nd_btm = mean(v_non_vrtcl_avged_dtdd_P_2nd(9:end,:),'omitnan');

u_non_vrtcl_avged_dtdd_P_3rd_upr = mean(u_non_vrtcl_avged_dtdd_P_3rd(1:6,:),'omitnan'); % surface ~ 59m
u_non_vrtcl_avged_dtdd_P_3rd_btm = mean(u_non_vrtcl_avged_dtdd_P_3rd(7:end,:),'omitnan');
v_non_vrtcl_avged_dtdd_P_3rd_upr = mean(v_non_vrtcl_avged_dtdd_P_3rd(1:6,:),'omitnan');
v_non_vrtcl_avged_dtdd_P_3rd_btm = mean(v_non_vrtcl_avged_dtdd_P_3rd(7:end,:),'omitnan');

u_non_vrtcl_avged_dtdd_P_4th_upr = mean(u_non_vrtcl_avged_dtdd_P_4th(1:9,:),'omitnan'); % surface ~ 83m
u_non_vrtcl_avged_dtdd_P_4th_btm = mean(u_non_vrtcl_avged_dtdd_P_4th(10:end,:),'omitnan');
v_non_vrtcl_avged_dtdd_P_4th_upr = mean(v_non_vrtcl_avged_dtdd_P_4th(1:9,:),'omitnan');
v_non_vrtcl_avged_dtdd_P_4th_btm = mean(v_non_vrtcl_avged_dtdd_P_4th(10:end,:),'omitnan');

drawmap(129.4,130.0,36.2,36.8); % surface ~ 99m
surf_avg_1 = m_quiver(lon_target_1,lat_target_1,u_non_vrtcl_avged_dtdd_P_1st_upr./5,v_non_vrtcl_avged_dtdd_P_1st_upr./5,0,'k','LineWidth',1.5);
btm_avg_1 = m_quiver(lon_target_1,lat_target_1,u_non_vrtcl_avged_dtdd_P_1st_btm./5,v_non_vrtcl_avged_dtdd_P_1st_btm./5,0,'r','LineWidth',1.5);
m_quiver(129.42,36.3,0.5/5,0,'k','LineWidth',1.5);
m_text(129.43,36.28,'0.5 m/s','FontSize',22,'FontName','Times New Roman','FontWeight','b');
m_line(lon_target_1,lat_target_1,'Color','k');
legend([surf_avg_1 btm_avg_1],'Surf. ~ 99m','107m ~ Bot.','Location','northwest','FontName','Times New Roman','FontWeight','b','FontSize',20);

drawmap(129.4,130.0,36.2,36.8); % surface ~ 75m
surf_avg_2 = m_quiver(lon_target_2,lat_target_2,u_non_vrtcl_avged_dtdd_P_2nd_upr./5,v_non_vrtcl_avged_dtdd_P_2nd_upr./5,0,'k','LineWidth',1.5);
btm_avg_2 = m_quiver(lon_target_2,lat_target_2,u_non_vrtcl_avged_dtdd_P_2nd_btm./5,v_non_vrtcl_avged_dtdd_P_2nd_btm./5,0,'r','LineWidth',1.5);
m_quiver(129.42,36.3,0.5/5,0,'k','linewidth',1.5);
m_text(129.43,36.28,'0.5 m/s','FontSize',22,'FontName','Times New Roman','FontWeight','b');
m_line(lon_target_2,lat_target_2,'Color','k');
legend([surf_avg_2 btm_avg_2],'Surf. ~ 75m','83m ~ Bot','Location','northwest','FontName','Times New Roman','FontWeight','b','FontSize',20);

drawmap(129.4,130.0,36.2,36.8); % surface ~ 59m % Dec 6^{th} 15:20 ~ Dec 6^{th} 16:00
surf_avg_3 = m_quiver(lon_target_3,lat_target_3,u_non_vrtcl_avged_dtdd_P_3rd_upr./5,v_non_vrtcl_avged_dtdd_P_3rd_upr./5,0,'k','LineWidth',1.5);
btm_avg_3 = m_quiver(lon_target_3,lat_target_3,u_non_vrtcl_avged_dtdd_P_3rd_btm./5,v_non_vrtcl_avged_dtdd_P_3rd_btm./5,0,'r','LineWidth',1.5);
m_quiver(129.42,36.3,0.5/5,0,'k','linewidth',1.5);
m_text(129.43,36.28,'0.5 m/s','FontSize',22,'FontName','Times New Roman','FontWeight','b');
m_line(lon_target_3,lat_target_3,'Color','k');
legend([surf_avg_3 btm_avg_3],'Surf. ~ 59m','67m ~ Bot.','Location','northwest','FontName','Times New Roman','FontWeight','b','FontSize',20);

drawmap(129.4,130.0,36.2,36.8); % surface ~ 83m % Dec 6^{th} 16:05 ~ Dec 6^{th} 17:50
surf_avg_4 = m_quiver(lon_target_4,lat_target_4,u_non_vrtcl_avged_dtdd_P_4th_upr./5,v_non_vrtcl_avged_dtdd_P_4th_upr./5,0,'k','LineWidth',1.5);
btm_avg_4 = m_quiver(lon_target_4,lat_target_4,u_non_vrtcl_avged_dtdd_P_4th_btm./5,v_non_vrtcl_avged_dtdd_P_4th_btm./5,0,'r','LineWidth',1.5);
m_quiver(129.42,36.3,0.5/5,0,'k','linewidth',1.5);
m_text(129.43,36.28,'0.5 m/s','fontsize',22,'FontName','Times New Roman','FontWeight','b');
m_line(lon_target_4,lat_target_4,'Color','k');
legend([surf_avg_4 btm_avg_4],'Surf. ~ 83m','91m ~ Bot.','Location','northwest','FontName','Times New Roman','FontWeight','b','FontSize',20);







