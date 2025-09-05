clc;clear all;close all;
cd('C:\Users\USER\OneDrive\Desktop\data\MJES\38_MJES_202111_Haeyang_ES\VMP\ku3_copy')

diss_KU_02 = quick_look('SNU_002.P',1,350); % 15:58 첫 VMP
diss_KU_03 = quick_look('SNU_003.P',1,350); % 16:44
diss_KU_04 = quick_look('SNU_005.P',1,350); % 17:25
diss_KU_05 = quick_look('SNU_007.P',1,350); % 18:16
diss_KU_06 = quick_look('SNU_010.P',1,350); % 19:19
diss_KU_07 = quick_look('SNU_011.P',1,350); % 20:16
diss_KU_08 = quick_look('SNU_013.P',1,350); % 21:19
diss_KU_09 = quick_look('SNU_014.P',1,350); % 22:18 (잠정 중단, 이 때 KU_09 CTD 했음)
diss_KU_19 = quick_look('SNU_015.P',1,350); % 08:18 (KU_19 CTD 했음)
diss_KU_20 = quick_look('SNU_016.P',1,350); % 09:17
diss_KU_21 = quick_look('SNU_017.P',1,350); % 10:21
diss_KU_22 = quick_look('SNU_018.P',1,350); % 11:29
diss_KU_23 = quick_look('SNU_019.P',1,350); % 12:13
diss_KU_24 = quick_look('SNU_020.P',1,350); % 13:17
close all;

% Take TDR variables
e1_KU_02 = diss_KU_02.e(1,:);
e2_KU_02 = diss_KU_02.e(2,:);
e1_KU_03 = diss_KU_03.e(1,:);
e2_KU_03 = diss_KU_03.e(2,:);
e1_KU_04 = diss_KU_04.e(1,:);
e2_KU_04 = diss_KU_04.e(2,:);

e1_KU_05 = diss_KU_05.e(1,:);
e2_KU_05 = diss_KU_05.e(2,:);
e1_KU_06 = diss_KU_06.e(1,:);
e2_KU_06 = diss_KU_06.e(2,:);

e1_KU_07 = diss_KU_07.e(1,:);
e2_KU_07 = diss_KU_07.e(2,:);
e1_KU_08 = diss_KU_08.e(1,:);
e2_KU_08 = diss_KU_08.e(2,:);
e1_KU_09 = diss_KU_09.e(1,:);
e2_KU_09 = diss_KU_09.e(2,:);

e1_KU_19 = diss_KU_19.e(1,:);
e2_KU_19 = diss_KU_19.e(2,:);
e1_KU_20 = diss_KU_20.e(1,:);
e2_KU_20 = diss_KU_20.e(2,:);
e1_KU_21 = diss_KU_21.e(1,:);
e2_KU_21 = diss_KU_21.e(2,:);
e1_KU_22 = diss_KU_22.e(1,:);
e2_KU_22 = diss_KU_22.e(2,:);
e1_KU_23 = diss_KU_23.e(1,:);
e2_KU_23 = diss_KU_23.e(2,:);
e1_KU_24 = diss_KU_24.e(1,:);
e2_KU_24 = diss_KU_24.e(2,:);

TDR_KU_e1 = nan(55,24);
TDR_KU_e1(1:length(e1_KU_02),2) = e1_KU_02;
TDR_KU_e1(1:length(e1_KU_03),3) = e1_KU_03;
TDR_KU_e1(1:length(e1_KU_04),4) = e1_KU_04;
TDR_KU_e1(1:length(e1_KU_05),5) = e1_KU_05;
TDR_KU_e1(1:length(e1_KU_06),6) = e1_KU_06;
TDR_KU_e1(1:length(e1_KU_07),7) = e1_KU_07;
TDR_KU_e1(1:length(e1_KU_08),8) = e1_KU_08;
TDR_KU_e1(1:length(e1_KU_09),9) = e1_KU_09;

TDR_KU_e1(1:length(e1_KU_19),19) = e1_KU_19;
TDR_KU_e1(1:length(e1_KU_20),20) = e1_KU_20;
TDR_KU_e1(1:length(e1_KU_21),21) = e1_KU_21;
TDR_KU_e1(1:length(e1_KU_22),22) = e1_KU_22;
TDR_KU_e1(1:length(e1_KU_23),23) = e1_KU_23;
TDR_KU_e1(1:length(e1_KU_24),24) = e1_KU_24;

TDR_KU_e2 = nan(55,24);
TDR_KU_e2(1:length(e1_KU_02),2) = e1_KU_02;
TDR_KU_e2(1:length(e1_KU_03),3) = e1_KU_03;
TDR_KU_e2(1:length(e1_KU_04),4) = e1_KU_04;
TDR_KU_e2(1:length(e1_KU_05),5) = e1_KU_05;
TDR_KU_e2(1:length(e1_KU_06),6) = e1_KU_06;
TDR_KU_e2(1:length(e1_KU_07),7) = e1_KU_07;
TDR_KU_e2(1:length(e1_KU_08),8) = e1_KU_08;
TDR_KU_e2(1:length(e1_KU_09),9) = e1_KU_09;

TDR_KU_e2(1:length(e1_KU_19),19) = e1_KU_19;
TDR_KU_e2(1:length(e1_KU_20),20) = e1_KU_20;
TDR_KU_e2(1:length(e1_KU_21),21) = e1_KU_21;
TDR_KU_e2(1:length(e1_KU_22),22) = e1_KU_22;
TDR_KU_e2(1:length(e1_KU_23),23) = e1_KU_23;
TDR_KU_e2(1:length(e1_KU_24),24) = e1_KU_24;

[mmTime_KU mmprs_KU] = meshgrid(Time_cllcted,diss_KU_04.P); %arbitrary chosen

figure;hold on;set(gcf,'position',[252 42 1271 954]);
ax(1) = subplot(2,1,1);
pcolor(mmTime_KU,mmprs_KU,TDR_KU_e1);shading interp;hold on;
colormap('jet');
set(gca,'YDir','reverse');
caxis([0.0000000 0.0000002]);
% [c1 h1] = contour(mmTime_KU,mmprs_KU,TDR_KU_e1,[0:1:2],'-w','LabelSpacing',1000,'LineWidth',1.5);
% clabel(c1,h1,'color','w','FontName','Times New Roman','FontWeight','b','FontSize',15);
xline(Time_cllcted,':k','LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',15);
xtickformat('%.2f');
ylim([0 250]);
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 20;h.Ruler.TickLabelFormat = '%.1f';
title(h,'W kg^{-1}','Fontname','Times New Roman','fontweight','b','FontSize',11);
title('TDR','Fontname','Times New Roman','FontWeight','b','FontSize',30);
set(ax(1).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',20);
set(ax(1).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',20);
datetick('x','hh');
xlim([Time_cllcted(1) Time_cllcted(end)]);
xtickangle(0);
xlabel('Time (hr)','Fontname','Times New Roman','FontWeight','b','FontSize',25);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',25);
hold off;

ax(2) = subplot(2,1,2);
pcolor(mmTime_KU,mmprs_KU,TDR_KU_e2);shading interp;hold on;
colormap('jet');
set(gca,'YDir','reverse');
caxis([0.0000000 0.0000002]);
% [c1 h1] = contour(mmTime_KU,mmprs_KU,TDR_KU_e1,[0:1:2],'-w','LabelSpacing',1000,'LineWidth',1.5);
% clabel(c1,h1,'color','w','FontName','Times New Roman','FontWeight','b','FontSize',15);
xline(Time_cllcted,':k','LineWidth',.5, 'LabelVerticalAlignment','bottom', ...
    'LabelHorizontalAlignment','center','FontWeight','b','Fontname','Times New Roman','FontSize',15);
xtickformat('%.2f');
ylim([0 250]);
h = colorbar; h.FontWeight = 'b';h.FontName = 'Times New Roman';h.FontSize = 20;h.Ruler.TickLabelFormat = '%.1f';
title(h,'W kg^{-1}','Fontname','Times New Roman','fontweight','b','FontSize',11);
title('TDR2','Fontname','Times New Roman','FontWeight','b','FontSize',30);
set(ax(2).XAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',20);
set(ax(2).YAxis,'Fontname','Times New Roman','FontWeight','b','FontSize',20);
datetick('x','hh');
xlim([Time_cllcted(1) Time_cllcted(end)]);
xtickangle(0);
xlabel('Time (hr)','Fontname','Times New Roman','FontWeight','b','FontSize',25);
ylabel('Pressure (db)','Fontname','Times New Roman','FontWeight','b','FontSize',25);
hold off;

% Interpolate for K
rdd_diss_NST1_3 = round(diss_KU_3.P);
newgrid_diss_NST1_3 = rdd_diss_NST1_3(1):1:rdd_diss_NST1_3(end);
intrplted_e1_NST1_3 = interp1(rdd_diss_NST1_3,e1_KU_02',newgrid_diss_NST1_3');
intrplted_e2_NST1_3 = interp1(rdd_diss_NST1_3,e2_KU_02',newgrid_diss_NST1_3');

rdd_diss_NST1_4 = round(diss_KU_4.P);
newgrid_diss_NST1_4 = rdd_diss_NST1_4(1):1:rdd_diss_NST1_4(end);
intrplted_e1_NST1_4 = interp1(rdd_diss_NST1_4,e1_KU_03',newgrid_diss_NST1_4');
intrplted_e2_NST1_4 = interp1(rdd_diss_NST1_4,e2_KU_03',newgrid_diss_NST1_4');

rdd_diss_NST1_5 = round(diss_KU_5.P);
newgrid_diss_NST1_5 = rdd_diss_NST1_5(1):1:rdd_diss_NST1_5(end);
intrplted_e1_NST1_5 = interp1(rdd_diss_NST1_5,e1_KU_04',newgrid_diss_NST1_5');
intrplted_e2_NST1_5 = interp1(rdd_diss_NST1_5,e2_KU_04',newgrid_diss_NST1_5');

rdd_diss_NST2_4 = round(diss_KU_4.P);
newgrid_diss_NST2_4 = rdd_diss_NST2_4(1):1:rdd_diss_NST2_4(end);
intrplted_e1_NST2_4 = interp1(rdd_diss_NST2_4,e1_KU_09',newgrid_diss_NST2_4');
intrplted_e2_NST2_4 = interp1(rdd_diss_NST2_4,e2_KU_09',newgrid_diss_NST2_4');

rdd_diss_NST2_5 = round(diss_KU_5.P);
newgrid_diss_NST2_5 = rdd_diss_NST2_5(1):1:rdd_diss_NST2_5(end);
intrplted_e1_NST2_5 = interp1(rdd_diss_NST2_5,e1_KU_06',newgrid_diss_NST2_5');
intrplted_e2_NST2_5 = interp1(rdd_diss_NST2_5,e2_KU_06',newgrid_diss_NST2_5');

rdd_diss_NST3_2 = round(diss_KU_2.P);
newgrid_diss_NST3_2 = rdd_diss_NST3_2(1):1:rdd_diss_NST3_2(end);
intrplted_e1_NST3_2 = interp1(rdd_diss_NST3_2,e1_KU_07',newgrid_diss_NST3_2');
intrplted_e2_NST3_2 = interp1(rdd_diss_NST3_2,e2_KU_07',newgrid_diss_NST3_2');

rdd_diss_NST3_3 = round(diss_KU_3.P);
newgrid_diss_NST3_3 = rdd_diss_NST3_3(1):1:rdd_diss_NST3_3(end);
intrplted_e1_NST3_3 = interp1(rdd_diss_NST3_3,e1_KU_08',newgrid_diss_NST3_3');
intrplted_e2_NST3_3 = interp1(rdd_diss_NST3_3,e2_KU_08',newgrid_diss_NST3_3');

rdd_diss_NST3_4 = round(diss_KU_4.P);
newgrid_diss_NST3_4 = rdd_diss_NST3_4(1):1:rdd_diss_NST3_4(end);
intrplted_e1_NST3_4 = interp1(rdd_diss_NST3_4,e1_KU_09',newgrid_diss_NST3_4');
intrplted_e2_NST3_4 = interp1(rdd_diss_NST3_4,e2_KU_09',newgrid_diss_NST3_4');

rdd_diss_NST3_5 = round(diss_KU_5.P);
newgrid_diss_NST3_5 = rdd_diss_NST3_5(1):1:rdd_diss_NST3_5(end);
intrplted_e1_NST3_5 = interp1(rdd_diss_NST3_5,e1_KU_06',newgrid_diss_NST3_5');
intrplted_e2_NST3_5 = interp1(rdd_diss_NST3_5,e2_KU_06',newgrid_diss_NST3_5');

rdd_diss_NST4_2 = round(diss_KU_2.P);
newgrid_diss_NST4_2 = rdd_diss_NST4_2(1):1:rdd_diss_NST4_2(end);
intrplted_e1_NST4_2 = interp1(rdd_diss_NST4_2,e1_KU_2',newgrid_diss_NST4_2');
intrplted_e2_NST4_2 = interp1(rdd_diss_NST4_2,e2_KU_20',newgrid_diss_NST4_2');

rdd_diss_NST4_3 = round(diss_KU_3.P);
newgrid_diss_NST4_3 = rdd_diss_NST4_3(1):1:rdd_diss_NST4_3(end);
intrplted_e1_NST4_3 = interp1(rdd_diss_NST4_3,e1_KU_21',newgrid_diss_NST4_3');
intrplted_e2_NST4_3 = interp1(rdd_diss_NST4_3,e2_KU_21',newgrid_diss_NST4_3');

rdd_diss_NST4_4 = round(diss_KU_4.P);
newgrid_diss_NST4_4 = rdd_diss_NST4_4(1):1:rdd_diss_NST4_4(end);
intrplted_e1_NST4_4 = interp1(rdd_diss_NST4_4,e1_KU_22',newgrid_diss_NST4_4');
intrplted_e2_NST4_4 = interp1(rdd_diss_NST4_4,e2_KU_22',newgrid_diss_NST4_4');

rdd_diss_NST4_5 = round(diss_KU_5.P);
newgrid_diss_NST4_5 = rdd_diss_NST4_5(1):1:rdd_diss_NST4_5(end);
intrplted_e1_NST4_5 = interp1(rdd_diss_NST4_5,e1_KU_23',newgrid_diss_NST4_5');
intrplted_e2_NST4_5 = interp1(rdd_diss_NST4_5,e2_KU_23',newgrid_diss_NST4_5');
