clc;
clear;
close all;
warning('off','all');
%% Create Database
% cam = webcam('USB Video Device');
% preview(cam);
% % for i=1
%     pause(5);
%     a = snapshot(cam);
% im = rgb2gray(a);
% im = imresize(im,[256 256]);
% figure,imshow(im),title('resized image')
% % imwrite(im,'database\14.jpg');
[filename,pathname] = uigetfile('database\*.jpg');
im = imread([pathname,filename]);
%%  Feature Extraction
% a = dir('database\*.jpg');
% feature = [];
% for i = 1:length(a)
%     a1 = a(i).name;
%     im = imread(fullfile('database\',a1));
% X = extractLBPFeatures(im);
X = extractHOGFeatures(im);
%     feature = [feature;X];
% end
% save('feature1','feature')
% load feature1.mat;
load feature.mat;
lab = [1,2,3,4,5,6,7,8,9,10,11,12,13,14];
inputs = feature';
targets = lab;
mdl = fitcknn(feature,lab);
y = predict(mdl,X);
ccf = 0;
    if y == 1
        ccf = 1;
        disp('Forward');
    elseif y == 2
        ccf = 2;
        disp('Backward');
    elseif y == 3
        ccf = 3;
        disp('Left Turn');
    elseif y == 4
        ccf = 4;
        disp('Right Turn');
    elseif y == 5
        ccf = 5;
        disp('Hospital Zone');
    elseif y == 6
        ccf = 6;
        disp('Speed Limit 60');
    elseif y == 7
        ccf = 7;
        disp('Men At Work');
    elseif y == 8
        ccf = 8;
        disp('Speed Limit 80');
    elseif y == 9
        ccf = 9;
        disp('Pedestrian Crossing');
    elseif y == 10
        ccf = 10;
        disp('Speed Break');
    elseif y == 11
        ccf = 11;
        disp('School Zone');
    elseif y == 12
        ccf = 12;
        disp('Speed Limit 100');
    elseif y == 13
        ccf = 13;
        disp('Stop');
    elseif y == 14
        ccf = 14;
        disp('Green');
    end
% Hardware implementation
% instrumentObjects=instrfind;  % don't pass it anything - find all of them.
% delete(instrumentObjects)
% a=serial('COM4','BaudRate',9600);
% fopen(a);
%     if ccf == 1
%         fwrite(a,'1');
%     elseif ccf == 2
%         fwrite(a,'2');
%     elseif ccf == 3
%         fwrite(a,'3');
%     elseif ccf == 4
%         fwrite(a,'4');
%     elseif ccf == 5
%         fwrite(a,'5');
%     elseif ccf == 6
%         fwrite(a,'6');
%     elseif ccf == 7
%         fwrite(a,'7');
%     elseif ccf == 8
%         fwrite(a,'8');
%     elseif ccf == 9
%         fwrite(a,'9');
%     elseif ccf == 9
%         fwrite(a,'A');
%     elseif ccf == 9
%         fwrite(a,'B');
%     elseif ccf == 9
%         fwrite(a,'C');
%     elseif ccf == 9
%         fwrite(a,'D');
%     elseif ccf == 9
%         fwrite(a,'E');
%     end
% fclose(a);
% close all;
% closePreview(cam);
% clear('cam');