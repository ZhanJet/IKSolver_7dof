%% Robot Model:7-DOF SRS,standard DH
d_bs = 0.3105;     % Kuka-LWR
d_se = 0.40;
d_ew = 0.39;
d_wt = 0.078;

% d_bs = 0.317;    % Paper Shimizu-2008
% d_se = 0.450;
% d_ew = 0.480;
% d_wt = 0.070;

r2d = 180/pi;
d2r = pi/180;
jnt_upper = [170, 120, 170, 120, 170, 120, 170]*d2r;
jnt_lower = -jnt_upper;
jnt_maxvel = [110, 110, 128, 128, 204, 184, 184]*d2r;
%            theta        d           a       alpha
links = [
            Link([0        d_bs      0      -pi/2])
            Link([0        0         0       pi/2])
            Link([0        d_se      0      -pi/2])
            Link([0        0         0       pi/2])
            Link([0        d_ew      0      -pi/2])
            Link([0        0         0       pi/2])
            Link([0        d_wt      0        0])
	];

iiwa=SerialLink(links, 'name', 'iiwa');
iiwa.plot([0 -45 0 45 0 -90 0]*d2r);
% iiwa.plot([0 -10 0 100 69 -10 -120]*d2r);
% iiwa.teach('callback',@(r,q) r.vellipse(q));

% qz = [0 0 0 0 0 0 0];
% iiwa.fkine(qz);