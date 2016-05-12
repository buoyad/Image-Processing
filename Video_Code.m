%% High Frame Rate
B = VideoReader('Bobs.mp4');
N = B.numberofframes;
T = B.duration;
Fs = (N/T);

FsL = Fs/4; % applying a lower sampling rate
Fsh = Fs*4.1; %applying a higher sampling rate

P = implay('Bobs.mp4'); %original video
highfs = implay('Bobs.mp4',Fsh); %plays at a higher frame rate

%%  Lower Frame Rate

P1 = implay('Bobs.mp4');
Lowfs = implay('Bobs.mp4',FsL);
    
    
    



