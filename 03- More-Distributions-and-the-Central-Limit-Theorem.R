>>>>>>>>>> Distribution of Amir's sales

>>> Create a histogram with 10 bins to visualize the distribution of the amount.

# Histogram of amount with 10 bins
ggplot(amir_deals, aes(amount)) +
    geom_histogram(bins=10)

>>>>>>>>>> Probabilities from the normal distribution

>>>What's the probability of Amir closing a deal worth less than $7500?

# Probability of deal < 7500
pnorm (7500, mean= 5000, sd=2000)

>>> What's the probability of Amir closing a deal worth more than $1000?

# Probability of deal > 1000
pnorm(1000, mean=5000, sd=2000, lower.tail=FALSE)

>>> What's the probability of Amir closing a deal worth between $3000 and $7000?

# Probability of deal between 3000 and 7000
pnorm(7000, mean=5000, sd=2000) - pnorm(3000, mean=5000, sd=2000)

>>> What amount will 75% of Amir's sales be more than?

# Calculate amount that 75% of deals will be more than
qnorm(.75, mean=5000, sd=2000, lower.tail=FALSE)

>>>>>>>>>> Simulating sales under new market conditions

# Calculate new average amount
new_mean <- 5000*1.2

# Calculate new standard deviation
new_sd <- 2000*1.3

# Simulate 36 sales
new_sales <- new_sales %>% 
  mutate(amount = rnorm(36, mean=new_mean, sd=new_sd))

# Create histogram with 10 bins
ggplot(new_sales, aes(amount)) + geom_histogram(bins=10)

>>>>>>>>>>> The CLT in action

>>> Create a histogram of the num_users column of amir_deals. Use 10 bins.

# Create a histogram of num_users
ggplot(amir_deals, aes(num_users)) +
    geom_histogram(bins=10)
    
>>> Set the seed to 104.
Take a sample of size 20 with replacement from the num_users column of amir_deals, and take the mean.

# Set seed to 104
set.seed(104)

# Sample 20 num_users with replacement from amir_deals
sample(amir_deals$num_users, size = 20, replace = TRUE) %>%
  # Take mean
  mean()
  
>>> Repeat this 100 times and store as sample_means. This will take 100 different samples and calculate the mean of each.

# Set seed to 104
set.seed(104)

# Sample 20 num_users from amir_deals and take mean
sample(amir_deals$num_users, size = 20, replace = TRUE) %>%
  mean()

# Repeat the above 100 times
sample_means <- replicate(100, sample(amir_deals$num_users, size = 20, replace = TRUE) %>% mean())

>>> The CLT in action

# Set seed to 104
set.seed(104)

# Sample 20 num_users from amir_deals and take mean
sample(amir_deals$num_users, size = 20, replace = TRUE) %>%
  mean()

# Repeat the above 100 times
sample_means <- replicate(100, sample(amir_deals$num_users, size = 20, replace = TRUE) %>% mean())

# Create data frame for plotting
samples <- data.frame(mean = sample_means)

# Histogram of sample means
ggplot(samples, aes(mean)) +
  geom_histogram(bins=10)

>>>>>>>>>> The mean of means

# Set seed to 321
set.seed(321)

# Take 30 samples of 20 values of num_users, take mean of each sample
sample_means <- replicate(30, sample(all_deals$num_users, size = 20) %>% mean())

# Calculate mean of sample_means
mean(sample_means)

# Calculate mean of num_users in amir_deals
mean(amir_deals$num_users)

>>>>>>>>>>> Tracking lead responses

>>> What's the probability that Amir responds to 5 leads in a day, given that he responds to an average of 4?

# Probability of 5 responses
dpois(5, lambda= 4)

>>> Amir's coworker responds to an average of 5.5 leads per day. What is the probability that she answers 5 leads in a day?

# Probability of 5 responses from coworker
dpois(5, lambda=5.5)

>>> What's the probability that Amir responds to 2 or fewer leads in a day?

# Probability of 2 or fewer responses
ppois(2, lambda=4)

>>> What's the probability that Amir responds to more than 10 leads in a day?

# Probability of > 10 responses
ppois(10, lambda=4, lower.tail=FALSE)

>>>>>>>>>>>> Modeling time between leads

>>> What's the probability it takes Amir less than an hour to respond to a lead?

# Probability response takes < 1 hour
pexp(1, rate = .4)

>>> What's the probability it takes Amir more than 4 hours to respond to a lead?

# Probability response takes > 4 hours
pexp(4, rate=.4, lower.tail=FALSE)

>>> What's the probability it takes Amir 3-4 hours to respond to a lead?

# Probability response takes 3-4 hours
pexp(4, rate=.4) - pexp(3, rate=.4)

>>>>>>>>>> 






