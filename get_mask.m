% gets the palm mask

function returned = get_mask(hand, points)

x = zeros(length(points), 1);
y = zeros(length(points), 1);
x = points(:, 1);
y = points(:, 2);

palm = roipoly(hand, x, y); 

palm_removed = im2bw(hand - palm);

returned = palm_removed;
end