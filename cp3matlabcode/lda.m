%Linear discriminant analysis training error rate is [1.2%].
%Linear discriminant analysis test error rate is [16%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the cat
%and dog sample mean vectors as well as the sample covariance matrix 
%(which is assumed to be equal for cats and dogs). 
%It also takes in a data matrix Xrun and produces a vector of
%label guesses yguess, corresponding to the ML rule for
%jointly Gaussian vectors with different means and the same 
%covariance matrix.
function yguess = lda(Xtrain,ytrain,Xrun)
yguess = zeros(length(Xrun(:,1)),1);
[runrow, runcol] = size(Xrun);
[yrow, ycol] = size(ytrain);
cat = [];
dog = [];
for i=1:yrow
    if ytrain(i) == 1
        dog = [dog;Xtrain(i,:)];
    else
        cat = [cat;Xtrain(i,:)];
    end
end

cov_cat = cov(cat);
cov_dog = cov(dog);
[catrow, catcol] = size(cat);
[dogrow, dogcol] = size(dog);
common_cov = (catrow-1)*cov_cat+(dogrow-1)*cov_dog;
common_cov = common_cov / (yrow-2);

[mucat, mudog] = average_pet(Xtrain,ytrain);
inverse_cov = pinv(common_cov);
result1 = (mudog*inverse_cov*(transpose(mudog)))-(mucat*inverse_cov*(transpose(mucat)));

for j=1:runrow
    result2 = 2*Xrun(j,:)*inverse_cov*(transpose(mudog-mucat));
    if result2 >=result1
        yguess(j) = 1;
    elseif result2 < result1
        yguess(j) = -1;
    end
end
            

end