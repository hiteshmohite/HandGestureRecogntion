% finds the inner circle radius
% stops when black pixel is reached

function returned = find_inner_circle_radius(image, center)

h = center(1);
k = center(2);

black_flag = false;
for radius = [10 20 30 40 50 60 70 80]
    for i = 1:360
        theta = i * 0.01745329251;
        x = ceil( h + radius * cos(theta) );
        y = ceil( k + radius * sin(theta) );
    
        if(impixel(image, x, y) == 0)
            black_flag = true;
            break;
        end
    end
    if(impixel(image, x, y) == 0)
        black_flag = true;
        break;
    end
end

if(black_flag == true)
    radius = radius - 10;

end

returned = radius;

end