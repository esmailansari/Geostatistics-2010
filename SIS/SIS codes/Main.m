close all;clear all;clc;tic
%% These numbers are from the fitting variogram GUI. main directions are -20 and 70; 
sill_x = 3.8754;
sill_y= 3.876;
nugget_x = .70107; 
nugget_y= .38713;
R_x = 59.9668;    
R_y = 37.1256;

points_number = 4;   % note : this refers to number of nearest points to the target point that participate in kriging of that point.
                     
cut1=100;cut2=150;                      

global X_blocks Y_blocks k                    

X_blocks=100;         
Y_blocks=100;
total_nodes=X_blocks*Y_blocks;
k = (R_x/R_y)^2;               

%% insert known data here
Plane=ones(X_blocks,Y_blocks).*-1;
x=[3,4,5,10,13,14,15,15,16,17,18,18,18,19,20,24,25,26,29,29,31,31,31,32,32,34,37,37,39,39,40,40,41,41,41,42,42,44,45,46,47,47,48,49,51,51,52,54,55,56,59,60,60,61,61,61,61,61,62,62,63,63,63,65,65,67,68,69,70,71,71,72,73,74,75,76,76,77,77,79,79,80,80,82,84,84,87,87,88,89,91,92,93,95,95,95,95,96,98,98];
y=[75,56,70,64,51,17,32,37,92,82,41,62,96,80,34,27,97,95,82,86,5,31,98,52,98,39,14,88,11,55,43,80,15,87,91,22,58,95,43,91,18,86,43,8,42,79,94,24,97,29,52,14,94,22,22,29,57,100,42,44,45,53,73,42,80,60,15,43,66,7,35,97,86,45,17,47,69,30,96,61,68,33,80,98,25,78,25,38,61,94,80,92,87,7,24,61,83,62,35,81];
perm=[104,91,155,164,61,164,179,120,127,133,105,147,190,143,142,137,165,97,108,120,158,167,132,63,164,136,147,92,172,72,170,188,135,149,175,126,69,122,86,113,175,115,79,125,119,65,145,154,189,151,140,190,74,157,157,155,60,110,188,197,187,153,61,199,124,61,196,195,68,178,200,68,69,88,184,148,63,173,74,150,75,158,65,69,177,69,130,120,148,70,138,141,131,185,166,153,137,158,201,157];

%% making indicator vector
indicator=zeros(1,length(k));
indicator(perm<=cut1)=0;
indicator(perm<=cut2 & perm>cut1)=1;
indicator(perm>cut2)=2;

%%
known_num=length(indicator);
for i=1:known_num,Plane(x(i),y(i)) = indicator(i);end
[known_points_Ix known_points_Iy] = find(Plane~=-1); 

%%  variogram (zonal)=variogram(geometic)+variogram(vertical);
sigma =  @(h,h_y) ((sill_x -((sill_x-nugget_x)*(1.5*h/R_x-.5*(h/R_x).^3)+nugget_x)) .* (h<R_x) +...
               (sill_y -((sill_y-nugget_y)*(1.5*h_y/R_y-.5*(h_y/R_y).^3)+nugget_y)) .* (h<R_y));

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
    if Plane(kriging_point_index(1),kriging_point_index(2))~=-1
        continue
    end
    %% find the nearest points around our randomly selected point
    [h h_y H H_y known_perm] = select_points(Plane,kriging_point_index,points_number);
    
    %% calculations of the kriging
    kriging_matrix = sigma(h,h_y);
    kriging_vector = sigma(H,H_y);
    kriging_matrix = [kriging_matrix ones(points_number,1);[ones(1,points_number),0]];
    kriging_vector = [kriging_vector;1];
    weghits_vector = kriging_matrix^-1 * kriging_vector;
    landa = weghits_vector(1:points_number);
    mu = weghits_vector(end);
    
    %% using the CDF for our estimation
   P=zeros(1,3);
   P(2)=sum(landa(known_perm==1));
   P(3)=sum(landa(known_perm==2));
   P(1)=sum(landa(known_perm==0));
   P(P<0)=0;P=P/sum(P);
   F=rand(1);
    if F<P(1)
        simulated_point_porosity=0;
    elseif F>P(1) && F<(P(1)+P(2))
        simulated_point_porosity=1;
    else
        simulated_point_porosity=2;
    end
    
    %% assigning the calculated porosity to our grids
    Plane(kriging_point_index(1),kriging_point_index(2)) = simulated_point_porosity;    
    
end
disp('------------------------------')
toc
disp('------------------------------')

%% plot the indicator
a=[.7,.7,.7];b=[.9,.9,.9]; %these are for colors
figure('name','Original points')
plot(x(perm<=cut1),y(perm<=cut1),'sk','markerfacecolor','k');
hold on;
plot(x(perm<=cut2 & perm>cut1),y(perm<=cut2 & perm>cut1),'o','markeredgecolor',a,'markerfacecolor',a);
plot(x(perm>cut2),y(perm>cut2),'^r','markeredgecolor',b,'markerfacecolor','w');
legend('i = 0','i = 1','i = 2');title('plot of original points for the chosen cut off');xlabel('x');ylabel('y');
hold off;

%% plotting
x=[1:X_blocks];y=[1:Y_blocks];
[X Y]=meshgrid(x,y);
figure('name','SIS plot')
surf(X,Y,Plane')
view(0,90)
xlim([1 X_blocks]);ylim([1 Y_blocks]);
xlabel('X direction');ylabel('Y direction');title(' Sequential Indicator Simulation for Permeability');
colormap(bone)
colorbar
%% calculating the probability of each indicator
disp('probability of indicator before and after simulation');
Prob_OriginalData_0=numel(indicator(indicator==0))/numel(indicator)
Prob_OriginalData_1=numel(indicator(indicator==1))/numel(indicator)
Prob_OriginalData_2=numel(indicator(indicator==2))/numel(indicator)
disp('----------------------------')
Prob_simulation_0=numel(Plane(Plane==0))/numel(Plane)
Prob_simulation_1=numel(Plane(Plane==1))/numel(Plane)
Prob_simulation_2=numel(Plane(Plane==2))/numel(Plane)

