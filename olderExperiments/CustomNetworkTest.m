clc
clear all
x=[1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20;];
t=[2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20; 21;];
net = network;
net.numInputs = 1;
net.numLayers = 1;

net.layers{1}.size = 10;
net.layers{1}.transferFcn = 'tansig';
net.layers{1}.initFcn = 'initnw';

net.performFcn = 'mse';
net.trainFcn = 'trainlm';
net.divideFcn = 'dividerand';
net.initFcn = 'initlay';
net.trainParam.epochs=500;
%net = train(net,x,t);
'done'
net.outputs