close all;clear all;clc;tic
%% set your condition here

sill = 1;
nugget = 0.1; 
R_x = 2.5*10^3/60; R_y = .6*10^3/60; % the units are converted to blocks.
 
points_number = 12;   % note : this refers to number of nearest points to the target point that participate in kriging of that point.
                      % more explanation in the report
global X_blocks Y_blocks k                    

X_blocks=100;         
Y_blocks=100;
total_nodes=X_blocks*Y_blocks;
k = (R_x/R_y)^2;

%% insert known data here
Plane=zeros(X_blocks,Y_blocks);
Plane(1,5) = 17;Plane(2,80) = 12;Plane(5,30) = 13;Plane(6,2) = 19;
Plane(10,32) = 21;Plane(15,86) = 28;Plane(20,12) = 12;Plane(27,90) = 10;
Plane(31,26) = 14;Plane(32,47) = 22;Plane(39,79) = 11;Plane(43,22) = 29;
Plane(51,1) = 30;Plane(59,29) = 15;Plane(62,95) = 17;Plane(64,44) = 13;
Plane(36,67) = 17;Plane(81,31) = 24;Plane(85,47) = 28;Plane(93,55) = 20;
[known_points_Ix known_points_Iy]=find(Plane~=0); % this line is just for plotting the known data.

%% to see the how normal the known data are enable this.
%   normplot(Plane(Plane~=0))

%%  covaiance(h) = variance - variogram 
sigma =  @(h) ((sill -((sill-nugget)*(1.5*h/R_x-.5*(h/R_x).^3)+nugget)) .* (h<R_x));

%% labeling the points with their turns (for setting the random path)
point_turn = randperm(total_nodes);
point_turn = reshape(point_turn,X_blocks,Y_blocks);

%% labeling all the points by they turn 
point_index = zeros(X_blocks*Y_blocks,2);
for i=1:X_blocks
    for j=1:Y_blocks        
        point_index(point_turn(i,j),:)=[i,j];   
    end
end

%% here we krige points that are unknown.
for i=1:total_nodes
    kriging_point_index = point_index(i,:);
    if Plane(kriging_point_index(1),kriging_point_index(2))~=0
        continue
    end
    %% find the nearest points around our randomly selected point
    [h H PorosityOfSelectedPoints] = select_points(Plane,kriging_point_index,points_number);
    
    %% calculations of the kriging
    kriging_matrix = sigma(h);
    kriging_vector = sigma(H);
    kriging_matrix = [kriging_matrix ones(points_number,1);[ones(1,points_number),0]];
    kriging_vector = [kriging_vector;1];
    weghits_vector = kriging_matrix^-1 * kriging_vector;
    landa = weghits_vector(1:points_number);
    mu = weghits_vector(end);
    
    %% using the CDF for our estimation
    Gaussian_mean = PorosityOfSelectedPoints * landa;
    variance = kriging_matrix(1,1);
    OK_variance = variance-sum(kriging_vector(1:end-1).*landa)-mu;
    Fz = rand(1);
    Z = -sqrt(2) * erfinv (1-2*Fz);
    simulated_point_porosity = (OK_variance)^.5*Z+Gaussian_mean;
    %% this line is for kriging; enable it if you want to get kriging map.
    %simulated_point_porosity = PorosityOfSelectedPoints * landa;    
    %% assigning the calculated porosity to our grids
    Plane(kriging_point_index(1),kriging_point_index(2)) = simulated_point_porosity;    
    
end
disp('------------------------------')
toc
disp('------------------------------')

%% plotting
x=[1:X_blocks];y=[1:Y_blocks];
[X Y]=meshgrid(x,y);
figure('name','3D')
surf(X,Y,Plane');xlabel('X direction');ylabel('Y direction');zlabel('Porosity');
colorbar
figure('name','upper view')
surf(X,Y,Plane')
view(0,90)
xlim([1 X_blocks]);ylim([1 Y_blocks]);
xlabel('X direction');ylabel('Y direction');title(' Sequential Gaussian Simulation for Porosity');
colorbar
figure('name','contour map')
plot(known_points_Ix,known_points_Iy,'ob','markerfacecolor','b');
hold on;
[c,h]=contour(X,Y,Plane',[10:30]);
contour_handle=clabel(c,h);
set(contour_handle,'fontsize',7)
xlabel('X direction');ylabel('Y direction');title('Changing trend of porosity');
legend('known Points');
grid on;
hold off;
%% normal plot(to see how normal final points are you can enable this)
%   normplot(Plane(:))