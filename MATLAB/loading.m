% load data
load("../data/connectomes.mat")
load("../data/tmvb.mat")
load("../data/dstpax.mat")

pax = Paxinos_SC;
ion = MBMv4_SC;
tvb = TVB_SC;

gpax = Paxinos_FC;
gion = MBMv4_FC;

clear MBMv4_SC;
clear MBMv4_FC;
clear Paxinos_SC;
clear Paxinos_FC;
clear TVB_SC;

bmvb = reshape(h5read('../data/bmvb.h5', '/data'), [76, 1024]);
bmvb = {1000/1024:1000/1024:1000, bmvb, 'bold signal of raw_mvb', 1000/1024, 1024};
