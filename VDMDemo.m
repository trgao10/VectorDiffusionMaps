clearvars
close all
path(pathdef);
path(path, genpath([pwd '/utils/']));

%% set parameters
Nb = 8000;

%% generate 2-sphere data
rng('shuffle');
BaseManifold = randn(3, Nb);
norm_BM = sqrt(sum(BaseManifold.^2));
BaseManifold = BaseManifold * diag(1./norm_BM);

figure;scatter3(BaseManifold(1,:), BaseManifold(2,:), BaseManifold(3,:), 20, 'g', 'filled');
axis equal
set(gcf, 'ToolBar', 'none');
cameratoolbar;
cameratoolbar('SetCoordSys', 'none');

%% Diffusion Maps
dm.data 	   = BaseManifold;
dm.epsilon     = 0.1;
dm.NN    	   = 50;
dm.T     	   = 1;
dm.delta 	   = 0.7;
dm.symmetrize  = 1;
dm.embedmaxdim = 50;

[rsltDM] = DiffMap(dm);

%% Vector Diffusion Maps
vdm = dm;
vdm.embedmaxdim = 100;
vdm.debug = 1;
[rsltVDM] = VecDiffMap(vdm);


