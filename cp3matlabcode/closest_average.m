%Closest average training error rate is 20%.
%Closest average test error rate is 17%.

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess, corresponding to whether
%each row of Xtest is closer to the average cat or average dog.
function [yguess] = closest_average(Xtrain,ytrain,Xrun)

[row col] = size(Xrun);

yguess = zeros(row,1);
vcat = zeros(row,1);
vdog = zeros(row,1);

[mcat, mdog] = average_pet(Xtrain, ytrain);

for i = 1:row
    vcat(i) = sqrt(sum((Xrun(i,:)-mcat).^2));
    vdog(i) = sqrt(sum((Xrun(i,:)-mdog).^2));
end
%%for j= 1: row
%%end

%%vcat = sqrt(vcat);
%%vdog = sqrt(vdog);

for i = 1:row
    if (vcat(i) > vdog(i))
        yguess(i) = +1;
    else
        yguess(i) = -1;
    end
end

end
