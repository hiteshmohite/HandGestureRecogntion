% finds palm line, centers of bounding boxes, thumb present or not

function [thumb_flag, thumb_index, palm_line, finger_center] = find_palm_line(palm_point, hand, ...
                                              boxes, wrist_points)

[box_count, dimen] = size(boxes);
finger_center = zeros(box_count, 2);
thisBB = zeros(1, 4);
check_angle = 60;
thumb_flag = false;
thumb_box = zeros(1, 4);
column_from = boxes(1, 1) - 10; 
column_to = boxes(box_count, 1) + boxes(box_count, 3) + 10;

for k = 1:box_count
    thisBB = boxes(k, :);
    finger_center(k, 1) = ( ( 2*thisBB(1) ) + thisBB(3) )/2
    finger_center(k, 2) = ( ( 2*thisBB(2) ) + thisBB(4) )/2
    
    m = ( palm_point(2) - finger_center(k, 2) )/( palm_point(1) - finger_center(k, 1) );
    display(atand(m));
    if(abs(atand(m)) < check_angle)
        thumb_flag = true;
        thumb_box = thisBB;
        thumb_index = k;
    end
end

x = [thumb_box(1) thumb_box(1)+thumb_box(3) thumb_box(1)+thumb_box(3) thumb_box(1)];
y = [thumb_box(2) thumb_box(2)              thumb_box(2)+thumb_box(4) thumb_box(2)+thumb_box(4)];
if(thumb_flag == true)
    thumb = roipoly(hand, x, y); 
    hand = hand - thumb;
end

figure; imshow(hand); title('Before palm line');
wrist_line = wrist_points(1, 2);
white_flag = false;
for k = wrist_line:-1:1
    connected = 0;
    for l = column_from:column_to
        if(impixel(hand, l, k) == 1 & white_flag == false)
            white_flag = true;
            connected = connected + 1;
        end
        if(impixel(hand, l, k) == 0 & white_flag == true)
            white_flag = false;
            connected = connected + 1;
        end
    end
    if(connected > 2)
        break;
    end
end

palm_line = k;
end