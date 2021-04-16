clc;
clear all;
close all;
%loading
data = load ('weather.data');
%Adjusting dataset for different attributes
levels = data(1,:);
data(1,:) = [];
%splitting randomly
[p,q] = size(data);
P  = 10/14;
idx = randperm(p);
train = data(idx(1:round(P*p)),:) ; 
test = data(idx(round(P*p)+1:end),:) ;
[m,d] = size(train) ; 
[n,c] = size(test) ;
%checking 
if c>=d-1
    disp('Coloumn size of test set is greater than d-1 \n');
else
    disp('Coloumn size of test set is less than d \n');
end
%checking vor values less than 1
if all(train)>=1
    [accuracy]=NBclassifier(n,m,d,train,test,levels); 
    fprintf('Accuracy of test is %f percent',accuracy);
    disp(' ');
else
    disp('error : values in data set are less than 1');
end

