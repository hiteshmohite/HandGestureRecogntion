% finding palm mask
% find radius 1.2 times as radius
% sample points, go through theta 0 to 360 in steps of 10 maybe for now
% if 8 connected neighbors at that sampled pixel is b and w, add
% return this mask of points collected

function returned = find_palm_mask(image, radius, h, k)

new_radius = 1.5 * radius;

deg = 0;
matrix = zeros(3, 3);
palm_mask_points = zeros(1000, 2);
point_index = 1;
array = zeros(1, 3);
while deg <= 360
    
    theta = deg * 0.01745329251;
    x = h + ceil( new_radius * cos(theta) );
    y = k + ceil( new_radius * sin(theta) );
    
    array = impixel( image, x-1, y-1); matrix(1, 1) = array(1);
    array = impixel( image, x, y-1); matrix(1, 2) = array(1); 
    array = impixel( image, x+1, y-1); matrix(1, 3) = array(1);
    
    array = impixel( image, x-1, y); matrix(2, 1) = array(1);
    array = impixel( image, x, y); matrix(2, 2) = array(1);
    array = impixel( image, x+1, y); matrix(2, 3) = array(1);
    
    array = impixel( image, x-1, y+1); matrix(3, 1) = array(1);
    array = impixel( image, x, y+1); matrix(3, 2) = array(1);
    array = impixel( image, x+1, y+1); matrix(3, 3) = array(1);
    
    if( matrix(1, 1) == 0 || matrix(1, 2) == 0 || matrix(1, 3) == 0 || ...
        matrix(2, 1) == 0 || matrix(2, 3) == 0 || ...
        matrix(3, 1) == 0 || matrix(3, 2) == 0 || matrix(3, 3) == 0 )
        palm_mask_points(point_index, 1) = x;
        palm_mask_points(point_index, 2) = y;
        point_index = point_index + 1;
    end
    deg = deg + 10;
        
end

returned = zeros(point_index-1, 2);

for i = 1:point_index-1
    returned(i, 1) = palm_mask_points(i, 1);
    returned(i, 2) = palm_mask_points(i, 2);
end

end