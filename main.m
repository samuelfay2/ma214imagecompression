%% Dumb Algorithm
snowflakes = imread('Snowflakes.jpg');
people = imread('adamAndSam.jpg');
snowflakesUint16 = uint16(snowflakes);
peopleUint16 = uint16(people);
% compressed = DumbCompression(snowflakesUint16, 16, false);
compressed = DumbCompression(peopleUint16, 4, false);
size(people)
size(compressed)
figure;
% subplot(1,2,1), imshow(snowflakes)
subplot(1,2,1), imshow(people)
subplot(1,2,2), imshow(compressed)
% mean(snowflakes)
%max(snowflakes)

%% DCT RGB
people= imread('adamAndSam.jpg');
% people = people(1:1256,:,:);
people = im2double(people);
r = EasyDct(people(:,:,1));
g = EasyDct(people(:,:,2));
b = EasyDct(people(:,:  ,3));
compressed = cat(3,r,g,b);
figure;
% subplot(1,2,1), imshow(snowflakes)
subplot(1,2,1), imshow(people)
subplot(1,2,2), imshow(compressed)

%% DCT YCbCr
people= imread('adamAndSam.jpg');
people = rgb2ycbcr(people);
people = im2double(people);
r = EasyDct(people(:,:,1));
g = EasyDct(people(:,:,2));
b = EasyDct(people(:,:,3));
compressed = cat(3,r,g,b);
compressed2 = cat(3,people(:,:,1),g,b);
compressed = ycbcr2rgb(compressed);
compressed2 = ycbcr2rgb(compressed2);

figure;
% subplot(1,2,1), imshow(snowflakes)
subplot(1,2,1), imshow(compressed)
subplot(1,2,2), imshow(compressed2)

%% Advanced version
people= imread('adamAndSam.jpg');
people = rgb2ycbcr(people);
people = im2double(people);
r = EasyDct(people(:,:,1));
g = DumbCompression(people(:,:,2), 4, true);
b = DumbCompression(people(:,:,3), 4, true);        

rSize = size(r);
compressed = cat(3,r,g,b);
compressed = ycbcr2rgb(compressed);
people = ycbcr2rgb(people);

figure;
% subplot(1,2,1), imshow(snowflakes)
subplot(1,2,1), imshow(people)
subplot(1,2,2), imshow(compressed)
