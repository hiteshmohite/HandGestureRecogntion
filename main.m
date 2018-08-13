% main driver

function main() 

filename = 'B_P_hgr1_id05_3.jpg';

background_removed = remove_background(filename);
figure; imshow(background_removed); title('Image after background subtraction');

palm_point = find_palm_point(background_removed);
display(palm_point);

radius = find_inner_circle_radius(background_removed, palm_point);
display(radius);

inner_circle = insertShape(imread(filename), 'circle', [palm_point(1) palm_point(2) radius], 'Color', 'red', 'LineWidth', 5);
figure; imshow(inner_circle); title('Inner circle shown in red');

palm_mask = find_palm_mask(background_removed, radius, palm_point(1), palm_point(2));
figure; imshow(background_removed); title('Drawing Palm Mask');
hold on; 
plot(palm_mask(:, 1), palm_mask(:, 2));

wrist_points = find_wrist_points(palm_mask);
display(wrist_points);

hand = rotate_and_cut(background_removed, [260 236], wrist_points);
figure; imshow(hand); title('Rotated and Cut');

palm_removed = get_mask(hand, palm_mask);
figure; imshow(palm_removed); title('Palm removed');

bounding_boxes = generate_boxes(palm_removed);
figure; imshow(palm_removed); title('Boxes drawn');
thisBB = zeros(1, 4);
[z l] = size(bounding_boxes);
for k = 1:z
    thisBB = bounding_boxes(k, :);
    rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
    'EdgeColor','r','LineWidth',2 );
end

actual_boxes = recognize_fingers(bounding_boxes);
display(actual_boxes);
figure; imshow(palm_removed); title('correct boxes');
[z l] = size(actual_boxes);
for k = 1:z
    thisBB = actual_boxes(k, :);
    rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
    'EdgeColor','r','LineWidth',2 );
end

figure; imshow(palm_removed); title('Palm_removed_again');
[thumb_flag, thumb_index, palm_line, finger_center] = find_palm_line(palm_point, hand, actual_boxes, wrist_points);
display(thumb_flag);
display(palm_line);
display(finger_center);

%label the fingers
label_fingers(palm_removed, palm_line, actual_boxes, thumb_index, thumb_flag, finger_center);

pause();
close all;

end