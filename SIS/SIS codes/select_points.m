%% finding points around the Kriging point
function [h h_y H H_y PorosityOfSelectedPoints]=select_points(Plane,kriging_point_index,points_number)
    
    global X_blocks Y_blocks k   % k will be used for finding the h.
    
    h = zeros(points_number);H = zeros(points_number,1);PorosityOfSelectedPoints = zeros(1,points_number);
    h_y = zeros(points_number);H_y = zeros(points_number,1);
    distance_matrix = zeros(X_blocks,Y_blocks);
    
   %% for all the grids that are nonzero, find there distances to the
    % target node 
     A=10^10; % a far distant to the 
     
    [IX_BLOCKS IY_BLOCKS]=meshgrid((1:X_blocks),(1:Y_blocks));
    %% this part has been optimized by profiling.
    distance_matrix = ((IY_BLOCKS-kriging_point_index(1)).^2+(IX_BLOCKS-kriging_point_index(2)).^2).^.5 .* (Plane ~= -1) + A .* (Plane == -1);

    %% here we sort all the distances to select the nearest points to our
    % target point, ( number of nearest points = points_number).
    [dummy sorted_index] = sort(distance_matrix(:));
    sorted_index = sorted_index(1:points_number);
    x_index = mod(sorted_index,X_blocks); x_index(x_index==0) = 100;
    y_index = floor((sorted_index-1)/X_blocks); y_index = y_index+1;
    x_length=length(x_index);
    
    %% the distances to the target node will be set here by equation
    %           *** h = ( h_x ^ 2 +  k * h_y ^ 2 ) ^ (1/2) ***
    
    for i=1:x_length
        PorosityOfSelectedPoints(i) = Plane(x_index(i),y_index(i));
        H(i) = ((x_index(i)-kriging_point_index(1))^2+ k * (y_index(i)-kriging_point_index(2))^2)^.5;
        H_y(i)= (y_index(i)-kriging_point_index(2));
    end
    for i=1:x_length
        for j=1:x_length
            h(i,j) = ((x_index(i)-x_index(j))^2 +  k * (y_index(i)-y_index(j))^2)^.5;
            h_y(i,j)=(y_index(i)-y_index(j));
        end
    end    