% finds wrist points
% largest distance between successive mask_points

function returned = find_wrist_points(palm_mask)

max = 0;
dist = 0;
point1 = zeros(1, 2);
point2 = zeros(1, 2);
wrist_points = zeros(2, 2);

for i = 1:length(palm_mask)
    if(i == length(palm_mask) )
        dist = (palm_mask(1, 1) - palm_mask(i, 1))^2 + ...
                (palm_mask(1, 2) - palm_mask(i, 2))^2;
        point2(1, 1) = palm_mask(1, 1);
        point2(1, 2) = palm_mask(1, 2);
    else
        dist = (palm_mask(i+1, 1) - palm_mask(i, 1))^2 + ...
                (palm_mask(i+1, 2) - palm_mask(i, 2))^2;
        point2(1, 1) = palm_mask(i+1, 1);
        point2(1, 2) = palm_mask(i+1, 2);
    end
    
    point1(1, 1) = palm_mask(i, 1);
    point1(1, 2) = palm_mask(i, 2);
    
    if( dist > max)
        max = dist;
        wrist_points(1, 1) = point1(1, 1);
        wrist_points(1, 2) = point1(1, 2);
        wrist_points(2, 1) = point2(1, 1);
        wrist_points(2, 2) = point2(1, 2);
    end
end

returned = zeros(2, 2);
returned = wrist_points;

end