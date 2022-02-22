# Machine learning -  Naive Bayes classifier

# Introduction 

Naive Bayes is a simple technique for constructing classifiers: models that assign class labels to problem
instances, represented as vectors of feature values, where the class labels are drawn from some finite set.
There is not a single algorithm for training such classifiers, but a family of algorithms based on a common
principle: all naive Bayes classifiers assume that the value of a particular feature is independent of the value
of any other feature, given the class variable. For example, a fruit may be considered to be an apple if it
is red, round, and about 10 cm in diameter. A naive Bayes classifier considers each of these features to
contribute independently to the probability that this fruit is an apple, regardless of any possible correlations
between the color, roundness, and diameter features. For some types of probability models, naive Bayes
classifiers can be trained very efficiently in a supervised learning setting. In many practical applications,
parameter estimation for naive Bayes models uses the method of maximum likelihood; in other words,
one can work with the naive Bayes model without accepting Bayesian probability or using any Bayesian
methods.An advantage of naive Bayes is that it only requires a small number of training data to estimate
the parameters necessary for classification.Standard method for naive Bayes classifier in mat lab is by using
the predefined functions such as “predict” and “resubPredict”.

# Instructions to run the code

  - In order to implement the code rum “main.m” file. Main.m just contains the function call for the
NB classifier.m and checks for right column size.NB classifier.m takes inputs from main splits train into
attributes of 4 and prior probability is calculated for each attribute in training section.In testing section
each attributes is checked for probability and based on the result, probability of yes and no is decided.In
the end accuracy is calculated.
