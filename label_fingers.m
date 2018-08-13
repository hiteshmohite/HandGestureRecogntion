% labels the fingers based on where they fall in image

function label_fingers(image, palm_line, boxes, thumb_index, thumb_flag, centers)

% checking if thumb is left or right
figure; imshow(image); title('Fingers Labelled'); hold on;
[box_count dimen] = size(boxes);
thisBB = zeros(1, 4);
if(thumb_flag == true)
    text(centers(thumb_index, 1), centers(thumb_index, 2), 'T', 'Color','magenta', 'FontSize', 14);
    box_count = box_count - 1;
    thisBB = boxes(thumb_index, :);
    rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
    'EdgeColor','r','LineWidth',2 );
end

for k = 1:box_count
    thisBB = boxes(k, :);
    rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
    'EdgeColor','r','LineWidth',2 );
    if(k == 1)
        text(centers(k, 1), centers(k, 2), '4', 'Color','magenta', 'FontSize', 14);
    elseif(k == 2)
        text(centers(k, 1), centers(k, 2), '3', 'Color','magenta', 'FontSize', 14);
    elseif(k == 3)
        text(centers(k, 1), centers(k, 2), '2', 'Color','magenta', 'FontSize', 14);
    elseif(k == 4)
        text(centers(k, 1), centers(k, 2), '1', 'Color','magenta', 'FontSize', 14);
    end
end

end