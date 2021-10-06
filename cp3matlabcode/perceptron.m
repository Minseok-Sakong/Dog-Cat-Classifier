%Perceptron training error rate is 0%
%Perceptron test error rate is 20%

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to the decision rule corresponding
%to a very simple one-layer neural network: the perceptron. 
%It also takes in a data matrix Xrun and produces a vector of label
%guesses yguess, corresponding to the sign of the linear prediction.
function yguess = perceptron(Xtrain,ytrain,Xrun)
[row, col] = size(Xrun);
yguess = zeros(row,1);

trans_xtrain =  transpose(Xtrain);
trans_xrun = transpose(Xrun);
result = pinv(trans_xtrain * Xtrain) * ((trans_xtrain * ytrain));
%%[a,b] = size(result);
%%fprintf("%d*%d",a,b)
for i = 1:row
    if (Xrun(i,:) * result >= 0)
        yguess(i) = 1;
    else
        yguess(i) = -1;
    end
end

end
