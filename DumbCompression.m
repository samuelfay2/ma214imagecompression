
function compressed = DumbCompression(inputImage, downsizeSquareNum, takeAverage)
    [length, width, depth] = size(inputImage);
    step = sqrt(downsizeSquareNum);
    length = length - mod(length, step);
    width = width - mod(width, step);
    compressed = zeros(length, width, depth, 'double');
    for i = 1:step:length - 1
        for j = 1:step:width - 1
            for k = 1:depth
                averageColor = 0;
                firstColor = inputImage(i,j,k);
                for x = i:i + step - 1
                    for y = j:j + step - 1
                        averageColor = averageColor + inputImage(x,y,k);
                    end
                end
                averageColor = averageColor / downsizeSquareNum;
                for x = i:i + step - 1
                    for y = j:j + step - 1
                        if takeAverage
                            compressed(x,y,k) = averageColor;
                        else
                            compressed(x,y,k) = firstColor;
                        end
                    end
                end
            end
        end
    end   
    compressed = uint8(compressed);
end


