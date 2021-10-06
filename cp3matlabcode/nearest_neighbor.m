%Nearest neighbor training error rate is 0%.
%Nearest neighbor test error rate is 17%.

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess. Each guess is found
%by searching through Xtrain to find the closest row, and then 
%outputting its label.
function yguess = nearest_neighbor(Xtrain,ytrain,Xrun)
[row_t, col_t] =size(Xtrain);
[row_r,col_r] = size(Xrun);
minval = 0;
minind = 0;
yguess = zeros(row_r,1);
%%minvec = zeros(row,1);
distances = zeros(row_r,1);

for i = 1:row_r
    for j = 1:row_t
        distances(j) = norm(Xrun(i,:)-Xtrain(j,:));
    end
    [minval, minind] = min(distances);
    yguess(i) = ytrain(minind);
end
end

