% 2d coordinate frame
figure;
trplot2(eye(3), 'frame', '0', 'color', 'black');
hold on;
axis([-4 7 -2 7]); % range
grid on;

% 3.1 point [5 6] in fram {0}
p_in_0 = [5; 6];
plot_arrow([0 0], p_in_0, 'b');  % blue arrow for p

% 3.2 rotate frame {0} counter clockwise by 45deg
R_1_in_0 = rot2(deg2rad(45));  
T1 = [R_1_in_0 [0; 0]; 0 0 1];
tranimate2(eye(3), T1, 'frame', '1', 'color', 'red');

p_in_1 = R_1_in_0* p_in_0;  % coordinates of p in frame {1}
disp('coordinates of p in frame {1}:');
disp(p_in_1);

% q [-3 2] in fram {1}
q = R_1_in_0 * [-3; 2];
plot_arrow([0 0], q, 'r');  % red arrow from origin to point q

R_68 = rot2(deg2rad(68));  % rotation matrix for 68 degrees
r = R_68 * p_in_0;  % r
plot_arrow([0 0], r', 'g'); % green arrow from origin to point r