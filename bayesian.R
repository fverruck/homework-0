#using a Monte Carlo simulation to prove Bayes Theorem

#let's start by considering a random sample of 100,000
N <- 100000

#let's also take a disease with prevalence of 1:3900
prev <- 1/3900

#will sample in a variable outcome
outcome <- sample(c("Healty","Disease"), N, replace = TRUE, prob = c(1-prev, prev))


#now, showing how many people will have false positives

#establish the accuracy of the test
accuracy <- 0.99

#create a vector for test
test <- vector("character", N)

#create a variable outcome that samples the disease for having the disease given positive or negative
test[outcome == "Disease"] <- sample(c("+", "-"), N_D, replace = TRUE, prob = c(accuracy, 1-accuracy))

# create a variable outcom for being healty
test[outcome == "Healty"] <- sample(c("-", "+"), N_H, replace = TRUE, prob = c(accuracy, 1-accuracy))

#create a table to count false positives and false negatives
table(outcome, test)
