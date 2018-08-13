% rotate and cut hand image

function returned = rotate_and_cut(image, center, wrist)

% just cut
part = image;
part(1:wrist(1,2), :) = 0;

cut = im2bw(image - part);
returned = cut;

end