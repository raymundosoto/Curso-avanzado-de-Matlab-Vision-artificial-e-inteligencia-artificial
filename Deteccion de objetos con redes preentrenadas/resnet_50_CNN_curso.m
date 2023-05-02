clear all
close all
%net = resnet50(); 
net = googlenet();
c = net.Layers(end).ClassNames;

I = imread('auto.jpg'); 
figure(1)
imshow(I)
sz = net.Layers(1).InputSize
I = imresize(I, [sz(1),sz(2)]);
label = classify(net, I)
figure(2) 
imshow(I) 
text(10,20,char(label),'Color','white')


