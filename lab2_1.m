% frame {0}
figure;
trplot(eye(4), 'frame', '0', 'color', 'b', 'axis', [0 4 0 4 0 3]);
grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');
title('3D Coordinate Frame {0}');
hold on;

% 3.2
R_1_in_0 = rotz(90, "deg");
t_1_in_0 = [2; 3; 1];
disp("Rotation Matrix: ");
disp(R_1_in_0);
disp("Translation matrix: ");
disp(t_1_in_0);

% 3.3
plot_arrow([0 0 0]', t_1_in_0,'b');

% 3.4
H_1_in_0 = rt2tr(R_1_in_0,t_1_in_0);
trplot(H_1_in_0, 'frame', '1', 'color', 'r');
disp('H_1_in_0 :');
disp(H_1_in_0);

% 3.5
p_in_1 = [1; 1; 1];
p_in_0 = (R_1_in_0) * p_in_1 + (t_1_in_0);
disp(p_in_0);
plot_arrow([0 0 0]', p_in_0 , 'g');

% 3.6
plot_arrow(t_1_in_0,p_in_0,'r');

% 3.7:frame {1} 
figure;
T = eye(4);
trplot(T, 'frame', '1', 'color', 'r', 'axis', [-4 2 -1 3 -2 2]);
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
title('3D Coordinate Frame {1}');
hold on;

% 3.8
H_0_in_1 = inv(H_1_in_0);
disp('H_0_in_1 :');
disp(H_0_in_1);


% 3.9
trplot(H_0_in_1,'frame','0','color','b');

% 3.10
[R_0_in_1, t_0_in_1] = tr2rt(H_0_in_1 );
disp('t_0_in_1 :');
disp(t_0_in_1);
plot_arrow([0 0 0]', t_0_in_1,'b');

% 3.11
p_in_1 = [1; 1; 1];
plot_arrow([0 0 0], p_in_1, 'r');
plot_arrow(p_in_1,t_0_in_1,'g');

