%% Precison, Recall, F1-score calculation from the confusion matrix
% Created by Akhilesh Yadav, NITk, Surathkal, India



%%
clc
close all
clear all
C = [62,0,0,0,0,0,0,0,1,0;0,79,0,0,0,0,0,0,0,1;0,0,57,0,4,0,0,2,0,0;0,0,1,65,0,0,0,0,0,0;0,0,3,0,78,1,1,0,0,0;0,0,0,0,0,77,0,0,0,0;0,0,0,0,1,0,64,0,0,0;0,0,0,0,0,0,0,71,0,0;1,0,0,0,0,0,0,0,74,0;0,0,0,0,0,0,0,0,0,77];


Precesion = zeros(10,1);
Recall = zeros(10,1);
F1_score = zeros(10,1);
FP_c = zeros(10,1);
FN_c = zeros(10,1);
TN_c = zeros(10,10);
for i =1:10
    TP = C(i,i);
    for l =1:10
        FP_c(l) = C(l,i);
        FN_c(l) = C(i,l);
        for k = 1:10
            TN_c(l,k) = C(l,k);
        end
    end
    FP = (sum(FP_c)-TP);
    FN = (sum(FN_c)-TP);
    TN = (sum(TN_c(:))-(TP+FP+FN));
    
    Precesion(i) = (TP)/(TP+FP);
    Recall(i) = (TP)/(TP+FN);
    F1_score(i) = ((2*Precesion(i)*Recall(i))/(Precesion(i)+Recall(i)));
end


