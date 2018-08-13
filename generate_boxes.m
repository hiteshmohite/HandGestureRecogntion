% make bounding boxes

function boxes = generate_boxes(fingers)

cc = bwconncomp(fingers);
labeled = labelmatrix(cc);
RGB_label = label2rgb(labeled, @copper, 'c', 'shuffle');
imshow(RGB_label,'InitialMagnification','fit')

st = regionprops(cc, 'BoundingBox');

temp_boxes = zeros(10, 4);
box_index = 1;

for k = 1:length(st)
    thisBB = st(k).BoundingBox;
    
    area = thisBB(3) * thisBB(4)
    if(area > 500)
        temp_boxes(box_index, :) = thisBB;
        box_index = box_index + 1;
    end
end

boxes = temp_boxes(1:box_index-1, :);

end