% 3.1 instance of puma560
mdl_puma560;

% 3.2 dh
p560;

% 3.3 joint coord vec
qz = p560.qz;  % zero angle
qr = p560.qr;  % ready
qs = p560.qs;  % stretch
qn = p560.qn;  % nominal

% 3.4 tool transform
T_tool = SE3(0, 0, 0.2);  % 200mm extension in z-direction
p560.tool = T_tool;

% 3.5 fk
T_zero = p560.fkine(qz);
T_ready = p560.fkine(qr);
T_stretch = p560.fkine(qs);
T_nominal = p560.fkine(qn);

% 3.6 canonical config realistic plots
can_configs = {qz, qr, qs, qn};
can_configs_str = {'zero', 'ready', 'stretch', 'nominal'};
figure('Name', 'Canonical Configs', 'Position', [100, 100, 1200, 900]);

for i = 1:length(can_configs)
    subplot(2, 2, i)
    p560_config = SerialLink(p560, 'name', ['p560_', can_configs_str{i}]);
    p560_config.plot3d(can_configs{i})
    title(['configuration: ', can_configs_str{i}])
end

% inverse kinematics
% 3.7 reset the tool
p560.tool = SE3();  % reset to identity transform

% 3.8 ik for fk or nominal config
T_nominal = p560.fkine(qn);
q_inv = p560.ikine6s(T_nominal);
disp('inverse kinematics result:')
disp(q_inv)

% inverse kinematics experiment
% 3.9 correct arm geometry for nominal
configs = {'lu', 'ld', 'ru', 'rd'};
figure('Name', 'Arm Geometries', 'Position', [100, 100, 1200, 900]);

for i = 1:length(configs)
    q = p560.ikine6s(T_nominal, configs{i});
    
    % display the joint angles
    disp(['configuration: ', configs{i}])
    disp(q)

    subplot(2, 2, i)
    p560_config = SerialLink(p560, 'name', ['p560_', configs{i}]);
    p560_config.plot3d(q)
    
    title(['configuration: ', configs{i}])
end

% 3.10 unreachable test
T_unreachable = SE3(10, 0, 0);  % a point 10 meters away on x-axis
q_unreach = p560.ikine6s(T_unreachable);
disp('inverse kinematics for unreachable point:')
disp(q_unreach)

