% finds palm point
% there must be a method that finds the palm point
% send that along with background_removed to the following function

function returned = find_palm_point(image)

% figure; imshow(image); title('Click on center of palm');
% display('Click on the center of the palm');
% [x y] = ginput(1);

x = 260;
y = 236;

returned = [x y];

end