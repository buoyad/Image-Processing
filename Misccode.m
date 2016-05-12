% Showing how image matrixes work
% Daniel Ayoub, Wayne (Wanshu) Sun, Alexi Varughese
% DSP Project

%% Assigned Values 3x3 RGB matrix
R = [100 120 50; 30 90 200; 7 9 12]./250;
G = [10 60 120; 220 77 99; 82 5 29]./250;
B = [70 80 90; 30 20 10; 60 90 199]./250;
pic = cat(3,R,G,B);

%% Random matrix 3x3 of RGB
R1 = rand(3);
G1 = rand(3);
B1 = rand(3);
pic1 = cat(3,R1,G1,B1);

%% random Matrix 3x3 of RGB
R2 = rand(3);
G2 = rand(3);
B2 = rand(3);
pic2 = cat(3,R2,G2,B2);

%% Random Matrix 3x3 of RGB
R3 = rand(3);
G3 = rand(3);
B3 = rand(3);
pic3 = cat(3,R3,G3,B3);

%% Plotting, showing differences of four-variations of colors
figure
subplot(2,2,1)
image(pic)
axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
subplot(2,2,2)
image(pic1)
axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
subplot(2,2,3)
image(pic2)
axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
subplot(2,2,4)
image(pic3)
axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);