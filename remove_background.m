% removes background and produces a 200x200 binary image

function returned = remove_background(filename)

image = im2double( imread(filename) );
figure; imshow(image); title('Original Image');

image_hsv = rgb2hsv(image);

threshold = 0.5;
image_comp = imcomplement(image_hsv(:, :, 1));
image_fg = im2bw(image_comp, threshold);

returned = imfill(image_fg, 'holes');

% convert to 200x200 to make image scale invariant (not needed)

end