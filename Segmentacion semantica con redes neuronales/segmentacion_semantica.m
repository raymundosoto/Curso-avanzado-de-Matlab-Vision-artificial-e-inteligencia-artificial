pretrainedURL = 'https://ssd.mathworks.com/supportfiles/vision/data/deeplabv3plusResnet18CamVid.zip';
pretrainedFolder = fullfile(tempdir,'pretrainedNetwork');
pretrainedNetworkZip = fullfile(pretrainedFolder,'deeplabv3plusResnet18CamVid.zip'); 
if ~exist(pretrainedNetworkZip,'file')
    mkdir(pretrainedFolder);
    disp('Downloading pretrained network (58 MB)...');
    websave(pretrainedNetworkZip,pretrainedURL);
end
unzip(pretrainedNetworkZip, pretrainedFolder)

pretrainedNetwork = fullfile(pretrainedFolder,'deeplabv3plusResnet18CamVid.mat');  
data = load(pretrainedNetwork);
%net = data.net;

classes = string(net.Layers(end).Classes)

I = imread('highway.png');

inputSize = net.Layers(1).InputSize;
I = imresize(I,inputSize(1:2));

C = semanticseg(I,net);


cmap = camvidColorMap;
B = labeloverlay(I,C,'Colormap',cmap,'Transparency',0.3);
figure
imshow(B)
pixelLabelColorbar(cmap, classes);
