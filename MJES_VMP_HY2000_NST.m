clc;clear all;close all;

%% Buoyancy Frequency
[SA_NST1, in_ocean_NST1] = gsw_SA_from_SP(sal_cllcted,prs_cllcted,lon_cllcted,lat_cllcted);
CT_NST1 = gsw_CT_from_pt(SA_NST1,TEMP_cllcted);
[N2_NST1, p_mid_NST1] = gsw_Nsquared(SA_NST1,CT_NST1,prs_cllcted,lat_cllcted);

[SA_NST2, in_ocean_NST2] = gsw_SA_from_SP(sal_cllcted,prs_cllcted,lon_cllcted,lat_cllcted);
CT_NST2 = gsw_CT_from_pt(SA_NST2,TEMP_cllcted);
[N2_NST2, p_mid_NST2] = gsw_Nsquared(SA_NST2,CT_NST2,prs_cllcted,lat_cllcted);

[SA_NST3, in_ocean_NST3] = gsw_SA_from_SP(sal_cllcted,prs_cllcted,lon_cllcted,lat_cllcted);
CT_NST3 = gsw_CT_from_pt(SA_NST3,TEMP_cllcted);
[N2_NST3, p_mid_NST3] = gsw_Nsquared(SA_NST3,CT_NST3,prs_cllcted,lat_cllcted);

[SA_NST4, in_ocean_NST4] = gsw_SA_from_SP(sal_cllcted,prs_cllcted,lon_cllcted,lat_cllcted);
CT_NST4 = gsw_CT_from_pt(SA_NST4,TEMP_cllcted);
[N2_NST4, p_mid_NST4] = gsw_Nsquared(SA_NST4,CT_NST4,prs_cllcted,lat_cllcted);

%% N2 Plot
% NST1 
figure;set(gcf,'position',[403 42 1149 954]);
ax(1) = subplot(2,2,1);
pcolor(mlon_nst1,p_mid_NST1,N2_NST1);shading interp;hold on;
CT = cbrewer('seq','Reds',50,'linear');
colormap(CT);
set(gca,'YDir','reverse');
caxis([0 0.0006]);
[c1 h1] = contour(mlon_nst1,mprs_nst1,dnsty_cllcted(mprs_nst1(1,1):end,:),[24.5:0.5:27.5 ],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lon_mcllcted,'-r',{'NST1-2','NST1-3','NST1-4','NST1-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',15);
xlim([min(lon_mcllcted) max(lon_mcllcted)]);
ylim([0 400]);
xtickformat('%.2f');
h = colorbar;h.FontWeight = 'b';h.FontSize = 17;h.FontName = 'Times New Roman';h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontname','Times New Roman','fontweight','b','fontsize',17);
title('NST1','fontname','Times New Roman','fontweight','b','fontsize',35);
set(ax(1).XAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
set(ax(1).YAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
xlabel('Longitude (^oE)','fontname','Times New Roman','fontsize',30,'fontweight','b');
ylabel('Pressure (db)','fontname','Times New Roman','fontsize',30,'fontweight','b');
area(lon_for_bathy,-BATHY,max(mprs_nst1(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

% NST2
ax(2) = subplot(2,2,2);
pcolor(mlon_nst2,p_mid_NST2,N2_NST2);shading interp;hold on;
CT = cbrewer('seq','Reds',50,'linear');
colormap(CT);
set(gca,'YDir','reverse');
caxis([0 0.0006]);
[c1 h1] = contour(mlon_nst2,mprs_nst2,dnsty_cllcted(mprs_nst2(1,1):end,:),[24.5:0.5:27.5 ],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lon_mcllcted,'-r',{'NST2-2','NST2-3','NST2-4','NST2-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',15);
xlim([min(lon_mcllcted) max(lon_mcllcted)]);
ylim([0 400]);
xtickformat('%.2f');
h = colorbar;h.FontWeight = 'b';h.FontSize = 17;h.FontName = 'Times New Roman';h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontname','Times New Roman','fontweight','b','fontsize',17);
title('NST2','fontname','Times New Roman','fontweight','b','fontsize',35);
set(ax(2).XAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
set(ax(2).YAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
xlabel('Longitude (^oE)','fontname','Times New Roman','fontsize',30,'fontweight','b');
% ylabel('Pressure (db)','fontname','Times New Roman','fontsize',30,'fontweight','b');
area(lon_for_bathy,-BATHY,max(mprs_nst2(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

% NST3
ax(3) = subplot(2,2,3);
pcolor(mlon_nst3,p_mid_NST3,N2_NST3);shading interp;hold on;
CT = cbrewer('seq','Reds',50,'linear');
colormap(CT);
set(gca,'YDir','reverse');
caxis([0 0.0006]);
[c1 h1] = contour(mlon_nst3,mprs_nst3,dnsty_cllcted(mprs_nst3(1,1):end,:),[24.5:0.5:27.5 ],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lon_mcllcted,'-r',{'NST3-2','NST3-3','NST3-4','NST3-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',15);
xlim([min(lon_mcllcted) max(lon_mcllcted)]);
ylim([0 400]);
xtickformat('%.2f');
h = colorbar;h.FontWeight = 'b';h.FontSize = 17;h.FontName = 'Times New Roman';h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontname','Times New Roman','fontweight','b','fontsize',17);
title('NST3','fontname','Times New Roman','fontweight','b','fontsize',35);
set(ax(3).XAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
set(ax(3).YAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
xlabel('Longitude (^oE)','fontname','Times New Roman','fontsize',30,'fontweight','b');
ylabel('Pressure (db)','fontname','Times New Roman','fontsize',30,'fontweight','b');
area(lon_for_bathy,-BATHY,max(mprs_nst3(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

% NST4
ax(4) = subplot(2,2,4);
pcolor(mlon_nst4,p_mid_NST4(2:end,:),N2_NST4(2:end,:));shading interp;hold on;
CT = cbrewer('seq','Reds',50,'linear');
colormap(CT);
set(gca,'YDir','reverse');
caxis([0 0.0006]);
[c1 h1] = contour(mlon_nst4,mprs_nst4,dnsty_cllcted(mprs_nst4(1,1):end,:),[24.5:0.5:27.5 ],'-k','LabelSpacing',1000,'LineWidth',1.5);
clabel(c1,h1,'color','k','FontSize',10,'FontWeight','b');
xline(lon_mcllcted,'-r',{'NST4-2','NST4-3','NST4-4','NST4-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',15);
xlim([min(lon_mcllcted) max(lon_mcllcted)]);
ylim([0 400]);
xtickformat('%.2f');
h = colorbar;h.FontWeight = 'b';h.FontSize = 17;h.FontName = 'Times New Roman';h.Ruler.TickLabelFormat = '%.1f';
title(h,'s^{-2}','fontname','Times New Roman','fontweight','b','fontsize',17);
title('NST4','fontname','Times New Roman','fontweight','b','fontsize',35);
set(ax(4).XAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
set(ax(4).YAxis,'fontname','Times New Roman','FontWeight','b','fontsize',17);
xlabel('Longitude (^oE)','fontname','Times New Roman','fontsize',30,'fontweight','b');
% ylabel('Pressure (db)','fontname','Times New Roman','fontsize',30,'fontweight','b');
area(lon_for_bathy,-BATHY,max(mprs_nst4(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

%% Richardson number
clc;clear all;close all;
% Denominator
cd('C:\Users\USER\OneDrive\Desktop\data\MJES\38_MJES_202111_Haeyang_ES\VMP\nst')
VMP_NST1_3 = load('SNU_031.mat'); % NST1
dxdz_NST1_3 = VMP_NST1_3.sh1(28508:101017);
dydz_NST1_3 = VMP_NST1_3.sh2(28508:101017);
S2_NST1_3 = dxdz_NST1_3.^2 + dydz_NST1_3.^2;

VMP_NST1_4 = load('SNU_030.mat');
dxdz_NST1_4 = VMP_NST1_4.sh1(55948:133820);
dydz_NST1_4 = VMP_NST1_4.sh2(55948:133820);
S2_NST1_4 = dxdz_NST1_4.^2 + dydz_NST1_4.^2;

VMP_NST1_5 = load('SNU_029.mat');
dxdz_NST1_5 = VMP_NST1_5.sh1(28518:97351);
dydz_NST1_5 = VMP_NST1_5.sh2(28518:97351);
S2_NST1_5 = dxdz_NST1_5.^2 + dydz_NST1_5.^2;

VMP_NST2_4 = load('SNU_032.mat'); % NST2
dxdz_NST2_4 = VMP_NST2_4.sh1(40909:116690);
dydz_NST2_4 = VMP_NST2_4.sh2(40909:116690);
S2_NST2_4 = dxdz_NST2_4.^2 + dydz_NST2_4.^2;

VMP_NST2_5= load('SNU_033.mat');
dxdz_NST2_5 = VMP_NST2_5.sh1(70364:143653);
dydz_NST2_5 = VMP_NST2_5.sh2(70364:143653);
S2_NST2_5 = dxdz_NST2_5.^2 + dydz_NST2_5.^2;

VMP_NST3_2 = load('SNU_038.mat'); % NST3
dxdz_NST3_2 = VMP_NST3_2.sh1(20974:64670); % 69.3 db
dydz_NST3_2 = VMP_NST3_2.sh2(20974:64670);
S2_NST3_2 = dxdz_NST3_2.^2 + dydz_NST3_2.^2;

VMP_NST3_3 = load('SNU_037.mat');
dxdz_NST3_3 = VMP_NST3_3.sh1(38297:85997); % 82.9
dydz_NST3_3 = VMP_NST3_3.sh2(38297:85997);
S2_NST3_3 = dxdz_NST3_3.^2 + dydz_NST3_3.^2;

VMP_NST3_4 = load('SNU_036.mat');
dxdz_NST3_4 = VMP_NST3_4.sh1(43932:116805); % 127.36 db
dydz_NST3_4 = VMP_NST3_4.sh2(43932:116805);
S2_NST3_4 = dxdz_NST3_4.^2 + dydz_NST3_4.^2;

VMP_NST3_5= load('SNU_034.mat');
dxdz_NST3_5 = VMP_NST3_5.sh1(42847:120481); % 127.05
dydz_NST3_5 = VMP_NST3_5.sh2(42847:120481);
S2_NST3_5 = dxdz_NST3_5.^2 + dydz_NST3_5.^2;

VMP_NST4_2 = load('SNU_039.mat'); % NST4
dxdz_NST4_2 = VMP_NST4_2.sh1(19308:55893); % 70.8
dydz_NST4_2 = VMP_NST4_2.sh2(19308:55893);
S2_NST4_2 = dxdz_NST4_2.^2 + dydz_NST4_2.^2;

VMP_NST4_3 = load('SNU_040.mat');
dxdz_NST4_3 = VMP_NST4_3.sh1(31148:77661); % 87
dydz_NST4_3 = VMP_NST4_3.sh2(31148:77661);
S2_NST4_3 = dxdz_NST4_3.^2 + dydz_NST4_3.^2;

VMP_NST4_4 = load('SNU_041.mat');
dxdz_NST4_4 = VMP_NST4_4.sh1(149875:226943); % 134.46
dydz_NST4_4 = VMP_NST4_4.sh2(149875:226943);
S2_NST4_4 = dxdz_NST4_4.^2 + dydz_NST4_4.^2;

VMP_NST4_5 = load('SNU_042.mat');
dxdz_NST4_5 = VMP_NST4_5.sh1(18037:117359); % 160
dydz_NST4_5 = VMP_NST4_5.sh2(18037:117359);
S2_NST4_5 = dxdz_NST4_5.^2 + dydz_NST4_5.^2;

% Numerator
newgrid_for_N2_NST1_3 = linspace(3,121,72510)';
N2_NST1_3 = interp1(mprs_nst1(1:119,2),N2_NST1(3:121,2),newgrid_for_N2_NST1_3);

newgrid_for_N2_NST1_4 = linspace(4,115,77873)';
N2_NST1_4 = interp1(mprs_nst1(2:113,3),N2_NST1(4:115,3),newgrid_for_N2_NST1_4);

newgrid_for_N2_NST1_5 = linspace(3,102,68834)';
N2_NST1_5 = interp1(mprs_nst1(1:100,4),N2_NST1(3:102,4),newgrid_for_N2_NST1_5);

newgrid_for_N2_NST2_4 = linspace(4,123,75782)';
N2_NST2_4 = interp1(mprs_nst2(2:113,3),N2_NST2(4:115,3),newgrid_for_N2_NST2_4);

newgrid_for_N2_NST2_5 = linspace(4,122,73290)';
N2_NST2_5 = interp1(mprs_nst2(1:100,4),N2_NST2(3:102,4),newgrid_for_N2_NST2_5);

newgrid_for_N2_NST3_2 = linspace(2,69,43697)';
N2_NST3_2 = interp1(mprs_nst3(1:68,1),N2_NST3(2:69,1),newgrid_for_N2_NST3_2);

newgrid_for_N2_NST3_3 = linspace(3,83,47701)';
N2_NST3_3 = interp1(mprs_nst3(1:81,2),N2_NST3(3:83,2),newgrid_for_N2_NST3_3);

newgrid_for_N2_NST3_4 = linspace(4,127,72874)';
N2_NST3_4 = interp1(mprs_nst3(2:125,3),N2_NST3(4:127,3),newgrid_for_N2_NST3_4);

newgrid_for_N2_NST3_5 = linspace(3,127,77635)';
N2_NST3_5 = interp1(mprs_nst3(1:125,4),N2_NST3(3:127,4),newgrid_for_N2_NST3_5);

newgrid_for_N2_NST4_2 = linspace(3,71,36586)';
N2_NST4_2 = interp1(mprs_nst4(1:69,1),N2_NST4(3:71,1),newgrid_for_N2_NST4_2);

newgrid_for_N2_NST4_3 = linspace(3,87,46514)';
N2_NST4_3 = interp1(mprs_nst4(1:85,2),N2_NST4(3:87,2),newgrid_for_N2_NST4_3);

newgrid_for_N2_NST4_4 = linspace(4,134,77069)';
N2_NST4_4 = interp1(mprs_nst4(2:132,3),N2_NST4(4:134,3),newgrid_for_N2_NST4_4);

newgrid_for_N2_NST4_5 = linspace(3,160,99323)';
N2_NST4_5 = interp1(mprs_nst4(1:158,4),N2_NST4(3:160,4),newgrid_for_N2_NST4_5);

% Ri
Ri_NST1_3 = N2_NST1_3./S2_NST1_3;
Ri_NST1_4 = N2_NST1_4./S2_NST1_4;
Ri_NST1_5 = N2_NST1_5./S2_NST1_5;

Ri_NST2_4 = N2_NST2_4./S2_NST2_4;
Ri_NST2_5 = N2_NST2_5./S2_NST2_5;

Ri_NST3_2 = N2_NST3_2./S2_NST3_2;
Ri_NST3_3 = N2_NST3_3./S2_NST3_3;
Ri_NST3_4 = N2_NST3_4./S2_NST3_4;
Ri_NST3_5 = N2_NST3_5./S2_NST3_5;

Ri_NST4_2 = N2_NST4_2./S2_NST4_2;
Ri_NST4_3 = N2_NST4_3./S2_NST4_3;
Ri_NST4_4 = N2_NST4_4./S2_NST4_4;
Ri_NST4_5 = N2_NST4_5./S2_NST4_5;

% RI interp (for lots of values)
newgrid_for_Ri_NST1_3 = newgrid_for_N2_NST1_3(1):newgrid_for_N2_NST1_3(end);
Ri_NST1_3_interp = interp1(newgrid_for_N2_NST1_3,Ri_NST1_3,newgrid_for_Ri_NST1_3)';
idx_Ri_NST1_3 = find(Ri_NST1_3_interp < 0.25 & Ri_NST1_3_interp > 0);

newgrid_for_Ri_NST1_4 = newgrid_for_N2_NST1_4(1):newgrid_for_N2_NST1_4(end);
Ri_NST1_4_interp = interp1(newgrid_for_N2_NST1_4,Ri_NST1_4,newgrid_for_Ri_NST1_4)';
idx_Ri_NST1_4 = find(Ri_NST1_4_interp < 0.25 & Ri_NST1_4_interp > 0);

newgrid_for_Ri_NST1_5 = newgrid_for_N2_NST1_5(1):newgrid_for_N2_NST1_5(end);
Ri_NST1_5_interp = interp1(newgrid_for_N2_NST1_5,Ri_NST1_5,newgrid_for_Ri_NST1_5)';
idx_Ri_NST1_5 = find(Ri_NST1_5_interp < 0.25 & Ri_NST1_5_interp > 0);

newgrid_for_Ri_NST2_4 = newgrid_for_N2_NST2_4(1):newgrid_for_N2_NST2_4(end);
Ri_NST2_4_interp = interp1(newgrid_for_N2_NST2_4,Ri_NST2_4,newgrid_for_Ri_NST2_4)';
idx_Ri_NST2_4 = find(Ri_NST2_4_interp < 0.25 & Ri_NST2_4_interp > 0);

newgrid_for_Ri_NST2_5 = newgrid_for_N2_NST2_5(1):newgrid_for_N2_NST2_5(end);
Ri_NST2_5_interp = interp1(newgrid_for_N2_NST2_5,Ri_NST2_5,newgrid_for_Ri_NST2_5)';
idx_Ri_NST2_5 = find(Ri_NST2_5_interp < 0.25 & Ri_NST2_5_interp > 0);

newgrid_for_Ri_NST3_2 = newgrid_for_N2_NST3_2(1):newgrid_for_N2_NST3_2(end);
Ri_NST3_2_interp = interp1(newgrid_for_N2_NST3_2,Ri_NST3_2,newgrid_for_Ri_NST3_2)';
idx_Ri_NST3_2 = find(Ri_NST3_2_interp < 0.25 & Ri_NST3_2_interp > 0);

newgrid_for_Ri_NST3_3 = newgrid_for_N2_NST3_3(1):newgrid_for_N2_NST3_3(end);
Ri_NST3_3_interp = interp1(newgrid_for_N2_NST3_3,Ri_NST3_3,newgrid_for_Ri_NST3_3)';
idx_Ri_NST3_3 = find(Ri_NST3_3_interp < 0.25 & Ri_NST3_3_interp > 0);

newgrid_for_Ri_NST3_4 = newgrid_for_N2_NST3_4(1):newgrid_for_N2_NST3_4(end);
Ri_NST3_4_interp = interp1(newgrid_for_N2_NST3_4,Ri_NST3_4,newgrid_for_Ri_NST3_4)';
idx_Ri_NST3_4 = find(Ri_NST3_4_interp < 0.25 & Ri_NST3_4_interp > 0);

newgrid_for_Ri_NST3_5 = newgrid_for_N2_NST3_5(1):newgrid_for_N2_NST3_5(end);
Ri_NST3_5_interp = interp1(newgrid_for_N2_NST3_5,Ri_NST3_5,newgrid_for_Ri_NST3_5)';
idx_Ri_NST3_5 = find(Ri_NST3_5_interp < 0.25 & Ri_NST3_5_interp > 0);

newgrid_for_Ri_NST4_2 = newgrid_for_N2_NST4_2(1):newgrid_for_N2_NST4_2(end);
Ri_NST4_2_interp = interp1(newgrid_for_N2_NST4_2,Ri_NST4_2,newgrid_for_Ri_NST4_2)';
idx_Ri_NST4_2 = find(Ri_NST4_2_interp < 0.25 & Ri_NST4_2_interp > 0);

newgrid_for_Ri_NST4_3 = newgrid_for_N2_NST4_3(1):newgrid_for_N2_NST4_3(end);
Ri_NST4_3_interp = interp1(newgrid_for_N2_NST4_3,Ri_NST4_3,newgrid_for_Ri_NST4_3)';
idx_Ri_NST4_3 = find(Ri_NST4_3_interp < 0.25 & Ri_NST4_3_interp > 0);

newgrid_for_Ri_NST4_4 = newgrid_for_N2_NST4_4(1):newgrid_for_N2_NST4_4(end);
Ri_NST4_4_interp = interp1(newgrid_for_N2_NST4_4,Ri_NST4_4,newgrid_for_Ri_NST4_4)';
idx_Ri_NST4_4 = find(Ri_NST4_4_interp < 0.25 & Ri_NST4_4_interp > 0);

newgrid_for_Ri_NST4_5 = newgrid_for_N2_NST4_5(1):newgrid_for_N2_NST4_5(end);
Ri_NST4_5_interp = interp1(newgrid_for_N2_NST4_5,Ri_NST4_5,newgrid_for_Ri_NST4_5)';
idx_Ri_NST4_5 = find(Ri_NST4_5_interp < 0.25 & Ri_NST4_5_interp > 0);

% Fill nan at each negative value
Ri_NST1_3_interp(Ri_NST1_3_interp < 0) = nan;
Ri_NST1_4_interp(Ri_NST1_4_interp < 0) = nan;
Ri_NST1_5_interp(Ri_NST1_5_interp < 0) = nan;

Ri_NST2_4_interp(Ri_NST2_4_interp < 0) = nan;
Ri_NST2_5_interp(Ri_NST2_5_interp < 0) = nan;

Ri_NST3_2_interp(Ri_NST3_2_interp < 0) = nan;
Ri_NST3_3_interp(Ri_NST3_3_interp < 0) = nan;
Ri_NST3_4_interp(Ri_NST3_4_interp < 0) = nan;
Ri_NST3_5_interp(Ri_NST3_5_interp < 0) = nan;

Ri_NST4_2_interp(Ri_NST4_2_interp < 0) = nan;
Ri_NST4_3_interp(Ri_NST4_3_interp < 0) = nan;
Ri_NST4_4_interp(Ri_NST4_4_interp < 0) = nan;
Ri_NST4_5_interp(Ri_NST4_5_interp < 0) = nan;

% 5m average
for i = 1:5:length(Ri_NST1_3_interp)
    if i+4 <= length(Ri_NST1_3_interp)
        Ri_NST1_3_interp(i:i+4,1) = mean(Ri_NST1_3_interp(i:i+4,1),'omitnan');
    elseif i+4 > length(Ri_NST1_3_interp)
        Ri_NST1_3_interp(i:end,1) = mean(Ri_NST1_3_interp(i:end,1),'omitnan');
    end
end
for i = 1:5:length(Ri_NST1_4_interp)
    if i+4 <= length(Ri_NST1_4_interp)
        Ri_NST1_4_interp(i:i+4,1) = mean(Ri_NST1_4_interp(i:i+4,1),'omitnan');
    elseif i+4 > length(Ri_NST1_4_interp)
        Ri_NST1_4_interp(i:end,1) = mean(Ri_NST1_4_interp(i:end,1),'omitnan');
    end
end
for i = 1:5:length(Ri_NST1_5_interp)
    if i+4 <= length(Ri_NST1_5_interp)
        Ri_NST1_5_interp(i:i+4,1) = mean(Ri_NST1_5_interp(i:i+4,1),'omitnan');
    elseif i+4 > length(Ri_NST1_5_interp)
        Ri_NST1_5_interp(i:end,1) = mean(Ri_NST1_5_interp(i:end,1),'omitnan');
    end
end

for i = 1:5:length(Ri_NST2_4_interp)
    if i+4 <= length(Ri_NST2_4_interp)
        Ri_NST2_4_interp(i:i+4,1) = mean(Ri_NST2_4_interp(i:i+4,1),'omitnan');
    elseif i+4 > length(Ri_NST2_4_interp)
        Ri_NST2_4_interp(i:end,1) = mean(Ri_NST2_4_interp(i:end,1),'omitnan');
    end
end
for i = 1:5:length(Ri_NST2_5_interp)
    if i+4 <= length(Ri_NST2_5_interp)
        Ri_NST2_5_interp(i:i+4,1) = mean(Ri_NST2_5_interp(i:i+4,1),'omitnan');
    elseif i+4 > length(Ri_NST2_5_interp)
        Ri_NST2_5_interp(i:end,1) = mean(Ri_NST2_5_interp(i:end,1),'omitnan');
    end
end

for i = 1:5:length(Ri_NST3_2_interp)
    if i+4 <= length(Ri_NST3_2_interp)
        Ri_NST3_2_interp(i:i+4,1) = mean(Ri_NST3_2_interp(i:i+4,1),'omitnan');
    elseif i+4 > length(Ri_NST3_2_interp)
        Ri_NST3_2_interp(i:end,1) = mean(Ri_NST3_2_interp(i:end,1),'omitnan');
    end
end
for i = 1:5:length(Ri_NST3_3_interp)
    if i+4 <= length(Ri_NST3_3_interp)
        Ri_NST3_3_interp(i:i+4,1) = mean(Ri_NST3_3_interp(i:i+4,1),'omitnan');
    elseif i+4 > length(Ri_NST3_3_interp)
        Ri_NST3_3_interp(i:end,1) = mean(Ri_NST3_3_interp(i:end,1),'omitnan');
    end
end
for i = 1:5:length(Ri_NST3_4_interp)
    if i+4 <= length(Ri_NST3_4_interp)
        Ri_NST3_4_interp(i:i+4,1) = mean(Ri_NST3_4_interp(i:i+4,1),'omitnan');
    elseif i+4 > length(Ri_NST3_4_interp)
        Ri_NST3_4_interp(i:end,1) = mean(Ri_NST3_4_interp(i:end,1),'omitnan');
    end
end
for i = 1:5:length(Ri_NST3_5_interp)
    if i+4 <= length(Ri_NST3_5_interp)
        Ri_NST3_5_interp(i:i+4,1) = mean(Ri_NST3_5_interp(i:i+4,1),'omitnan');
    elseif i+4 > length(Ri_NST3_5_interp)
        Ri_NST3_5_interp(i:end,1) = mean(Ri_NST3_5_interp(i:end,1),'omitnan');
    end
end

for i = 1:5:length(Ri_NST4_2_interp)
    if i+4 <= length(Ri_NST4_2_interp)
        Ri_NST4_2_interp(i:i+4,1) = mean(Ri_NST4_2_interp(i:i+4,1),'omitnan');
    elseif i+4 > length(Ri_NST4_2_interp)
        Ri_NST4_2_interp(i:end,1) = mean(Ri_NST4_2_interp(i:end,1),'omitnan');
    end
end
for i = 1:5:length(Ri_NST4_3_interp)
    if i+4 <= length(Ri_NST4_3_interp)
        Ri_NST4_3_interp(i:i+4,1) = mean(Ri_NST4_3_interp(i:i+4,1),'omitnan');
    elseif i+4 > length(Ri_NST4_3_interp)
        Ri_NST4_3_interp(i:end,1) = mean(Ri_NST4_3_interp(i:end,1),'omitnan');
    end
end
for i = 1:5:length(Ri_NST4_4_interp)
    if i+4 <= length(Ri_NST4_4_interp)
        Ri_NST4_4_interp(i:i+4,1) = mean(Ri_NST4_4_interp(i:i+4,1),'omitnan');
    elseif i+4 > length(Ri_NST4_4_interp)
        Ri_NST4_4_interp(i:end,1) = mean(Ri_NST4_4_interp(i:end,1),'omitnan');
    end
end
for i = 1:5:length(Ri_NST4_5_interp)
    if i+4 <= length(Ri_NST4_5_interp)
        Ri_NST4_5_interp(i:i+4,1) = mean(Ri_NST4_5_interp(i:i+4,1),'omitnan');
    elseif i+4 > length(Ri_NST4_5_interp)
        Ri_NST4_5_interp(i:end,1) = mean(Ri_NST4_5_interp(i:end,1),'omitnan');
    end
end

% Create Ri shading line
for i = 1:length(Ri_NST1_3_interp)
    if Ri_NST1_3_interp(i) <= 0.25
        n = 0;
        while 1
            n = n+1;
            if Ri_NST1_3_interp(i+n) > 0.25 | i+n == length(Ri_NST1_3_interp)
                break
            end
        end
        if i == i+n
            Ri_NST1_3_shad(i,1) = 1;
        elseif i ~= i+n
            Ri_NST1_3_shad(i:i+n,1) = 1;
        end
    else
        Ri_NST1_3_shad(i,1) = 0;
    end
end

for i = 1:length(Ri_NST1_4_interp)
    if Ri_NST1_4_interp(i) <= 0.25
        n = 0;
        while 1
            n = n+1;
            if Ri_NST1_4_interp(i+n) > 0.25 | i+n == length(Ri_NST1_4_interp)
                break
            end
        end
        if i == i+n
            Ri_NST1_4_shad(i,1) = 1;
        elseif i ~= i+n
            Ri_NST1_4_shad(i:i+n,1) = 1;
        end
    else
        Ri_NST1_4_shad(i,1) = 0;
    end
end

for i = 1:length(Ri_NST1_5_interp)
    if Ri_NST1_5_interp(i) <= 0.25
        n = 0;
        while 1
            n = n+1;
            if Ri_NST1_5_interp(i+n) > 0.25 | i+n == length(Ri_NST1_5_interp)
                break
            end
        end
        if i == i+n
            Ri_NST1_5_shad(i,1) = 1;
        elseif i ~= i+n
            Ri_NST1_5_shad(i:i+n,1) = 1;
        end
    else
        Ri_NST1_5_shad(i,1) = 0;
    end
end

for i = 1:length(Ri_NST2_4_interp)
    if Ri_NST2_4_interp(i) <= 0.25
        n = 0;
        while 1
            n = n+1;
            if Ri_NST2_4_interp(i+n) > 0.25 | i+n == length(Ri_NST2_4_interp)
                break
            end
        end
        if i == i+n
            Ri_NST2_4_shad(i,1) = 1;
        elseif i ~= i+n
            Ri_NST2_4_shad(i:i+n,1) = 1;
        end
    else
        Ri_NST2_4_shad(i,1) = 0;
    end
end

for i = 1:length(Ri_NST2_5_interp)
    if Ri_NST2_5_interp(i) <= 0.25
        n = 0;
        while 1
            n = n+1;
            if Ri_NST2_5_interp(i+n) > 0.25 | i+n == length(Ri_NST2_5_interp)
                break
            end
        end
        if i == i+n
            Ri_NST2_5_shad(i,1) = 1;
        elseif i ~= i+n
            Ri_NST2_5_shad(i:i+n,1) = 1;
        end
    else
        Ri_NST2_5_shad(i,1) = 0;
    end
end

for i = 1:length(Ri_NST3_2_interp) %%%%%%%%%%%%%%%%%%
    if Ri_NST3_2_interp(i) <= 0.25
        n = 0;
        while 1
            n = n+1;
            if Ri_NST3_2_interp(i+n) > 0.25 | i+n == length(Ri_NST3_2_interp)
                break
            end
        end
        if i == i+n
            Ri_NST3_2_shad(i,1) = 1;
        elseif i ~= i+n
            Ri_NST3_2_shad(i:i+n,1) = 1;
        end
    else
        Ri_NST3_2_shad(i,1) = 0;
    end
end

for i = 1:length(Ri_NST3_3_interp)
    if Ri_NST3_3_interp(i) <= 0.25
        n = 0;
        while 1
            n = n+1;
            if Ri_NST3_3_interp(i+n) > 0.25 | i+n == length(Ri_NST3_3_interp)
                break
            end
        end
        if i == i+n
            Ri_NST3_3_shad(i,1) = 1;
        elseif i ~= i+n
            Ri_NST3_3_shad(i:i+n,1) = 1;
        end
    else
        Ri_NST3_3_shad(i,1) = 0;
    end
end

for i = 1:length(Ri_NST3_4_interp) %%%%%%%%%%%%%
    if Ri_NST3_4_interp(i) <= 0.25
        n = 0;
        while 1
            n = n+1;
            if Ri_NST3_4_interp(i+n) > 0.25 | i+n == length(Ri_NST3_4_interp)
                break
            end
        end
        if i == i+n
            Ri_NST3_4_shad(i,1) = 1;
        elseif i ~= i+n
            Ri_NST3_4_shad(i:i+n,1) = 1;
        end
    else
        Ri_NST3_4_shad(i,1) = 0;
    end
end

for i = 1:length(Ri_NST3_5_interp) %%%%%%%%%%%%%%%%%
    if Ri_NST3_5_interp(i) <= 0.25
        n = 0;
        while 1
            n = n+1;
            if Ri_NST3_5_interp(i+n) > 0.25 | i+n == length(Ri_NST3_5_interp)
                break
            end
        end
        if i == i+n
            Ri_NST3_5_shad(i,1) = 1;
        elseif i ~= i+n
            Ri_NST3_5_shad(i:i+n,1) = 1;
        end
    else
        Ri_NST3_5_shad(i,1) = 0;
    end
end

for i = 1:length(Ri_NST4_2_interp)
    if Ri_NST4_2_interp(i) <= 0.25
        n = 0;
        while 1
            n = n+1;
            if Ri_NST4_2_interp(i+n) > 0.25 | i+n == length(Ri_NST4_2_interp)
                break
            end
        end
        if i == i+n
            Ri_NST4_2_shad(i,1) = 1;
        elseif i ~= i+n
            Ri_NST4_2_shad(i:i+n,1) = 1;
        end
    else
        Ri_NST4_2_shad(i,1) = 0;
    end
end

for i = 1:length(Ri_NST4_3_interp) %%%%%%%%%%%%%%%%%
    if Ri_NST4_3_interp(i) <= 0.25
        n = 0;
        while 1
            n = n+1;
            if Ri_NST4_3_interp(i+n) > 0.25 | i+n == length(Ri_NST4_3_interp)
                break
            end
        end
        if i == i+n
            Ri_NST4_3_shad(i,1) = 1;
        elseif i ~= i+n
            Ri_NST4_3_shad(i:i+n,1) = 1;
        end
    else
        Ri_NST4_3_shad(i,1) = 0;
    end
end

for i = 1:length(Ri_NST4_4_interp) %%%%%%%%%%%%%%%%%%%%%%%
    if Ri_NST4_4_interp(i) <= 0.25 
        n = 0;
        while 1
            n = n+1;
            if Ri_NST4_4_interp(i+n) > 0.25 | i+n == length(Ri_NST4_4_interp)
                break
            end
        end
        if i == i+n
            Ri_NST4_4_shad(i,1) = 1;
        elseif i ~= i+n
            Ri_NST4_4_shad(i:i+n,1) = 1;
        end
    else
        Ri_NST4_4_shad(i,1) = 0;
    end
end

for i = 1:length(Ri_NST4_5_interp) %%%%%%%%%%%%%%%%%%%%%%
    if Ri_NST4_5_interp(i) <= 0.25
        n = 0;
        while 1
            n = n+1;
            if Ri_NST4_5_interp(i+n) > 0.25 | i+n == length(Ri_NST4_5_interp)
                break
            end
        end
        if i == i+n
            Ri_NST4_5_shad(i,1) = 1;
        elseif i ~= i+n
            Ri_NST4_5_shad(i:i+n,1) = 1;
        end
    else
        Ri_NST4_5_shad(i,1) = 0;
    end
end

%% Turbulent dissipation rate
clc;clear all;close all;
cd('C:\Users\USER\OneDrive\Desktop\data\MJES\38_MJES_202111_Haeyang_ES\VMP\nst')
diss_NST1_3 = quick_look('SNU_031.P',1,350);
diss_NST1_4 = quick_look('SNU_030.P',1,350);
diss_NST1_5 = quick_look('SNU_029.P',1,350);

diss_NST2_4 = quick_look('SNU_032.P',1,350);
diss_NST2_5 = quick_look('SNU_033.P',1,350);

diss_NST3_2 = quick_look('SNU_038.P',1,350);
diss_NST3_3 = quick_look('SNU_037.P',1,350);
diss_NST3_4 = quick_look('SNU_036.P',1,350);
diss_NST3_5 = quick_look('SNU_034.P',1,350);

diss_NST4_2 = quick_look('SNU_039.P',1,350);
diss_NST4_3 = quick_look('SNU_040.P',1,350);
diss_NST4_4 = quick_look('SNU_041.P',1,350);
diss_NST4_5 = quick_look('SNU_042.P',1,350);
close all;

% Take TDR variables
e1_NST1_3 = diss_NST1_3.e(1,:);
e2_NST1_3 = diss_NST1_3.e(2,:);
e1_NST1_4 = diss_NST1_4.e(1,:);
e2_NST1_4 = diss_NST1_4.e(2,:);
e1_NST1_5 = diss_NST1_5.e(1,:);
e2_NST1_5 = diss_NST1_5.e(2,:);

e1_NST2_4 = diss_NST2_4.e(1,:);
e2_NST2_4 = diss_NST2_4.e(2,:);
e1_NST2_5 = diss_NST2_5.e(1,:);
e2_NST2_5 = diss_NST2_5.e(2,:);

e1_NST3_2 = diss_NST3_2.e(1,:);
e2_NST3_2 = diss_NST3_2.e(2,:);
e1_NST3_3 = diss_NST3_3.e(1,:);
e2_NST3_3 = diss_NST3_3.e(2,:);
e1_NST3_4 = diss_NST3_4.e(1,:);
e2_NST3_4 = diss_NST3_4.e(2,:);
e1_NST3_5 = diss_NST3_5.e(1,:);
e2_NST3_5 = diss_NST3_5.e(2,:);

e1_NST4_2 = diss_NST4_2.e(1,:);
e2_NST4_2 = diss_NST4_2.e(2,:);
e1_NST4_3 = diss_NST4_3.e(1,:);
e2_NST4_3 = diss_NST4_3.e(2,:);
e1_NST4_4 = diss_NST4_4.e(1,:);
e2_NST4_4 = diss_NST4_4.e(2,:);
e1_NST4_5 = diss_NST4_5.e(1,:);
e2_NST4_5 = diss_NST4_5.e(2,:);

% Interpolate for K
rdd_diss_NST1_3 = round(diss_NST1_3.P);
newgrid_diss_NST1_3 = rdd_diss_NST1_3(1):1:rdd_diss_NST1_3(end);
intrplted_e1_NST1_3 = interp1(rdd_diss_NST1_3,e1_NST1_3',newgrid_diss_NST1_3');
intrplted_e2_NST1_3 = interp1(rdd_diss_NST1_3,e2_NST1_3',newgrid_diss_NST1_3');

rdd_diss_NST1_4 = round(diss_NST1_4.P);
newgrid_diss_NST1_4 = rdd_diss_NST1_4(1):1:rdd_diss_NST1_4(end);
intrplted_e1_NST1_4 = interp1(rdd_diss_NST1_4,e1_NST1_4',newgrid_diss_NST1_4');
intrplted_e2_NST1_4 = interp1(rdd_diss_NST1_4,e2_NST1_4',newgrid_diss_NST1_4');

rdd_diss_NST1_5 = round(diss_NST1_5.P);
newgrid_diss_NST1_5 = rdd_diss_NST1_5(1):1:rdd_diss_NST1_5(end);
intrplted_e1_NST1_5 = interp1(rdd_diss_NST1_5,e1_NST1_5',newgrid_diss_NST1_5');
intrplted_e2_NST1_5 = interp1(rdd_diss_NST1_5,e2_NST1_5',newgrid_diss_NST1_5');

rdd_diss_NST2_4 = round(diss_NST2_4.P);
newgrid_diss_NST2_4 = rdd_diss_NST2_4(1):1:rdd_diss_NST2_4(end);
intrplted_e1_NST2_4 = interp1(rdd_diss_NST2_4,e1_NST2_4',newgrid_diss_NST2_4');
intrplted_e2_NST2_4 = interp1(rdd_diss_NST2_4,e2_NST2_4',newgrid_diss_NST2_4');

rdd_diss_NST2_5 = round(diss_NST2_5.P);
newgrid_diss_NST2_5 = rdd_diss_NST2_5(1):1:rdd_diss_NST2_5(end);
intrplted_e1_NST2_5 = interp1(rdd_diss_NST2_5,e1_NST2_5',newgrid_diss_NST2_5');
intrplted_e2_NST2_5 = interp1(rdd_diss_NST2_5,e2_NST2_5',newgrid_diss_NST2_5');

rdd_diss_NST3_2 = round(diss_NST3_2.P);
newgrid_diss_NST3_2 = rdd_diss_NST3_2(1):1:rdd_diss_NST3_2(end);
intrplted_e1_NST3_2 = interp1(rdd_diss_NST3_2,e1_NST3_2',newgrid_diss_NST3_2');
intrplted_e2_NST3_2 = interp1(rdd_diss_NST3_2,e2_NST3_2',newgrid_diss_NST3_2');

rdd_diss_NST3_3 = round(diss_NST3_3.P);
newgrid_diss_NST3_3 = rdd_diss_NST3_3(1):1:rdd_diss_NST3_3(end);
intrplted_e1_NST3_3 = interp1(rdd_diss_NST3_3,e1_NST3_3',newgrid_diss_NST3_3');
intrplted_e2_NST3_3 = interp1(rdd_diss_NST3_3,e2_NST3_3',newgrid_diss_NST3_3');

rdd_diss_NST3_4 = round(diss_NST3_4.P);
newgrid_diss_NST3_4 = rdd_diss_NST3_4(1):1:rdd_diss_NST3_4(end);
intrplted_e1_NST3_4 = interp1(rdd_diss_NST3_4,e1_NST3_4',newgrid_diss_NST3_4');
intrplted_e2_NST3_4 = interp1(rdd_diss_NST3_4,e2_NST3_4',newgrid_diss_NST3_4');

rdd_diss_NST3_5 = round(diss_NST3_5.P);
newgrid_diss_NST3_5 = rdd_diss_NST3_5(1):1:rdd_diss_NST3_5(end);
intrplted_e1_NST3_5 = interp1(rdd_diss_NST3_5,e1_NST3_5',newgrid_diss_NST3_5');
intrplted_e2_NST3_5 = interp1(rdd_diss_NST3_5,e2_NST3_5',newgrid_diss_NST3_5');

rdd_diss_NST4_2 = round(diss_NST4_2.P);
newgrid_diss_NST4_2 = rdd_diss_NST4_2(1):1:rdd_diss_NST4_2(end);
intrplted_e1_NST4_2 = interp1(rdd_diss_NST4_2,e1_NST4_2',newgrid_diss_NST4_2');
intrplted_e2_NST4_2 = interp1(rdd_diss_NST4_2,e2_NST4_2',newgrid_diss_NST4_2');

rdd_diss_NST4_3 = round(diss_NST4_3.P);
newgrid_diss_NST4_3 = rdd_diss_NST4_3(1):1:rdd_diss_NST4_3(end);
intrplted_e1_NST4_3 = interp1(rdd_diss_NST4_3,e1_NST4_3',newgrid_diss_NST4_3');
intrplted_e2_NST4_3 = interp1(rdd_diss_NST4_3,e2_NST4_3',newgrid_diss_NST4_3');

rdd_diss_NST4_4 = round(diss_NST4_4.P);
newgrid_diss_NST4_4 = rdd_diss_NST4_4(1):1:rdd_diss_NST4_4(end);
intrplted_e1_NST4_4 = interp1(rdd_diss_NST4_4,e1_NST4_4',newgrid_diss_NST4_4');
intrplted_e2_NST4_4 = interp1(rdd_diss_NST4_4,e2_NST4_4',newgrid_diss_NST4_4');

rdd_diss_NST4_5 = round(diss_NST4_5.P);
newgrid_diss_NST4_5 = rdd_diss_NST4_5(1):1:rdd_diss_NST4_5(end);
intrplted_e1_NST4_5 = interp1(rdd_diss_NST4_5,e1_NST4_5',newgrid_diss_NST4_5');
intrplted_e2_NST4_5 = interp1(rdd_diss_NST4_5,e2_NST4_5',newgrid_diss_NST4_5');

%% Vertical diffusivity with Osborn method
K_e1_NST1_3 = 0.2.*intrplted_e1_NST1_3./N2_NST1(newgrid_diss_NST1_3(1):newgrid_diss_NST1_3(end),2);
K_e2_NST1_3 = 0.2.*intrplted_e2_NST1_3./N2_NST1(newgrid_diss_NST1_3(1):newgrid_diss_NST1_3(end),2);

K_e1_NST1_4 = 0.2.*intrplted_e1_NST1_4./N2_NST1(newgrid_diss_NST1_4(1):newgrid_diss_NST1_4(end),3);
K_e2_NST1_4 = 0.2.*intrplted_e2_NST1_4./N2_NST1(newgrid_diss_NST1_4(1):newgrid_diss_NST1_4(end),3);

K_e1_NST1_5 = 0.2.*intrplted_e1_NST1_5./N2_NST1(newgrid_diss_NST1_5(1):newgrid_diss_NST1_5(end),4);
K_e2_NST1_5 = 0.2.*intrplted_e2_NST1_5./N2_NST1(newgrid_diss_NST1_5(1):newgrid_diss_NST1_5(end),4);

K_e1_NST2_4 = 0.2.*intrplted_e1_NST2_4./N2_NST2(newgrid_diss_NST2_4(1):newgrid_diss_NST2_4(end),3);
K_e2_NST2_4 = 0.2.*intrplted_e2_NST2_4./N2_NST2(newgrid_diss_NST2_4(1):newgrid_diss_NST2_4(end),3);

K_e1_NST2_5 = 0.2.*intrplted_e1_NST2_5./N2_NST2(newgrid_diss_NST2_5(1):newgrid_diss_NST2_5(end),4);
K_e2_NST2_5 = 0.2.*intrplted_e2_NST2_5./N2_NST2(newgrid_diss_NST2_5(1):newgrid_diss_NST2_5(end),4);

K_e1_NST3_2 = 0.2.*intrplted_e1_NST3_2./N2_NST3(newgrid_diss_NST3_2(1):newgrid_diss_NST3_2(end),2);
K_e2_NST3_2 = 0.2.*intrplted_e2_NST3_2./N2_NST3(newgrid_diss_NST3_2(1):newgrid_diss_NST3_2(end),2);

K_e1_NST3_3 = 0.2.*intrplted_e1_NST3_3./N2_NST3(newgrid_diss_NST3_3(1):newgrid_diss_NST3_3(end),2);
K_e2_NST3_3 = 0.2.*intrplted_e2_NST3_3./N2_NST3(newgrid_diss_NST3_3(1):newgrid_diss_NST3_3(end),2);

K_e1_NST3_4 = 0.2.*intrplted_e1_NST3_4./N2_NST3(newgrid_diss_NST3_4(1):newgrid_diss_NST3_4(end),3);
K_e2_NST3_4 = 0.2.*intrplted_e2_NST3_4./N2_NST3(newgrid_diss_NST3_4(1):newgrid_diss_NST3_4(end),3);

K_e1_NST3_5 = 0.2.*intrplted_e1_NST3_5./N2_NST3(newgrid_diss_NST3_5(1):newgrid_diss_NST3_5(end),4);
K_e2_NST3_5 = 0.2.*intrplted_e2_NST3_5./N2_NST3(newgrid_diss_NST3_5(1):newgrid_diss_NST3_5(end),4);

K_e1_NST4_2 = 0.2.*intrplted_e1_NST4_2./N2_NST4(newgrid_diss_NST4_2(1):newgrid_diss_NST4_2(end),2);
K_e2_NST4_2 = 0.2.*intrplted_e2_NST4_2./N2_NST4(newgrid_diss_NST4_2(1):newgrid_diss_NST4_2(end),2);

K_e1_NST4_3 = 0.2.*intrplted_e1_NST4_3./N2_NST4(newgrid_diss_NST4_3(1):newgrid_diss_NST4_3(end),2);
K_e2_NST4_3 = 0.2.*intrplted_e2_NST4_3./N2_NST4(newgrid_diss_NST4_3(1):newgrid_diss_NST4_3(end),2);

K_e1_NST4_4 = 0.2.*intrplted_e1_NST4_4./N2_NST4(newgrid_diss_NST4_4(1):newgrid_diss_NST4_4(end),3);
K_e2_NST4_4 = 0.2.*intrplted_e2_NST4_4./N2_NST4(newgrid_diss_NST4_4(1):newgrid_diss_NST4_4(end),3);

K_e1_NST4_5 = 0.2.*intrplted_e1_NST4_5./N2_NST4(newgrid_diss_NST4_5(1):newgrid_diss_NST4_5(end),4);
K_e2_NST4_5 = 0.2.*intrplted_e2_NST4_5./N2_NST4(newgrid_diss_NST4_5(1):newgrid_diss_NST4_5(end),4);

%% Replace unreasonable diffusivity values with minimum one
idx_under_zero_e1_NST1_3 = find(K_e1_NST1_3 < 0);
idx_upper_zero_e1_NST1_3 = find(K_e1_NST1_3 > 0);
target_filling_value_e1_NST1_3 = min(K_e1_NST1_3(idx_upper_zero_e1_NST1_3));
K_e1_NST1_3(idx_under_zero_e1_NST1_3) = target_filling_value_e1_NST1_3;
for i = 1:5:length(K_e1_NST1_3)
    if i+4 <= length(K_e1_NST1_3)
        K_e1_NST1_3(i:i+4) = mean(K_e1_NST1_3(i:i+4));
    elseif i+4 > length(K_e1_NST1_3)
        K_e1_NST1_3(i:end) = mean(K_e1_NST1_3(i:end));
    end
end

idx_under_zero_e2_NST1_3 = find(K_e2_NST1_3 < 0);
idx_upper_zero_e2_NST1_3 = find(K_e2_NST1_3 > 0);
target_filling_value_e2_NST1_3 = min(K_e2_NST1_3(idx_upper_zero_e2_NST1_3));
K_e2_NST1_3(idx_under_zero_e2_NST1_3) = target_filling_value_e2_NST1_3;
for i = 1:5:length(K_e2_NST1_3)
    if i+4 <= length(K_e2_NST1_3)
        K_e2_NST1_3(i:i+4) = mean(K_e2_NST1_3(i:i+4));
    elseif i+4 > length(K_e2_NST1_3)
        K_e2_NST1_3(i:end) = mean(K_e2_NST1_3(i:end));
    end
end

idx_under_zero_e1_NST1_4 = find(K_e1_NST1_4 < 0);
idx_upper_zero_e1_NST1_4 = find(K_e1_NST1_4 > 0);
target_filling_value_e1_NST1_4 = min(K_e1_NST1_4(idx_upper_zero_e1_NST1_4));
K_e1_NST1_4(idx_under_zero_e1_NST1_4) = target_filling_value_e1_NST1_4;
for i = 1:5:length(K_e1_NST1_4)
    if i+4 <= length(K_e1_NST1_4)
        K_e1_NST1_4(i:i+4) = mean(K_e1_NST1_4(i:i+4));
    elseif i+4 > length(K_e1_NST1_4)
        K_e1_NST1_4(i:end) = mean(K_e1_NST1_4(i:end));
    end
end

idx_under_zero_e2_NST1_4 = find(K_e2_NST1_4 < 0);
idx_upper_zero_e2_NST1_4 = find(K_e2_NST1_4 > 0);
target_filling_value_e2_NST1_4 = min(K_e2_NST1_4(idx_upper_zero_e2_NST1_4));
K_e2_NST1_4(idx_under_zero_e2_NST1_4) = target_filling_value_e2_NST1_4;
for i = 1:5:length(K_e2_NST1_4)
    if i+4 <= length(K_e2_NST1_4)
        K_e2_NST1_4(i:i+4) = mean(K_e2_NST1_4(i:i+4));
    elseif i+4 > length(K_e2_NST1_4)
        K_e2_NST1_4(i:end) = mean(K_e2_NST1_4(i:end));
    end
end

idx_under_zero_e1_NST1_5 = find(K_e1_NST1_5 < 0);
idx_upper_zero_e1_NST1_5 = find(K_e1_NST1_5 > 0);
target_filling_value_e1_NST1_5 = min(K_e1_NST1_5(idx_upper_zero_e1_NST1_5));
K_e1_NST1_5(idx_under_zero_e1_NST1_5) = target_filling_value_e1_NST1_5;
for i = 1:5:length(K_e1_NST1_5)
    if i+4 <= length(K_e1_NST1_5)
        K_e1_NST1_5(i:i+4) = mean(K_e1_NST1_5(i:i+4));
    elseif i+4 > length(K_e1_NST1_5)
        K_e1_NST1_5(i:end) = mean(K_e1_NST1_5(i:end));
    end
end

idx_under_zero_e2_NST1_5 = find(K_e2_NST1_5 < 0);
idx_upper_zero_e2_NST1_5 = find(K_e2_NST1_5 > 0);
target_filling_value_e2_NST1_5 = min(K_e2_NST1_5(idx_upper_zero_e2_NST1_5));
K_e2_NST1_5(idx_under_zero_e2_NST1_5) = target_filling_value_e2_NST1_5;
for i = 1:5:length(K_e2_NST1_5)
    if i+4 <= length(K_e2_NST1_5)
        K_e2_NST1_5(i:i+4) = mean(K_e2_NST1_5(i:i+4));
    elseif i+4 > length(K_e2_NST1_5)
        K_e2_NST1_5(i:end) = mean(K_e2_NST1_5(i:end));
    end
end

idx_under_zero_e1_NST2_4 = find(K_e1_NST2_4 < 0);
idx_upper_zero_e1_NST2_4 = find(K_e1_NST2_4 > 0);
target_filling_value_e1_NST2_4 = min(K_e1_NST2_4(idx_upper_zero_e1_NST2_4));
K_e1_NST2_4(idx_under_zero_e1_NST2_4) = target_filling_value_e1_NST2_4;
for i = 1:5:length(K_e1_NST2_4)
    if i+4 <= length(K_e1_NST2_4)
        K_e1_NST2_4(i:i+4) = mean(K_e1_NST2_4(i:i+4));
    elseif i+4 > length(K_e1_NST2_4)
        K_e1_NST2_4(i:end) = mean(K_e1_NST2_4(i:end));
    end
end

idx_under_zero_e2_NST2_4 = find(K_e2_NST2_4 < 0);
idx_upper_zero_e2_NST2_4 = find(K_e2_NST2_4 > 0);
target_filling_value_e2_NST2_4 = min(K_e2_NST2_4(idx_upper_zero_e2_NST2_4));
K_e2_NST2_4(idx_under_zero_e2_NST2_4) = target_filling_value_e2_NST2_4;
for i = 1:5:length(K_e2_NST2_4)
    if i+4 <= length(K_e2_NST2_4)
        K_e2_NST2_4(i:i+4) = mean(K_e2_NST2_4(i:i+4));
    elseif i+4 > length(K_e2_NST2_4)
        K_e2_NST2_4(i:end) = mean(K_e2_NST2_4(i:end));
    end
end

idx_under_zero_e1_NST2_5 = find(K_e1_NST2_5 < 0);
idx_upper_zero_e1_NST2_5 = find(K_e1_NST2_5 > 0);
target_filling_value_e1_NST2_5 = min(K_e1_NST2_5(idx_upper_zero_e1_NST2_5));
K_e1_NST2_5(idx_under_zero_e1_NST2_5) = target_filling_value_e1_NST2_5;
for i = 1:5:length(K_e1_NST2_5)
    if i+4 <= length(K_e1_NST2_5)
        K_e1_NST2_5(i:i+4) = mean(K_e1_NST2_5(i:i+4));
    elseif i+4 > length(K_e1_NST2_5)
        K_e1_NST2_5(i:end) = mean(K_e1_NST2_5(i:end));
    end
end

idx_under_zero_e2_NST2_5 = find(K_e2_NST2_5 < 0);
idx_upper_zero_e2_NST2_5 = find(K_e2_NST2_5 > 0);
target_filling_value_e2_NST2_5 = min(K_e2_NST2_5(idx_upper_zero_e2_NST2_5));
K_e2_NST2_5(idx_under_zero_e2_NST2_5) = target_filling_value_e2_NST2_5;
for i = 1:5:length(K_e2_NST2_5)
    if i+4 <= length(K_e2_NST2_5)
        K_e2_NST2_5(i:i+4) = mean(K_e2_NST2_5(i:i+4));
    elseif i+4 > length(K_e2_NST2_5)
        K_e2_NST2_5(i:end) = mean(K_e2_NST2_5(i:end));
    end
end

idx_under_zero_e1_NST3_2 = find(K_e1_NST3_2 < 0);
idx_upper_zero_e1_NST3_2 = find(K_e1_NST3_2 > 0);
target_filling_value_e1_NST3_2 = min(K_e1_NST3_2(idx_upper_zero_e1_NST3_2));
K_e1_NST3_2(idx_under_zero_e1_NST3_2) = target_filling_value_e1_NST3_2;
for i = 1:5:length(K_e1_NST3_2)
    if i+4 <= length(K_e1_NST3_2)
        K_e1_NST3_2(i:i+4) = mean(K_e1_NST3_2(i:i+4));
    elseif i+4 > length(K_e1_NST3_2)
        K_e1_NST3_2(i:end) = mean(K_e1_NST3_2(i:end));
    end
end

idx_under_zero_e2_NST3_2 = find(K_e2_NST3_2 < 0);
idx_upper_zero_e2_NST3_2 = find(K_e2_NST3_2 > 0);
target_filling_value_e2_NST3_2 = min(K_e2_NST3_2(idx_upper_zero_e2_NST3_2));
K_e2_NST3_2(idx_under_zero_e2_NST3_2) = target_filling_value_e2_NST3_2;
for i = 1:5:length(K_e2_NST3_2)
    if i+4 <= length(K_e2_NST3_2)
        K_e2_NST3_2(i:i+4) = mean(K_e2_NST3_2(i:i+4));
    elseif i+4 > length(K_e2_NST3_2)
        K_e2_NST3_2(i:end) = mean(K_e2_NST3_2(i:end));
    end
end

idx_under_zero_e1_NST3_3 = find(K_e1_NST3_3 < 0);
idx_upper_zero_e1_NST3_3 = find(K_e1_NST3_3 > 0);
target_filling_value_e1_NST3_3 = min(K_e1_NST3_3(idx_upper_zero_e1_NST3_3));
K_e1_NST3_3(idx_under_zero_e1_NST3_3) = target_filling_value_e1_NST3_3;
for i = 1:5:length(K_e1_NST3_3)
    if i+4 <= length(K_e1_NST3_3)
        K_e1_NST3_3(i:i+4) = mean(K_e1_NST3_3(i:i+4));
    elseif i+4 > length(K_e1_NST3_3)
        K_e1_NST3_3(i:end) = mean(K_e1_NST3_3(i:end));
    end
end

idx_under_zero_e2_NST3_3 = find(K_e2_NST3_3 < 0);
idx_upper_zero_e2_NST3_3 = find(K_e2_NST3_3 > 0);
target_filling_value_e2_NST3_3 = min(K_e2_NST3_3(idx_upper_zero_e2_NST3_3));
K_e2_NST3_3(idx_under_zero_e2_NST3_3) = target_filling_value_e2_NST3_3;
for i = 1:5:length(K_e2_NST3_3)
    if i+4 <= length(K_e2_NST3_3)
        K_e2_NST3_3(i:i+4) = mean(K_e2_NST3_3(i:i+4));
    elseif i+4 > length(K_e2_NST3_3)
        K_e2_NST3_3(i:end) = mean(K_e2_NST3_3(i:end));
    end
end

idx_under_zero_e1_NST3_4 = find(K_e1_NST3_4 < 0);
idx_upper_zero_e1_NST3_4 = find(K_e1_NST3_4 > 0);
target_filling_value_e1_NST3_4 = min(K_e1_NST3_4(idx_upper_zero_e1_NST3_4));
K_e1_NST3_4(idx_under_zero_e1_NST3_4) = target_filling_value_e1_NST3_4;
for i = 1:5:length(K_e1_NST3_4)
    if i+4 <= length(K_e1_NST3_4)
        K_e1_NST3_4(i:i+4) = mean(K_e1_NST3_4(i:i+4));
    elseif i+4 > length(K_e1_NST3_4)
        K_e1_NST3_4(i:end) = mean(K_e1_NST3_4(i:end));
    end
end

idx_under_zero_e2_NST3_4 = find(K_e2_NST3_4 < 0);
idx_upper_zero_e2_NST3_4 = find(K_e2_NST3_4 > 0);
target_filling_value_e2_NST3_4 = min(K_e2_NST3_4(idx_upper_zero_e2_NST3_4));
K_e2_NST3_4(idx_under_zero_e2_NST3_4) = target_filling_value_e2_NST3_4;
for i = 1:5:length(K_e2_NST3_4)
    if i+4 <= length(K_e2_NST3_4)
        K_e2_NST3_4(i:i+4) = mean(K_e2_NST3_4(i:i+4));
    elseif i+4 > length(K_e2_NST3_4)
        K_e2_NST3_4(i:end) = mean(K_e2_NST3_4(i:end));
    end
end

idx_under_zero_e1_NST3_5 = find(K_e1_NST3_5 < 0);
idx_upper_zero_e1_NST3_5 = find(K_e1_NST3_5 > 0);
target_filling_value_e1_NST3_5 = min(K_e1_NST3_5(idx_upper_zero_e1_NST3_5));
K_e1_NST3_5(idx_under_zero_e1_NST3_5) = target_filling_value_e1_NST3_5;
for i = 1:5:length(K_e1_NST3_5)
    if i+4 <= length(K_e1_NST3_5)
        K_e1_NST3_5(i:i+4) = mean(K_e1_NST3_5(i:i+4));
    elseif i+4 > length(K_e1_NST3_5)
        K_e1_NST3_5(i:end) = mean(K_e1_NST3_5(i:end));
    end
end

idx_under_zero_e2_NST3_5 = find(K_e2_NST3_5 < 0);
idx_upper_zero_e2_NST3_5 = find(K_e2_NST3_5 > 0);
target_filling_value_e2_NST3_5 = min(K_e2_NST3_5(idx_upper_zero_e2_NST3_5));
K_e2_NST3_5(idx_under_zero_e2_NST3_5) = target_filling_value_e2_NST3_5;
for i = 1:5:length(K_e2_NST3_5)
    if i+4 <= length(K_e2_NST3_5)
        K_e2_NST3_5(i:i+4) = mean(K_e2_NST3_5(i:i+4));
    elseif i+4 > length(K_e2_NST3_5)
        K_e2_NST3_5(i:end) = mean(K_e2_NST3_5(i:end));
    end
end

idx_under_zero_e1_NST4_2 = find(K_e1_NST4_2 < 0);
idx_upper_zero_e1_NST4_2 = find(K_e1_NST4_2 > 0);
target_filling_value_e1_NST4_2 = min(K_e1_NST4_2(idx_upper_zero_e1_NST4_2));
K_e1_NST4_2(idx_under_zero_e1_NST4_2) = target_filling_value_e1_NST4_2;
for i = 1:5:length(K_e1_NST4_2)
    if i+4 <= length(K_e1_NST4_2)
        K_e1_NST4_2(i:i+4) = mean(K_e1_NST4_2(i:i+4));
    elseif i+4 > length(K_e1_NST4_2)
        K_e1_NST4_2(i:end) = mean(K_e1_NST4_2(i:end));
    end
end

idx_under_zero_e2_NST4_2 = find(K_e2_NST4_2 < 0);
idx_upper_zero_e2_NST4_2 = find(K_e2_NST4_2 > 0);
target_filling_value_e2_NST4_2 = min(K_e2_NST4_2(idx_upper_zero_e2_NST4_2));
K_e2_NST4_2(idx_under_zero_e2_NST4_2) = target_filling_value_e2_NST4_2;
for i = 1:5:length(K_e2_NST4_2)
    if i+4 <= length(K_e2_NST4_2)
        K_e2_NST4_2(i:i+4) = mean(K_e2_NST4_2(i:i+4));
    elseif i+4 > length(K_e2_NST4_2)
        K_e2_NST4_2(i:end) = mean(K_e2_NST4_2(i:end));
    end
end

idx_under_zero_e1_NST4_3 = find(K_e1_NST4_3 < 0);
idx_upper_zero_e1_NST4_3 = find(K_e1_NST4_3 > 0);
target_filling_value_e1_NST4_3 = min(K_e1_NST4_3(idx_upper_zero_e1_NST4_3));
K_e1_NST4_3(idx_under_zero_e1_NST4_3) = target_filling_value_e1_NST4_3;
for i = 1:5:length(K_e1_NST4_3)
    if i+4 <= length(K_e1_NST4_3)
        K_e1_NST4_3(i:i+4) = mean(K_e1_NST4_3(i:i+4));
    elseif i+4 > length(K_e1_NST4_3)
        K_e1_NST4_3(i:end) = mean(K_e1_NST4_3(i:end));
    end
end

idx_under_zero_e2_NST4_3 = find(K_e2_NST4_3 < 0);
idx_upper_zero_e2_NST4_3 = find(K_e2_NST4_3 > 0);
target_filling_value_e2_NST4_3 = min(K_e2_NST4_3(idx_upper_zero_e2_NST4_3));
K_e2_NST4_3(idx_under_zero_e2_NST4_3) = target_filling_value_e2_NST4_3;
for i = 1:5:length(K_e2_NST4_3)
    if i+4 <= length(K_e2_NST4_3)
        K_e2_NST4_3(i:i+4) = mean(K_e2_NST4_3(i:i+4));
    elseif i+4 > length(K_e2_NST4_3)
        K_e2_NST4_3(i:end) = mean(K_e2_NST4_3(i:end));
    end
end

idx_under_zero_e1_NST4_4 = find(K_e1_NST4_4 < 0);
idx_upper_zero_e1_NST4_4 = find(K_e1_NST4_4 > 0);
target_filling_value_e1_NST4_4 = min(K_e1_NST4_4(idx_upper_zero_e1_NST4_4));
K_e1_NST4_4(idx_under_zero_e1_NST4_4) = target_filling_value_e1_NST4_4;
for i = 1:5:length(K_e1_NST4_4)
    if i+4 <= length(K_e1_NST4_4)
        K_e1_NST4_4(i:i+4) = mean(K_e1_NST4_4(i:i+4));
    elseif i+4 > length(K_e1_NST4_4)
        K_e1_NST4_4(i:end) = mean(K_e1_NST4_4(i:end));
    end
end

idx_under_zero_e2_NST4_4 = find(K_e2_NST4_4 < 0);
idx_upper_zero_e2_NST4_4 = find(K_e2_NST4_4 > 0);
target_filling_value_e2_NST4_4 = min(K_e2_NST4_4(idx_upper_zero_e2_NST4_4));
K_e2_NST4_4(idx_under_zero_e2_NST4_4) = target_filling_value_e2_NST4_4;
for i = 1:5:length(K_e2_NST4_4)
    if i+4 <= length(K_e2_NST4_4)
        K_e2_NST4_4(i:i+4) = mean(K_e2_NST4_4(i:i+4));
    elseif i+4 > length(K_e2_NST4_4)
        K_e2_NST4_4(i:end) = mean(K_e2_NST4_4(i:end));
    end
end

idx_under_zero_e1_NST4_5 = find(K_e1_NST4_5 < 0);
idx_upper_zero_e1_NST4_5 = find(K_e1_NST4_5 > 0);
target_filling_value_e1_NST4_5 = min(K_e1_NST4_5(idx_upper_zero_e1_NST4_5));
K_e1_NST4_5(idx_under_zero_e1_NST4_5) = target_filling_value_e1_NST4_5;
for i = 1:5:length(K_e1_NST4_5)
    if i+4 <= length(K_e1_NST4_5)
        K_e1_NST4_5(i:i+4) = mean(K_e1_NST4_5(i:i+4));
    elseif i+4 > length(K_e1_NST4_5)
        K_e1_NST4_5(i:end) = mean(K_e1_NST4_5(i:end));
    end
end

idx_under_zero_e2_NST4_5 = find(K_e2_NST4_5 < 0);
idx_upper_zero_e2_NST4_5 = find(K_e2_NST4_5 > 0);
target_filling_value_e2_NST4_5 = min(K_e2_NST4_5(idx_upper_zero_e2_NST4_5));
K_e2_NST4_5(idx_under_zero_e2_NST4_5) = target_filling_value_e2_NST4_5;
for i = 1:5:length(K_e2_NST4_5)
    if i+4 <= length(K_e2_NST4_5)
        K_e2_NST4_5(i:i+4) = mean(K_e2_NST4_5(i:i+4));
    elseif i+4 > length(K_e2_NST4_5)
        K_e2_NST4_5(i:end) = mean(K_e2_NST4_5(i:end));
    end
end

%% Plotting Turbulent dissipation rate, Richardson number, and vertical diffusivity
% NST1
%get(gcf,'Position')
figure;set(gcf,'position',[1 1 1920 1003]);
ax(1) = subplot(1,4,1);
[lineh_1,ax_m_1] = plotmultix(e1_NST1_3,diss_NST1_3.P,':k', ...
    K_e1_NST1_3,newgrid_diss_NST1_3',':r', 'MarkerFaceColor','k','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_1(:,2),'ylim',[0 120]);
set(ax_m_1(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_1(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_1(1,2),e2_NST1_3,diss_NST1_3.P,'-k','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_1(2,2),K_e2_NST1_3,newgrid_diss_NST1_3,'-r','MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',3);
set(ax_m_1(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(1).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(1).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_1(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_1(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
ylabel('Pressure (db)','FontWeight','b','Fontsize',30,'FontName','Times New Roman');
title('NST1-2','FontWeight','b','Fontsize',40,'FontName','Times New Roman');
legend([lineh_1(1) TDR lineh_1(2) VD],'\epsilon1','\epsilon2','\kappa1','\kappa2','Position',[0.0526 0.809 0.0499 0.1148]);hold off;

ax(2) = subplot(1,4,2);
[lineh_1,ax_m_1] = plotmultix(e1_NST1_3,diss_NST1_3.P,':k', ...
    K_e1_NST1_3,newgrid_diss_NST1_3',':r', 'MarkerFaceColor','k','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_1(:,2),'ylim',[0 120]);
set(ax_m_1(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_1(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_1(1,2),e2_NST1_3,diss_NST1_3.P,'-k','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_1(2,2),K_e2_NST1_3,newgrid_diss_NST1_3,'-r','MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',3);
set(ax_m_1(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(2).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(2).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_1(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_1(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
ylabel('Pressure (db)','FontWeight','b','Fontsize',30,'FontName','Times New Roman');
title('NST1-3','FontWeight','b','Fontsize',40,'FontName','Times New Roman');
legend([lineh_1(1) TDR lineh_1(2) VD],'\epsilon1','\epsilon2','\kappa1','\kappa2','Position',[0.0526 0.809 0.0499 0.1148]);hold off;

ax(3) = subplot(1,4,3);
[lineh_2,ax_m_2] = plotmultix(e1_NST1_4,diss_NST1_4.P,':k', ...
    K_e1_NST1_4,newgrid_diss_NST1_4',':r','MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_2(:,2),'ylim',[0 120]);
set(ax_m_2(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_2(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_2(1,2),e2_NST1_4,diss_NST1_4.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_2(2,2),K_e2_NST1_4,newgrid_diss_NST1_4,'-r','LineWidth',3);
set(ax_m_2(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(3).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(3).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_2(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_2(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
title('NST1-4','FontWeight','b','Fontsize',40,'FontName','Times New Roman');hold off;

ax(4) = subplot(1,4,4);
[lineh_3,ax_m_3] = plotmultix(e1_NST1_5,diss_NST1_5.P,':k', ...
    K_e1_NST1_5,newgrid_diss_NST1_5',':r','MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_3(:,2),'ylim',[0 120]);
set(ax_m_3(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_3(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_3(1,2),e2_NST1_5,diss_NST1_5.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_3(2,2),K_e2_NST1_5,newgrid_diss_NST1_5,'-r','LineWidth',3);
set(ax_m_3(:),'FontWeight','b','FontSize',19,'linewi',1.5);
set(ax(4).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(4).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_3(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_3(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
title('NST1-5','FontWeight','b','Fontsize',40,'FontName','Times New Roman');hold off;

% NST2
figure;set(gcf,'position',[1 1 1920 1003]);
ax(1) = subplot(1,4,1);
[lineh_1,ax_m_1] = plotmultix(e1_NST2_4,diss_NST2_4.P,':k', ...
    K_e1_NST2_4,newgrid_diss_NST2_4',':r','MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_1(:,2),'ylim',[0 130]);
set(ax_m_1(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_1(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_1(1,2),e2_NST2_4,diss_NST2_4.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_1(2,2),K_e2_NST2_4,newgrid_diss_NST2_4,'-r','LineWidth',3);
set(ax_m_1(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(1).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(1).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_1(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_1(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
ylabel('Pressure (db)','FontWeight','b','Fontsize',30,'FontName','Times New Roman');
title('NST2-4','FontWeight','b','Fontsize',40,'FontName','Times New Roman');
% legend([lineh_1(1) TDR lineh_1(2) VD],'\epsilon1','\epsilon2','\kappa1','\kappa2','Position',[0.0131 0.811 0.0765 0.1148]);hold off;

ax(2) = subplot(1,4,2);
[lineh_2,ax_m_2] = plotmultix(e1_NST2_5,diss_NST2_5.P,':k', ...
    K_e1_NST2_5,newgrid_diss_NST2_5',':r','MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_2(:,2),'ylim',[0 130]);
set(ax_m_2(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_2(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_2(1,2),e2_NST2_5,diss_NST2_5.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_2(2,2),K_e2_NST2_5,newgrid_diss_NST2_5,'-r','LineWidth',3);
set(ax_m_2(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(2).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(2).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_2(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_2(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
title('NST2-5','FontWeight','b','Fontsize',40,'FontName','Times New Roman');hold off;

ax(3) = subplot(1,4,3);
[lineh_1,ax_m_1] = plotmultix(e1_NST2_4,diss_NST2_4.P,':k', ...
    K_e1_NST2_4,newgrid_diss_NST2_4',':r','MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_1(:,2),'ylim',[0 130]);
set(ax_m_1(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_1(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_1(1,2),e2_NST2_4,diss_NST2_4.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_1(2,2),K_e2_NST2_4,newgrid_diss_NST2_4,'-r','LineWidth',3);
set(ax_m_1(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(3).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(3).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_1(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_1(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
ylabel('Pressure (db)','FontWeight','b','Fontsize',30,'FontName','Times New Roman');
title('NST2-4','FontWeight','b','Fontsize',40,'FontName','Times New Roman');
legend([lineh_1(1) TDR lineh_1(2) VD],'\epsilon1','\epsilon2','\kappa1','\kappa2','Position',[0.0131 0.811 0.0765 0.1148]);hold off;

ax(4) = subplot(1,4,4);
[lineh_2,ax_m_2] = plotmultix(e1_NST2_5,diss_NST2_5.P,':k', ...
    K_e1_NST2_5,newgrid_diss_NST2_5',':r','MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_2(:,2),'ylim',[0 130]);
set(ax_m_2(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_2(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_2(1,2),e2_NST2_5,diss_NST2_5.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_2(2,2),K_e2_NST2_5,newgrid_diss_NST2_5,'-r','LineWidth',3);
set(ax_m_2(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(4).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(4).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_2(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_2(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
title('NST2-5','FontWeight','b','Fontsize',40,'FontName','Times New Roman');hold off;

%NST3
figure;set(gcf,'position',[1 1 1920 1003]);
ax(1) = subplot(1,4,1);
[lineh_1,ax_m_1] = plotmultix(e1_NST3_2,diss_NST3_2.P,':k', ...
    K_e1_NST3_2,newgrid_diss_NST3_2',':r','MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_1(:,2),'ylim',[0 130]);
set(ax_m_1(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_1(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_1(1,2),e2_NST3_2,diss_NST3_2.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_1(2,2),K_e2_NST3_2,newgrid_diss_NST3_2,'-r','LineWidth',3);
set(ax_m_1(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(1).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(1).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_1(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_1(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
ylabel('Pressure (db)','FontWeight','b','Fontsize',30,'FontName','Times New Roman');
title('NST3-2','FontWeight','b','Fontsize',40,'FontName','Times New Roman');
% legend([lineh_1(1) TDR lineh_1(2) VD],'\epsilon1','\epsilon2','\kappa1','\kappa2','Position',[0.066,0.8157,0.0405,0.109]);hold off;

ax(2) = subplot(1,4,2);
[lineh_2,ax_m_2] = plotmultix(e1_NST3_3,diss_NST3_3.P,':k', ...
    K_e1_NST3_3,newgrid_diss_NST3_3',':r','MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_2(:,2),'ylim',[0 130]);
set(ax_m_2(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_2(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_2(1,2),e2_NST3_3,diss_NST3_3.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_2(2,2),K_e2_NST3_3,newgrid_diss_NST3_3,'-r','LineWidth',3);
set(ax_m_2(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(2).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(2).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_2(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_2(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
title('NST3-3','FontWeight','b','Fontsize',40,'FontName','Times New Roman');

ax(3) = subplot(1,4,3);
[lineh_3,ax_m_3] = plotmultix(e1_NST3_4,diss_NST3_4.P,':k', ...
    K_e1_NST3_4,newgrid_diss_NST3_4',':r','MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_3(:,2),'ylim',[0 130]);
set(ax_m_3(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_3(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_3(1,2),e2_NST3_4,diss_NST3_4.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_3(2,2),K_e2_NST3_4,newgrid_diss_NST3_4,'-r','LineWidth',3);
set(ax_m_3(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(3).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(3).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_3(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_3(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
title('NST3-4','FontWeight','b','Fontsize',40,'FontName','Times New Roman');hold off;

ax(4) = subplot(1,4,4);
[lineh_4,ax_m_4] = plotmultix(e1_NST3_5,diss_NST3_5.P,':k', ...
    K_e1_NST3_5,newgrid_diss_NST3_5',':r','MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_4(:,2),'ylim',[0 130]);
set(ax_m_4(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_4(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_4(1,2),e2_NST3_5,diss_NST3_5.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_4(2,2),K_e2_NST3_5,newgrid_diss_NST3_5,'-r','LineWidth',3);
set(ax_m_4(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(4).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(4).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_4(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_4(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
title('NST3-5','FontWeight','b','Fontsize',40,'FontName','Times New Roman');hold off;

%NST4
figure;set(gcf,'position',[1 1 1920 1003]);
ax(1) = subplot(1,4,1);
[lineh_1,ax_m_1] = plotmultix(e1_NST4_2,diss_NST4_2.P,':k', ...
    K_e1_NST4_2,newgrid_diss_NST4_2',':r', 'MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_1(:,2),'ylim',[0 160]);
set(ax_m_1(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_1(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_1(1,2),e2_NST4_2,diss_NST4_2.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_1(2,2),K_e2_NST4_2,newgrid_diss_NST4_2,'-r','LineWidth',3);
set(ax_m_1(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(1).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(1).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_1(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_1(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
ylabel('Pressure (db)','FontWeight','b','Fontsize',30,'FontName','Times New Roman');
title('NST4-2','FontWeight','b','Fontsize',40,'FontName','Times New Roman');
legend([lineh_1(1) TDR lineh_1(2) VD],'\epsilon1','\epsilon2','\kappa1','\kappa2','Position',[0.066,0.8157,0.0405,0.109]);hold off;

ax(2) = subplot(1,4,2);
[lineh_2,ax_m_2] = plotmultix(e1_NST4_3,diss_NST4_3.P,':k', ...
    K_e1_NST4_3,newgrid_diss_NST4_3',':r', 'MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_2(:,2),'ylim',[0 160]);
set(ax_m_2(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_2(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_2(1,2),e2_NST4_3,diss_NST4_3.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_2(2,2),K_e2_NST4_3,newgrid_diss_NST4_3,'-r','LineWidth',3);
set(ax_m_2(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(2).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(2).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_2(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_2(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
title('NST4-3','FontWeight','b','Fontsize',40,'FontName','Times New Roman');

ax(3) = subplot(1,4,3);
[lineh_3,ax_m_3] = plotmultix(e1_NST4_4,diss_NST4_4.P,':k', ...
    K_e1_NST4_4,newgrid_diss_NST4_4',':r', 'MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_3(:,2),'ylim',[0 160]);
set(ax_m_3(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_3(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_3(1,2),e2_NST4_4,diss_NST4_4.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_3(2,2),K_e2_NST4_4,newgrid_diss_NST4_4,'-r','LineWidth',3);
set(ax_m_3(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(3).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(3).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_3(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_3(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
title('NST4-4','FontWeight','b','Fontsize',40,'FontName','Times New Roman');hold off;

ax(4) = subplot(1,4,4);
[lineh_4,ax_m_4] = plotmultix(e1_NST4_5,diss_NST4_5.P,':k', ...
    K_e1_NST4_5,newgrid_diss_NST4_5',':r', 'MarkerFaceColor','r','LineWidth',3,'MarkerEdgeColor','k', ...
    'LineWidth',3,'ydir','reverse');hold on;grid on;
set(ax_m_4(:,2),'ylim',[0 160]);
set(ax_m_4(1,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
set(ax_m_4(2,:),'xscale','log','xlim',[10^-11 10^1],'xtick',[10^-11,10^-8,10^-5,10^-2,10^1],'XMinorTick','on','TickDir','in','FontName','Times New Roman','LineWidth',3); 
TDR = plot(ax_m_4(1,2),e2_NST4_5,diss_NST4_5.P,'-k','MarkerFaceColor','b','MarkerEdgeColor','k','LineWidth',3);
VD = plot(ax_m_4(2,2),K_e2_NST4_5,newgrid_diss_NST4_5,'-r','LineWidth',3);
set(ax_m_4(:),'FontWeight','b','fontsize',19,'linewi',1.5);
set(ax(4).XAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
set(ax(4).YAxis,'FontWeight','b','fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_4(1,1),'\epsilon (W kg^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
xlabel(ax_m_4(2,1),'\kappa_z (m^2 s^{-1})','FontWeight','b','Fontsize',19,'FontName','Times New Roman');
title('NST4-5','FontWeight','b','Fontsize',40,'FontName','Times New Roman');hold off;

%% Cross-section
% Collect data
K_e1_NST1(1:length(K_e1_NST1_3),2) = K_e1_NST1_3;
K_e1_NST1(1:length(K_e1_NST1_4),3) = K_e1_NST1_4;
K_e1_NST1(1:length(K_e1_NST1_5),4) = K_e1_NST1_5;
K_e1_NST1(:,1) = nan;

K_e1_NST2(1:length(K_e1_NST2_4),3) = K_e1_NST2_4;
K_e1_NST2(1:length(K_e1_NST2_5),4) = K_e1_NST2_5;
K_e1_NST2(:,1) = nan;
K_e1_NST2(:,2) = nan;

K_e1_NST3(1:length(K_e1_NST3_2),1) = K_e1_NST3_2;
K_e1_NST3(1:length(K_e1_NST3_3),2) = K_e1_NST3_3;
K_e1_NST3(1:length(K_e1_NST3_4),3) = K_e1_NST3_4;
K_e1_NST3(1:length(K_e1_NST3_5),4) = K_e1_NST3_5;

K_e1_NST4(1:length(K_e1_NST4_2),1) = K_e1_NST4_2;
K_e1_NST4(1:length(K_e1_NST4_3),2) = K_e1_NST4_3;
K_e1_NST4(1:length(K_e1_NST4_4),3) = K_e1_NST4_4;
K_e1_NST4(1:length(K_e1_NST4_5),4) = K_e1_NST4_5;

% prep for makin meshgrid
kprs_nst1(1:length(newgrid_diss_NST1_3),1) = newgrid_diss_NST1_3;
kprs_nst1(1:length(newgrid_diss_NST1_3),2) = newgrid_diss_NST1_3;
kprs_nst1(1:length(newgrid_diss_NST1_4),3) = newgrid_diss_NST1_4;
kprs_nst1(1:length(newgrid_diss_NST1_5),4) = newgrid_diss_NST1_5;

kprs_nst2(1:length(newgrid_diss_NST2_4),1) = newgrid_diss_NST2_4;
kprs_nst2(1:length(newgrid_diss_NST2_4),2) = newgrid_diss_NST2_4;
kprs_nst2(1:length(newgrid_diss_NST2_4),3) = newgrid_diss_NST2_4;
kprs_nst2(1:length(newgrid_diss_NST2_5),4) = newgrid_diss_NST2_5;

kprs_nst3(1:length(newgrid_diss_NST3_2),1) = newgrid_diss_NST3_2;
kprs_nst3(1:length(newgrid_diss_NST3_3),2) = newgrid_diss_NST3_3;
kprs_nst3(1:length(newgrid_diss_NST3_4),3) = newgrid_diss_NST3_4;
kprs_nst3(1:length(newgrid_diss_NST3_5),4) = newgrid_diss_NST3_5;

kprs_nst4(1:length(newgrid_diss_NST4_2),1) = newgrid_diss_NST4_2;
kprs_nst4(1:length(newgrid_diss_NST4_3),2) = newgrid_diss_NST4_3;
kprs_nst4(1:length(newgrid_diss_NST4_4),3) = newgrid_diss_NST4_4;
kprs_nst4(1:length(newgrid_diss_NST4_5),4) = newgrid_diss_NST4_5;

% Make mashgrids
[mklon_nst1 mkprs_nst1] = meshgrid(mlon_nst1(1,:),kprs_nst1(:,1));
[mklon_nst2 mkprs_nst2] = meshgrid(mlon_nst2(1,:),kprs_nst2(:,1));
[mklon_nst3 mkprs_nst3] = meshgrid(mlon_nst3(1,:),kprs_nst3(:,3));
[mklon_nst4 mkprs_nst4] = meshgrid(mlon_nst4(1,:),kprs_nst4(:,4));

% Plot
figure;set(gcf,'position',[648 2 1363 994]);
ax(1) = subplot(2,2,1);
pcolor(mklon_nst1,mkprs_nst1,log10(K_e1_NST1));shading interp;hold on;
colormap('jet');
set(gca,'YDir','reverse');
caxis([-7 0])
xline(lon_mcllcted_nst1,'-r',{'NST1-2','NST1-3','NST1-4','NST1-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',17);
xlim([min(lon_mcllcted_nst1) max(lon_mcllcted_nst1)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 17;%h.Ruler.TickLabelFormat = '%.1f';
ylabel(h,'log \kappa','FontSize',22,'FontName','Times New Roman','FontWeight','b','Rotation',270,'Position',[5.00 -4.97 0]);
title(h,'[m^2 s^{-1}]','Fontname','Times New Roman','fontweight','b','FontSize',13);
title('NST1','Fontname','Times New Roman','FontWeight','b','FontSize',35);
set(ax(1).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
set(ax(1).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',22);
area(lon_for_bathy_nst1,-BATHY_nst1,max(mprs_nst1(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(2) = subplot(2,2,2);
pcolor(mklon_nst2,mkprs_nst2,log10(K_e1_NST2));shading interp;hold on;
colormap('jet');
set(gca,'YDir','reverse');
caxis([-7 0])
xline(lon_mcllcted_nst2,'-r',{'NST2-2','NST2-3','NST2-4','NST2-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',17);
xlim([min(lon_mcllcted_nst2) max(lon_mcllcted_nst2)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 17;%h.Ruler.TickLabelFormat = '%.1f';
ylabel(h,'log \kappa','FontSize',22,'FontName','Times New Roman','FontWeight','b','Rotation',270,'Position',[5.00 -4.97 0]);
title(h,'[m^2 s^{-1}]','Fontname','Times New Roman','fontweight','b','FontSize',13);
title('NST2','Fontname','Times New Roman','FontWeight','b','FontSize',35);
set(ax(2).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
set(ax(2).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
area(lon_for_bathy_nst2,-BATHY_nst2,max(mprs_nst2(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(3) = subplot(2,2,3);
pcolor(mklon_nst3,mkprs_nst3,log10(K_e1_NST3));shading interp;hold on;
colormap('jet');
set(gca,'YDir','reverse');
caxis([-7 0])
xline(lon_mcllcted_nst3,'-r',{'NST3-2','NST3-3','NST3-4','NST3-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',17);
xlim([min(lon_mcllcted_nst3) max(lon_mcllcted_nst3)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 17;%h.Ruler.TickLabelFormat = '%.1f';
ylabel(h,'log \kappa','FontSize',22,'FontName','Times New Roman','FontWeight','b','Rotation',270,'Position',[5.00 -4.97 0]);
title(h,'[m^2 s^{-1}]','Fontname','Times New Roman','fontweight','b','FontSize',13);
title('NST3','Fontname','Times New Roman','FontWeight','b','FontSize',35);
set(ax(3).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
set(ax(3).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
xlabel('Longitude (^oE)','Fontname','Times New Roman','FontWeight','b','FontSize',22);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',22);
area(lon_for_bathy_nst3,-BATHY_nst3,max(mprs_nst3(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;

ax(4) = subplot(2,2,4);
pcolor(mklon_nst4,mkprs_nst4,log10(K_e1_NST4));shading interp;hold on;
colormap('jet');
set(gca,'YDir','reverse');
caxis([-7 0])
xline(lon_mcllcted_nst4,'-r',{'NST4-2','NST4-3','NST4-4','NST4-5'},'LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',17);
xlim([min(lon_mcllcted_nst4) max(lon_mcllcted_nst4)]);
ylim([0 200]);
xtickformat('%.2f');
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 17;%h.Ruler.TickLabelFormat = '%.1f';
ylabel(h,'log \kappa','FontSize',22,'FontName','Times New Roman','FontWeight','b','Rotation',270,'Position',[5.00 -4.97 0]);
title(h,'[m^2 s^{-1}]','Fontname','Times New Roman','fontweight','b','FontSize',13);
title('NST4','Fontname','Times New Roman','FontWeight','b','FontSize',35);
set(ax(4).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
set(ax(4).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',17);
xlabel('Longitude (^oE)','Fontname','Times New Roman','FontWeight','b','FontSize',22);
area(lon_for_bathy_nst4,-BATHY_nst4,max(mprs_nst4(:,1)),'Facecolor',[0.7 0.7 0.7],'EdgeColor','k','LineWidth',1.5);
hold off;










