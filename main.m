%%%%%%%%%%
%   332:346 Digital Signal Processing Spring 2016
%   Prof. Waheed Bajwa
%   Term Project - Image Processing
%   DA/AV/WS
%%%%%%%%%%

img = imread('guineapig.jpg');

% Channels convolved using conv2 function - 10px blur
figure;
f = 1/100 .* ones(10,10);
img_lp10 = convimg(img, f);
image(img_lp10); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('2-D convolution with 10x10 Moving Average Filter');

figure;
subplot(1, 2, 1);
h = [1 1 1; 0 0 0; -1 -1 -1];
img_edgeconv = convimg(img, h);
img_edgecorr = corrimg(img, h);
% Display convolved image
image(img_edgeconv); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('2-D Edge detect filter convolved with image');
subplot(1, 2, 2);
% Display correlated image
image(img_edgecorr); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('2-D Edge detect filter correlated with image');

%% 2-D Low-pass filter

figure;
title('blur'); 
subplot(2, 3, 1);
image(img); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('Original');

% 5px 2-D blur
f = 1/25 .* ones(5, 5);
img_lp5 = imfilter(img, f, 'replicate');
subplot(2, 3, 2);
image(img_lp5); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('5x5px Blur');

% 20px 2-D blur
f = 1/400 .* ones(20, 20);
img_lp20 = imfilter(img, f, 'replicate');
subplot(2, 3, 3);
image(img_lp20); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('20x20px Blur');

% 100px 2-D blur
f = 1/10000 .* ones(100, 100);
img_lp100 = imfilter(img, f, 'replicate');
subplot(2, 3, 4);
image(img_lp100); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('100x100px Blur');

% 5x20px 2-D blur
f = 1/100 .* ones(5, 20);
img_lp5x20 = imfilter(img, f, 'replicate');
subplot(2, 3, 5);
image(img_lp5x20); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('5x20px Blur');

% 1x50px 2-D blur
f = 1/50 .* ones(1, 50);
img_lp1x50 = imfilter(img, f, 'replicate');
subplot(2, 3, 6);
image(img_lp1x50); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('1x50px Blur');
%% Filter Examples

emboss = [-2 1 0; -1 1 1; 0 1 2];
edgedetect = [0 1 0;1 -4 1;0 1 0];
edgeenhance = [0 0 0; -1 1 0; 0 0 0];
sharpen = [0 0 0 0 0; 0 0 -1 0 0; 0 -1 5 -1 0; 0 0 -1 0 0; 0 0 0 0 0];

Hem = imfilter(img,emboss,'replicate');
Hed = imfilter(img,edgedetect,'replicate');
Hedg = imfilter(img,edgeenhance,'replicate');
Hsharp = imfilter(img, sharpen, 'replicate');

figure
subplot(2,2,1)
image(Hem)
axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('Embossing');

subplot(2,2,2)
image(Hed)
axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('Edge Detection');

subplot(2,2,3)
image(Hedg+img)
axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('Edge Enhancement');

subplot(2,2,4)
image(Hsharp)
axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('Sharpening');

%% Unsharp masking
img = imread('eye.jpg');
unsharp = [0 -1 0; -1 4 -1; 0 -1 0];
sharp = [0 -1 0; -1 5 -1; 0 -1 0];
subplot(2, 2, 1);
imshow(img);
title('Original Image')
subplot(2, 2, 2);
img_sharpened = corrimg(img, sharp);
imshow(img_sharpened);
title('Sharpening Filter');
subplot(2, 2, 3);
imshow(corrimg(img, unsharp));
title('Unsharp Mask');
img_mask = corrimg(img, unsharp);
unsharp = [0 0 0; 0 1 0; 0 0 0] - fspecial('gaussian');
subplot(2, 2, 4);
img_mask2 = img_mask(2:184, 2:251, 1:3);
img_unsharp = img + img_mask2;
imshow(img_unsharp);
title('Unsharp mask + original image');