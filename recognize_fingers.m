% recognize fingers, account for joint ones

function returned = recognize_fingers(bounding_boxes)
   
% minimal_box = bounding_boxes(1, 4);
% [box_count, dimen] = size(bounding_boxes);
% for k = 1:box_count
%     thisBB = bounding_boxes(k, :);
%     if(thisBB(3) < minimal_box)
%         minimal_box = thisBB(3);
%     end
% end

minimal_box = 28;
[box_count, dimen] = size(bounding_boxes);

box_index = 1;
temp_boxes = zeros(20, 4);
for k = 1:box_count
    thisBB = bounding_boxes(k, :);
    if(thisBB(3) > (minimal_box))
        display(thisBB(3));
        if(thisBB(3) < 1.2*minimal_box)
            display('just one big finger');
            temp_boxes(box_index, :) = thisBB;
            box_index = box_index + 1;
        elseif(thisBB(3) < 2*minimal_box)
            display('two fingers');
            temp_boxes(box_index, :) = [thisBB(1)             thisBB(2) thisBB(3)/2 thisBB(4)];
            box_index = box_index + 1;
            temp_boxes(box_index, :) = [thisBB(1)+thisBB(3)/2 thisBB(2) thisBB(3)/2 thisBB(4)];
            box_index = box_index + 1;
        elseif(thisBB(3) < 3*minimal_box)
            display('three fingers');
            temp_boxes(box_index, :) = [thisBB(1)                   thisBB(2) thisBB(3)/3 thisBB(4)];
            box_index = box_index + 1;
            temp_boxes(box_index, :) = [thisBB(1)+thisBB(3)/3       thisBB(2) thisBB(3)/3 thisBB(4)];
            box_index = box_index + 1;
            temp_boxes(box_index, :) = [thisBB(1)+(2*(thisBB(3)/3)) thisBB(2) thisBB(3)/3 thisBB(4)];
            box_index = box_index + 1;
        elseif(thisBB(3) < 4*minimal_box)
            display('four fingers');
            temp_boxes(box_index, :) = [thisBB(1)                   thisBB(2) (thisBB(3)/4) thisBB(4)]
            box_index = box_index + 1;
            temp_boxes(box_index, :) = [thisBB(1)+(thisBB(3)/4)     thisBB(2) (thisBB(3)/4) thisBB(4)]
            box_index = box_index + 1;
            temp_boxes(box_index, :) = [thisBB(1)+(2*(thisBB(3)/4)) thisBB(2) (thisBB(3)/4) thisBB(4)]
            box_index = box_index + 1;
            temp_boxes(box_index, :) = [thisBB(1)+(3*(thisBB(3)/4)) thisBB(2) (thisBB(3)/4) thisBB(4)]
            box_index = box_index + 1;
        elseif(thisBB(3) < 5*minimal_box)
            display('five fingers');
            temp_boxes(box_index, :) = [thisBB(1)                   thisBB(2) (thisBB(3)/5) thisBB(4)]
            box_index = box_index + 1;
            temp_boxes(box_index, :) = [thisBB(1)+(thisBB(3)/5)     thisBB(2) (thisBB(3)/5) thisBB(4)]
            box_index = box_index + 1;
            temp_boxes(box_index, :) = [thisBB(1)+(2*(thisBB(3)/5)) thisBB(2) (thisBB(3)/5) thisBB(4)]
            box_index = box_index + 1;
            temp_boxes(box_index, :) = [thisBB(1)+(3*(thisBB(3)/5)) thisBB(2) (thisBB(3)/5) thisBB(4)]
            box_index = box_index + 1;
            temp_boxes(box_index, :) = [thisBB(1)+(4*(thisBB(3)/5)) thisBB(2) (thisBB(3)/5) thisBB(4)]
            box_index = box_index + 1;
        else
            display('you have a huge hand sir');
        end
    else
        display('adding this to correct boxes');
        temp_boxes(box_index, :) = thisBB;
        box_index = box_index + 1;
    end
end

returned = temp_boxes(1:box_index-1, :);

end