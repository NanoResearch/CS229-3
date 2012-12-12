%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is tha main function that controls the overall flow:
% -> load files
% -> pre-compose samples
% -> execute algorithms
% -> evaluation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;

%% load files
[matrix, category] = readMatrix('dataset_compressed.txt');
matrix = full(matrix);
% eliminate words feature, too big to compute in limit time
matrix = matrix(:,21879:end); 
category = full(category);

[featureMatrixTrain labelTrain featureMatrixTest labelTest] = ...
    preprocess(matrix, category);

%% declear global variables and constants
global RATIO;
RATIO = 0.7; % percentage of data used for training
NUM_FEATURES = size(featureMatrixTrain, 2);
NUM_TRAIN_DATA = size(featureMatrixTrain, 1);
NUM_TEST_DATA = size(featureMatrixTest, 1);


%% apply differenct classifiers on the data
% decide which method to use 'decision tree'
%method = 'decision tree'; 
method = 'svm'; 
%method = 'naive bayes'; 

% TODO: used for feature selection
feature_eliminated = '';
    
if (strcmp(method, 'decision tree'))
    display('Running decision tree...');
    predicates = runDecisionTree(featureMatrixTrain, ...
        labelTrain, featureMatrixTest);
    display('Finishing decision tree building!');
    [precision recall accuracy F1] = evaluate(predicates, labelTest);
elseif (strcmp(method, 'logistic regression'))
    % TODO
    display('Running logistic regression...');
elseif (strcmp(method, 'naive bayes'))
    % TODO Wenjia's code goes here
    display('Runing naive bayes...');
     predicates = runNaiveBayes(featureMatrixTrain, ...
         labelTrain, featureMatrixTest);
     display('Finishing naive bayes!');
    [precision recall accuracy F1] = evaluate(predicates, labelTest);
elseif (strcmp(method, 'svm'))
    % TODO Wenjia's code goes here
    display('Running svm...');
     predicates = runSVM(featureMatrixTrain, ...
         labelTrain, featureMatrixTest);
     display('Finishing svm!');
    [precision recall accuracy F1] = evaluate(predicates, labelTest);
elseif (strcmp(method, 'boosting'))
    % TODO
    display('Running boosting...');
end

%% plot results


