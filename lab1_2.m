% 3.6 visualize 3d coord frame 0
figure;
trplot(eye(3), 'frame', '0', 'color', 'black');
hold on;
axis([-1 2 -1 2 -1 2]);  % limit plot area for 3d
grid on;
view(3);

% 3.7 obtain another 3d coord frame {1}
R_x_15 = rotx(deg2rad(15));
R_y_25 = roty(deg2rad(25));
R_z_35 = rotz(deg2rad(35));

R_1_in_0 = R_z_35 * R_y_25 * R_x_15;  % combined rotation matrix
% sequentially animate to frame {1}
tranimate(eye(3), R_x_15, 'frame', '1', 'color', 'red', 'cleanup');  
tranimate(R_x_15, R_x_15 * R_y_25, 'frame', '1', 'color', 'blue', 'cleanup');
tranimate(R_x_15 * R_y_25, R_x_15 * R_y_25* R_z_35, 'frame', '1', 'color', 'red');

disp('R_1_in_0:');
disp(R_1_in_0);

%3.9
R = [0.8138 0.0400 0.5798;
     0.2962 0.8298 -0.4730;
    -0.5000 0.5567 0.6634];

[rpy_angles_R] = tr2rpy(R, 'zyx', 'deg');
fprintf('Roll: %.5f, Pitch: %.5f, Yaw: %.5f\n', rpy_angles_R(1), rpy_angles_R(2), rpy_angles_R(3));




rpy=[40,30,20];
fprintf('\n');
[Rotation_Matrix] = rpy2r(rpy,'deg');
%fprintf('Roll: %.2f, Pitch: %.2f, Yaw: %.2f\n', rpy_angles_R(1), rpy_angles_R(2), rpy_angles_R(3));
disp('Rotation Matrix:');
disp(Rotation_Matrix);