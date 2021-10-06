%This function takes in a data matrix X and a label
%vector y and outputs the average cat image and average dog image.
function [avgcat avgdog] = average_pet(X,y)
[a,b] = size(X); %%a=2000,b=4096
cat_count = 0;
dog_count = 0;
for k = 1:a
    if (y(k) == -1)
        cat_count = cat_count+1;
    elseif (y(k) == 1)
        dog_count = dog_count+1;
    end
end
ac = zeros(1,b);
ad = zeros(1,b);
for i = 1:b
    for j = 1:a
        if (y(j) == -1)
            ac(1,i) = ac(1,i) + X(j,i);
        elseif (y(j) == 1)
            ad(1,i) = ad(1,i) + X(j,i);
        end
    end
end
avgcat = ac/cat_count;
avgdog = ad/dog_count;


