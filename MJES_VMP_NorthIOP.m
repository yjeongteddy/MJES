clc;clear all;close all;

%% Buoyancy Frequency
[SA_P, in_ocean_P] = gsw_SA_from_SP(sal_cllcted,prs_cllcted,lon_cllcted,lat_cllcted);
CT_P = gsw_CT_from_pt(SA_P,TEMP_cllcted);
[N2_P, p_mid_P] = gsw_Nsquared(SA_P,CT_P,prs_cllcted,lat_cllcted);

[SA_NST1, in_ocean_NST1] = gsw_SA_from_SP(sal{1},prs{1},lon{1},lat{1});
CT_NST1 = gsw_CT_from_pt(SA_NST1,TEMP{1});
[N2_NST1, p_mid_NST1] = gsw_Nsquared(SA_NST1,CT_NST1,prs{1},lat{1});

%% N2 Plot
% P line
figure;set(gcf,'position',[403 42 1149 954]);
ax(1) = subplot(1,1,1);
pcolor(mlat,p_mid_P(2:end,:),N2_P(2:end,:));shading interp;hold on;
CT = cbrewer('seq','Reds',50,'linear');
colormap(CT);
set(gca,'YDir','reverse');
caxis([0 0.0006]);
[c1 h1] = contour(mlat,mprs,dnsty_cllcted(mprs(1,1):end,:),[24.5:0.25:27.5],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
% [c1 h1] = contour(mlat,mprs,N2_P(2:end,:),[0.0002:0.0002:0.0006],'-k','LabelSpacing',2000);
% clabel(c1,h1,'color','k');
xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5,  ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center','fontname','Times New Roman','FontSize',22);
xlim([min(lat_mcllcted) max(lat_mcllcted)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; 
title('N^2','fontname','Times New Roman','fontweight','b','fontsize',40);
h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontname','Times New Roman','fontweight','b','fontsize',20);
h.FontWeight = 'b';h.FontSize = 20;h.FontName = 'Times New Roman';
set(ax(1).XAxis,'fontname','Times New Roman','FontWeight','b','fontsize',22);
set(ax(1).YAxis,'fontname','Times New Roman','FontWeight','b','fontsize',22);
ylabel('Pressure (db)','fontname','Times New Roman','fontsize',30,'fontweight','b');
xlabel('Latitude (^oN)','fontname','Times New Roman','fontsize',30,'fontweight','b');
area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

%%  Vertical velocity from LADCP
cd('C:\Users\USER\OneDrive\Desktop\data\MJES\MJES_KOR\LADCP\processed')
files_LADCP = dir('P*.mat');
for i = 1:5
    P{i} = load(files_LADCP(i).name);
end
for i = 1:5
    P_u{i} = P{1,i}.dr.u;
    P_v{i} = P{1,i}.dr.v;
    P_z{i} = P{1,i}.dr.z;
end
for i = 1:5
    P_z_rdd{i} = round(P_z{1,i}); % rdd: rounded
end
for i = 1:5
    P_z_new(:,i) = 1:1:270;
    P_u_new(:,i) = interp1(P_z_rdd{1,i},P_u{1,i},P_z_new(:,i));
    P_v_new(:,i) = interp1(P_z_rdd{1,i},P_v{1,i},P_z_new(:,i));
end

% Define grid
[mlat_LADCP mdepth_LADCP] = meshgrid(lat_mcllcted,P_z_new(:,1));

% P line of LADCP
figure;hold on;set(gcf,'position',[111 216 1698 636]);
ax(1) = subplot(1,2,1);
pcolor(mlat_LADCP,mdepth_LADCP,P_u_new);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.9 0.9]);
[c1 h1] = contour(mlat_LADCP,mdepth_LADCP,P_u_new,[-0.9:0.1:0.9],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',15,'FontWeight','b');
xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',25);
xlim([min(lat_mcllcted) max(lat_mcllcted)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar;h.FontWeight = 'b';h.FontSize = 20;h.FontName = 'Times New Roman';h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','FontName','Times New Roman','fontweight','b','fontsize',20);
title('Zonal','FontName','Times New Roman','fontweight','b','fontsize',35);
set(ax(1).XAxis,'FontName','Times New Roman','FontWeight','b','fontsize',20);
set(ax(1).YAxis,'FontName','Times New Roman','FontWeight','b','fontsize',20);
ylabel('Pressure (db)','fontname','Times New Roman','fontsize',35,'fontweight','b');
xlabel('Latitude (^oN)','fontname','Times New Roman','fontsize',35,'fontweight','b');
area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(2) = subplot(1,2,2);
pcolor(mlat_LADCP,mdepth_LADCP,P_v_new);shading interp;hold on;
CT = flip(cbrewer('div','RdBu',50,'linear'),1);
colormap(CT);
set(gca,'YDir','reverse');
caxis([-0.9 0.9]);
[c1 h1] = contour(mlat_LADCP,mdepth_LADCP,P_v_new,[-0.9:0.1:0.9],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',15,'FontWeight','b');
xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',25);
xlim([min(lat_mcllcted) max(lat_mcllcted)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar;h.FontWeight = 'b';h.FontSize = 20;h.FontName = 'Times New Roman';h.Ruler.TickLabelFormat = '%.1f';
title(h,'[m/s]','FontName','Times New Roman','fontweight','b','fontsize',20);
title('Meridional','FontName','Times New Roman','fontweight','b','fontsize',35);
set(ax(2).XAxis,'FontName','Times New Roman','FontWeight','b','fontsize',20);
set(ax(2).YAxis,'FontName','Times New Roman','FontWeight','b','fontsize',20);
% ylabel('Pressure (db)','fontname','Times New Roman','fontsize',30,'fontweight','b');
xlabel('Latitude (^oN)','fontname','Times New Roman','fontsize',35,'fontweight','b');
area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

%% Richardson Number
% Denominator for Ri
[FX_u FY_u] = gradient(P_u_new);
[FX_v FY_v] = gradient(P_v_new);
FY_u = -FY_u;
FY_v = -FY_v;
FY_u_squared = FY_u.^2;
FY_v_squared = FY_v.^2;
S2_P = FY_u_squared + FY_v_squared;

% Numerator for Ri
N2_P_for_Ri = N2_P(1:length(S2_P),:);

% Mask redundant data
[m n] = size(N2_P_for_Ri);
for i = 1:m
    for j = 1:n
        Ri(i,j) = N2_P_for_Ri(i,j)/(FY_u_squared(i,j) + FY_v_squared(i,j));
    end
end

% Fill nan at each negative value
for i = 1:m
    for j = 1:n
        target_Ri = N2_P_for_Ri(i,j)/(FY_u_squared(i,j) + FY_v_squared(i,j));
        if target_Ri < 0 || isnan(target_Ri)
            Ri(i,j) = nan;
        else
            Ri(i,j) = target_Ri;
        end
     end
end

% Take partial depth average
for i = 1:n
    for j = 1:5:m
        Ri(j:j+4,i) = mean(Ri(j:j+4,i),'omitnan');
    end
end

% Plot velocity shear
figure;hold on;set(gcf,'position',[111 216 1698 636]);
ax(1) = subplot(1,2,1);
pcolor(mlat_LADCP,mdepth_LADCP,FY_u_squared);shading interp;hold on;
c1 = colormap('jet');
set(gca,'YDir','reverse');
caxis([0 0.0012]);
[c1 h1] = contour(mlat_LADCP,mdepth_LADCP,P_u_new,[-0.9:0.1:0.9],'-w','LineWidth',1);
clabel(c1,h1,'color','w','FontSize',15,'FontWeight','b');
% [c1 h1] = contour(mlat_LADCP,mdepth_LADCP,FY_u_squared,[0:0.0006:0.0012],'-k','LabelSpacing',1000);
% clabel(c1,h1,'color','k');
xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',25);
xlim([min(lat_mcllcted) max(lat_mcllcted)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 20;h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontname','Times New Roman','fontweight','b','fontsize',20);
title('u current shear','fontname','Times New Roman','fontweight','b','fontsize',35);
set(ax(1).XAxis,'fontname','Times New Roman','FontWeight','b','fontsize',20);
set(ax(1).YAxis,'fontname','Times New Roman','FontWeight','b','fontsize',20);
ylabel('Pressure (db)','fontname','Times New Roman','fontsize',35,'fontweight','b');
xlabel('Latitude (^oN)','fontname','Times New Roman','fontsize',35,'fontweight','b');
area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(2) = subplot(1,2,2);
pcolor(mlat_LADCP,mdepth_LADCP,FY_v_squared);shading interp;hold on;
c1 = colormap('jet');
set(gca,'YDir','reverse');
caxis([0 0.0012]);
[c1 h1] = contour(mlat_LADCP,mdepth_LADCP,P_v_new,[-0.9:0.1:0.9],'-w','LineWidth',1);
clabel(c1,h1,'color','w','FontSize',15,'FontWeight','b');
% [c1 h1] = contour(mlat_LADCP,mdepth_LADCP,FY_u_squared,[0:0.0006:0.0012],'-k','LabelSpacing',1000);
% clabel(c1,h1,'color','k');
xline(lat_mcllcted,'-r',{'P1','P2','P3','P4','P5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',25);
xlim([min(lat_mcllcted) max(lat_mcllcted)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 20;h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontname','Times New Roman','fontweight','b','fontsize',20);
title('v current shear','fontname','Times New Roman','fontweight','b','fontsize',35);
set(ax(2).XAxis,'fontname','Times New Roman','FontWeight','b','fontsize',20);
set(ax(2).YAxis,'fontname','Times New Roman','FontWeight','b','fontsize',20);
% ylabel('Pressure (db)','fontname','Times New Roman','fontsize',35,'fontweight','b');
xlabel('Latitude (^oN)','fontname','Times New Roman','fontsize',35,'fontweight','b');
area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

figure;set(gcf,'position',[221 42 1274 954]);
ax(1) = subplot(1,1,1);
pcolor(mlat_LADCP,mdepth_LADCP,S2_P);shading interp;hold on;
c1 = colormap('jet');
set(gca,'YDir','reverse');
caxis([0 0.0012]);
[c1 h1] = contour(mlat_LADCP,mdepth_LADCP,FY_u_squared+FY_v_squared,[0:0.0006:0.0012],'-k','LabelSpacing',1000);
clabel(c1,h1,'color','k');
xline(lat_mcllcted,'-r', ...
    {'P1','P2','P3','P4','P5'},'LineWidth',.5,'fontname','Times New Roman','FontSize',22, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; 
title('S^2','fontname','Times New Roman','fontweight','b','fontsize',40);
h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontname','Times New Roman','fontweight','b','fontsize',20);
h.FontWeight = 'b';h.FontSize = 20;h.FontName = 'Times New Roman';
set(ax(1).XAxis,'fontname','Times New Roman','FontWeight','b','fontsize',22);
set(ax(1).YAxis,'fontname','Times New Roman','FontWeight','b','fontsize',22);
ylabel('Pressure (db)','fontname','Times New Roman','fontsize',30,'fontweight','b');
xlabel('Latitude (^oN)','fontname','Times New Roman','fontsize',30,'fontweight','b');
area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

% Plot Richardson number
ax(5) = subplot(2,3,5);
pcolor(mlat_LADCP,mdepth_LADCP,Ri);shading interp;hold on;
J = customcolormap([0 0.5 0.795 1],{'#ffffff','#ffffff','#0000ff','#ff0000'});
colormap(ax(5),J);
set(gca,'YDir','reverse');
caxis([0 2]);
xline(lat_cllcted(20,:),'-r', ...
    {'P1','P2','P3','P4','P5'},'LineWidth',.5,'Fontname','Times New Roman','FontSize',22, ...
    'LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center');
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; 
title('Ri','fontname','Times New Roman','fontweight','b','fontsize',40);
h.Ruler.TickLabelFormat = '%.1f';h.Ticks = [0 0.25 1 2];h.TickLabels = [0 0.25 1 2];
h.FontWeight = 'b';h.FontSize = 20;h.FontName = 'Times New Roman';
set(ax(5).XAxis,'fontname','Times New Roman','FontWeight','b','fontsize',22);
set(ax(5).YAxis,'fontname','Times New Roman','FontWeight','b','fontsize',22);
xlabel('Latitude (^oN)','fontname','Times New Roman','fontsize',30,'fontweight','b');
area(lat_for_bathy,-BATHY,max(mprs(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

%% Ri < 0.25 shading
for i = 1:m
    for j = 1:n
        if Ri(i,j) <= 0.25
            Ri_shad(i,j) = 1;
        else
            Ri_shad(i,j) = 0;
        end
    end
end

for j = 1:n
    for i = 1:m
        if i > 1
            if Ri_shad(i,j) == 1 && Ri_shad(i-1,j) == 0
                n = 0;
                while 1
                    n = n+1;
                    if Ri_shad(i+n,j) == 0 || i+n == m
                        break
                    end
                end
                if i+n ~= m
                    Ri_shad_line(i,j) = 1;
                    Ri_shad_line(i+n-1,j) = 1;
                elseif i+n == m
                    Ri_shad_line(i,j) = 1;
                    Ri_shad_line(i+n,j) = 1;
                end
            elseif Ri_shad(i,j) == 0
                Ri_shad_line(i,j) = 0;
            end
        elseif i == 1
            if Ri_shad(i,j) == 1
                n = 0;
                while 1
                    n = n+1;
                    if Ri_shad(i+n,j) == 0 || i+n == m
                        break
                    end
                end
                Ri_shad_line(i,j) = 1;
                Ri_shad_line(i+n-1,j) = 1;
            elseif Ri_shad(i,j) == 0
                Ri_shad_line(i,j) = 0;
            end
        end
    end
end

%% Vertical profiles from N2, S2, Ri
figure;set(gcf,'position',[201 42 1564 954]);
ax(1) = subplot(1,5,1);
yshading = mdepth_LADCP(Ri_shad_line(:,1) == 1,1);
for i = 1:2:length(yshading)-1
    f = [1 2 3 4];
    v = [10^-5 yshading(i);10^-5 yshading(i+1);10^1 yshading(i+1);10^1 yshading(i)];
    patch('Faces',f,'Vertices',v,'FaceColor',[.7 .7 .7],'FaceAlpha',.5,'LineStyle','none');hold on;
end
[lineh_1,ax_m_1] = plotmultix(Ri(:,1),mdepth_LADCP(:,1),'-k', ...
    S2_P(:,1),mdepth_LADCP(:,1),'-b', ...
    N2_P_for_Ri(:,1),mdepth_LADCP(:,1),'-r','ydir','reverse','LineWidth',2);
xline([0.25],'--','Color',[.7 .7 .7],'LineWidth',1.5);
set(ax_m_1(:,2),'ylim',[0 270]);
set(ax_m_1(1,:),'xscale','log','xlim',[10^-5 10^1],'xtick',[10^-5,10^-3,10^-1,10^1],'XMinorTick','off','YGrid','off','TickDir','in','Box','on','LineWidth',1.5); 
set(ax_m_1(2,:),'xlim',[0 0.004],'LineWidth',1.5,'FontWeight','b','FontName','Times New Roman','Fontsize',20); 
set(ax_m_1(3,:),'xlim',[0 0.004],'LineWidth',1.5,'FontWeight','b','FontName','Times New Roman','Fontsize',20); 
set(ax_m_1(:),'fontsize',20,'linewi',1.5);
set(ax(1).XAxis,'FontWeight','b','FontSize',20,'FontName','Times New Roman');
set(ax(1).YAxis,'FontWeight','b','FontSize',20,'FontName','Times New Roman');
xlabel(ax_m_1(1,1),'Ri','FontWeight','b','Fontsize',20,'Position',[0.01,293.8418,-1],'FontName','Times New Roman');
xlabel(ax_m_1(2,1),'S^2 (s^{-2})','FontWeight','b','Fontsize',20,'FontName','Times New Roman');
xlabel(ax_m_1(3,1),'N^2 (s^{-2})','FontWeight','b','Fontsize',20,'FontName','Times New Roman');
ylabel('Pressure (db)','FontWeight','b','Fontsize',35,'FontName','Times New Roman');
title('P1','FontWeight','b','Fontsize',45,'FontName','Times New Roman');

ax(2) = subplot(1,5,2);
yshading = mdepth_LADCP(Ri_shad_line(:,2) == 1,1);
for i = 1:2:length(yshading)-1
    f = [1 2 3 4];
    v = [10^-5 yshading(i);10^-5 yshading(i+1);10^1 yshading(i+1);10^1 yshading(i)];
    patch('Faces',f,'Vertices',v,'FaceColor',[.7 .7 .7],'FaceAlpha',.5,'LineStyle','none');hold on;
end
[lineh_2,ax_m_2] = plotmultix(Ri(:,2),mdepth_LADCP(:,2),'-k', ...
    S2_P(:,2),mdepth_LADCP(:,2),'-b', ...
    N2_P_for_Ri(:,2),mdepth_LADCP(:,2),'-r','ydir','reverse','LineWidth',2);
xline([0.25],'--','Color',[.7 .7 .7],'LineWidth',1.5);
set(ax_m_2(:,2),'ylim',[0 270]);
set(ax_m_2(1,:),'xscale','log','xlim',[10^-5 10^1],'xtick',[10^-5,10^-3,10^-1,10^1],'XMinorTick','off','YGrid','off','TickDir','in','Box','on','LineWidth',1.5); 
set(ax_m_2(2,:),'xlim',[0 0.004],'LineWidth',1.5,'FontWeight','b','FontName','Times New Roman','Fontsize',20); 
set(ax_m_2(3,:),'xlim',[0 0.004],'LineWidth',1.5,'FontWeight','b','FontName','Times New Roman','Fontsize',20); 
set(ax_m_2(:),'fontsize',20,'linewi',1.5);
set(ax(2).XAxis,'FontWeight','b','FontSize',20,'FontName','Times New Roman');
set(ax(2).YAxis,'FontWeight','b','FontSize',20,'FontName','Times New Roman');
xlabel(ax_m_2(1,1),'Ri','FontWeight','b','Fontsize',20,'Position',[0.01,293.8418,-1],'FontName','Times New Roman');
xlabel(ax_m_2(2,1),'S^2 (s^{-2})','FontWeight','b','Fontsize',20,'FontName','Times New Roman');
xlabel(ax_m_2(3,1),'N^2 (s^{-2})','FontWeight','b','Fontsize',20,'FontName','Times New Roman');
title('P2','FontWeight','b','Fontsize',45,'FontName','Times New Roman');

ax(3) = subplot(1,5,3);
yshading = mdepth_LADCP(Ri_shad_line(:,3) == 1,1);
for i = 1:2:length(yshading)-1
    f = [1 2 3 4];
    v = [10^-5 yshading(i);10^-5 yshading(i+1);10^1 yshading(i+1);10^1 yshading(i)];
    patch('Faces',f,'Vertices',v,'FaceColor',[.7 .7 .7],'FaceAlpha',.5,'LineStyle','none');hold on;
end
[lineh_3,ax_m_3] = plotmultix(Ri(:,3),mdepth_LADCP(:,3),'-k', ...
    S2_P(:,3),mdepth_LADCP(:,3),'-b', ...
    N2_P_for_Ri(:,3),mdepth_LADCP(:,3),'-r','ydir','reverse','LineWidth',2);
xline([0.25],'--','Color',[.7 .7 .7],'LineWidth',1.5);
set(ax_m_3(:,2),'ylim',[0 270]);
set(ax_m_3(1,:),'xscale','log','xlim',[10^-5 10^1],'xtick',[10^-5,10^-3,10^-1,10^1],'XMinorTick','off','YGrid','off','TickDir','in','Box','on','LineWidth',1.5); 
set(ax_m_3(2,:),'xlim',[0 0.004],'LineWidth',1.5,'FontWeight','b','FontName','Times New Roman','Fontsize',20); 
set(ax_m_3(3,:),'xlim',[0 0.004],'LineWidth',1.5,'FontWeight','b','FontName','Times New Roman','Fontsize',20); 
set(ax_m_3(:),'fontsize',20,'linewi',1.5);
set(ax(3).XAxis,'FontWeight','b','FontSize',20,'FontName','Times New Roman');
set(ax(3).YAxis,'FontWeight','b','FontSize',20,'FontName','Times New Roman');
xlabel(ax_m_3(1,1),'Ri','FontWeight','b','Fontsize',20,'Position',[0.01,293.8418,-1],'FontName','Times New Roman');
xlabel(ax_m_3(2,1),'S^2 (s^{-2})','FontWeight','b','Fontsize',20,'FontName','Times New Roman');
xlabel(ax_m_3(3,1),'N^2 (s^{-2})','FontWeight','b','Fontsize',20,'FontName','Times New Roman');
% ylabel('Pressure (db)','FontWeight','b','Fontsize',35,'FontName','Times New Roman');
title('P3','FontWeight','b','Fontsize',45,'FontName','Times New Roman');

ax(4) = subplot(1,5,4);
yshading = mdepth_LADCP(Ri_shad_line(:,4) == 1,1);
for i = 1:2:length(yshading)-1
    f = [1 2 3 4];
    v = [10^-5 yshading(i);10^-5 yshading(i+1);10^1 yshading(i+1);10^1 yshading(i)];
    patch('Faces',f,'Vertices',v,'FaceColor',[.7 .7 .7],'FaceAlpha',.5,'LineStyle','none');hold on;
end
[lineh_4,ax_m_4] = plotmultix(Ri(:,4),mdepth_LADCP(:,4),'-k', ...
    S2_P(:,4),mdepth_LADCP(:,4),'-b', ...
    N2_P_for_Ri(:,4),mdepth_LADCP(:,4),'-r','ydir','reverse','LineWidth',2);
xline([0.25],'--','Color',[.7 .7 .7],'LineWidth',1.5);
set(ax_m_4(:,2),'ylim',[0 270]);
set(ax_m_4(1,:),'xscale','log','xlim',[10^-5 10^1],'xtick',[10^-5,10^-3,10^-1,10^1],'XMinorTick','off','YGrid','off','TickDir','in','Box','on','LineWidth',1.5); 
set(ax_m_4(2,:),'xlim',[0 0.004],'LineWidth',1.5,'FontWeight','b','FontName','Times New Roman','Fontsize',20); 
set(ax_m_4(3,:),'xlim',[0 0.004],'LineWidth',1.5,'FontWeight','b','FontName','Times New Roman','Fontsize',20); 
set(ax_m_4(:),'fontsize',20,'linewi',1.5);
set(ax(4).XAxis,'FontWeight','b','FontSize',20,'FontName','Times New Roman');
set(ax(4).YAxis,'FontWeight','b','FontSize',20,'FontName','Times New Roman');
xlabel(ax_m_4(1,1),'Ri','FontWeight','b','Fontsize',20,'Position',[0.01,293.8418,-1],'FontName','Times New Roman');
xlabel(ax_m_4(2,1),'S^2 (s^{-2})','FontWeight','b','Fontsize',20,'FontName','Times New Roman');
xlabel(ax_m_4(3,1),'N^2 (s^{-2})','FontWeight','b','Fontsize',20,'FontName','Times New Roman');
% ylabel('Pressure (db)','FontWeight','b','Fontsize',35,'FontName','Times New Roman');
title('P4','FontWeight','b','Fontsize',45,'FontName','Times New Roman');

ax(5) = subplot(1,5,5);
yshading = mdepth_LADCP(Ri_shad_line(:,5) == 1,1);
for i = 1:2:length(yshading)-1
    f = [1 2 3 4];
    v = [10^-5 yshading(i);10^-5 yshading(i+1);10^1 yshading(i+1);10^1 yshading(i)];
    patch('Faces',f,'Vertices',v,'FaceColor',[.7 .7 .7],'FaceAlpha',.5,'LineStyle','none');hold on;
end
[lineh_5,ax_m_5] = plotmultix(Ri(:,5),mdepth_LADCP(:,5),'-k', ...
    S2_P(:,5),mdepth_LADCP(:,5),'-b', ...
    N2_P_for_Ri(:,5),mdepth_LADCP(:,5),'-r','ydir','reverse','LineWidth',2);
xline([0.25],'--','Color',[.7 .7 .7],'LineWidth',1.5);
set(ax_m_5(:,2),'ylim',[0 270]);
set(ax_m_5(1,:),'xscale','log','xlim',[10^-5 10^1],'xtick',[10^-5,10^-3,10^-1,10^1],'XMinorTick','off','YGrid','off','TickDir','in','Box','on','LineWidth',1.5); 
set(ax_m_5(2,:),'xlim',[0 0.004],'LineWidth',1.5,'FontWeight','b','FontName','Times New Roman','Fontsize',20); 
set(ax_m_5(3,:),'xlim',[0 0.004],'LineWidth',1.5,'FontWeight','b','FontName','Times New Roman','Fontsize',20); 
set(ax_m_5(:),'fontsize',20,'linewi',1.5);
set(ax(5).XAxis,'FontWeight','b','FontSize',20,'FontName','Times New Roman');
set(ax(5).YAxis,'FontWeight','b','FontSize',20,'FontName','Times New Roman');
xlabel(ax_m_5(1,1),'Ri','FontWeight','b','Fontsize',20,'Position',[0.01,293.8418,-1],'FontName','Times New Roman');
xlabel(ax_m_5(2,1),'S^2 (s^{-2})','FontWeight','b','Fontsize',20,'FontName','Times New Roman');
xlabel(ax_m_5(3,1),'N^2 (s^{-2})','FontWeight','b','Fontsize',20,'FontName','Times New Roman');
% ylabel('Pressure (db)','FontWeight','b','Fontsize',35,'FontName','Times New Roman');
title('P5','FontWeight','b','Fontsize',45,'FontName','Times New Roman');
hold off;


            

            
            
            
            
            
            
            
            
            
            
            
            
            
