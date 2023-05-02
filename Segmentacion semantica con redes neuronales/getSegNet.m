function net = getSegNet
% Copyright 2018-2021 The MathWorks, Inc.
% return a trained DAG network object for SegNet

pretrainedURL = 'https://www.mathworks.com/supportfiles/vision/data/segnetVGG16CamVid.mat';
pretrainedSegNet = 'segnetVGG16CamVid.mat';

if ~exist(pretrainedSegNet,'file')
    disp('Downloading pretrained SegNet (107 MB)...');
    websave(pretrainedSegNet,pretrainedURL);
end
segnet = load(pretrainedSegNet,'net');
net = segnet.net;
save('SegNet.mat','net');

end