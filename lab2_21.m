close all; 
clear all; 
figure;  
xlabel('x'); ylabel('y'); zlabel('z');   
trplot(eye(4),'color','b','frame','0','length',0.4,'thick',2);  
hold on; grid on; axis equal; 
axis([-2 2 0 2 0 3.5]); 
fill3([0 0 -1 -1],[1 2 2 1],[1 1 1 1],'g'); 
fill3([0 0 0 0 0 0 0 0],[1 1.1 1.1 1.9 1.9 2 2 1],[0 0 0.9 0.9 0 0 1 1],'g'); 
fill3([-1 -1 -1 -1 -1 -1 -1 -1],[1 1.1 1.1 1.9 1.9 2 2 1],[0 0 0.9 0.9 0 0 1 1],'g'); 
fill3([0 -0.1 -0.1 -0.9 -0.9 -1 -1 0],[2 2 2 2 2 2 2 2],[0 0 0.9 0.9 0 0 1 1],'g'); 
fill3([0 -0.1 -0.1 -0.9 -0.9 -1 -1 0],[1 1 1 1 1 1 1 1],[0 0 0.9 0.9 0 0 1 1],'g'); 
fill3([-0.4 -0.4 -0.6 -0.6],[1.4 1.6 1.6 1.4],[1 1 1 1],'r'); 
fill3([-0.4 -0.4 -0.6 -0.6],[1.4 1.6 1.6 1.4],[1.2 1.2 1.2 1.2],'r'); 
fill3([-0.4 -0.6 -0.6 -0.4],[1.6 1.6 1.6 1.6],[1 1 1.2 1.2],'r'); 
fill3([-0.4 -0.6 -0.6 -0.4],[1.4 1.4 1.4 1.4],[1 1 1.2 1.2],'r'); 
fill3([-0.4 -0.4 -0.4 -0.4],[1.4 1.6 1.6 1.4],[1 1 1.2 1.2],'r'); 
fill3([-0.6 -0.6 -0.6 -0.6],[1.4 1.6 1.6 1.4],[1 1 1.2 1.2],'r'); 
fill3([-0.4 -0.4 -0.6 -0.6],[1.4 1.6 1.6 1.4],[3 3 3 3],'b'); 
fill3([-0.4 -0.4 -0.6 -0.6],[1.4 1.6 1.6 1.4],[3.2 3.2 3.2 3.2],'b'); 
fill3([-0.4 -0.6 -0.6 -0.4],[1.6 1.6 1.6 1.6],[3 3 3.2 3.2],'b'); 
fill3([-0.4 -0.6 -0.6 -0.4],[1.4 1.4 1.4 1.4],[3 3 3.2 3.2],'b'); 
fill3([-0.4 -0.4 -0.4 -0.4],[1.4 1.6 1.6 1.4],[3 3 3.2 3.2],'b'); 
fill3([-0.6 -0.6 -0.6 -0.6],[1.4 1.6 1.6 1.4],[3 3 3.2 3.2],'b');


t0 = [0; 1; 1];  
R0 = [1 0 0; 
      0 1 0; 
      0 0 1];  

H_1_in_0 = rt2tr(R0, t0);  % H for frame {0} to frame {1}
trplot(H_1_in_0,'color','b','frame','1','length',0.4,'thick',2);
 
t1 = [-0.5; 0.5; 0];   
R1 = [1 0 0; 
      0 1 0; 
      0 0 1];

H_2_in_1 = rt2tr(R1, t1);  % H for frame {1} to frame {2}
H_2_in_0 = H_1_in_0*H_2_in_1;
trplot(H_2_in_0,'color','b','frame','2','length',0.4,'thick',2);

t2 = [0; 0; 2];  
R = [0 1  0; 
     1 0  0; 
     0 0 -1];

H_3_in_2 = rt2tr(R, t2);  % H for frame {2} to frame {3}
H_3_in_0 = H_1_in_0*H_2_in_1*H_3_in_2;
trplot(H_3_in_0,'color','r','frame','3','length',0.4,'thick',2);
