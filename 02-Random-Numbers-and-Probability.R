

>>>>>>>>>> Calculating probabilities

amir_deals %>%
  count(product) %>%
  mutate(prob = n/sum(n))
  
  
>>>>>>>>>> Sampling deals

>>> 1 Set the random seed to 31.
Take a sample of 5 deals without replacement.

# Set random seed to 31
set.seed(31)

# Sample 5 deals without replacement
amir_deals %>%
  sample_n(5, replace=FALSE)
  
>>> 2 Take a sample of 5 deals with replacement.
# Set random seed to 31
set.seed(31)

# Sample 5 deals with replacement
amir_deals %>%
  sample_n(5, replace=TRUE)
  
>>> 3 Question
What type of sampling is better to use for this situation?
Answer : without replacement

>>>>>>>>>> Creating a probability distribution

>>> 1 Create a histogram of the group_size column of restaurant_groups, setting the number of bins to 5.
# Create a histogram of group_size
ggplot(restaurant_groups, aes(x=group_size)) +
  geom_histogram(bins=5)
  
>>> 2 Count the number of each group_size in restaurant_groups, then add a column called probability that contains the probability of randomly selecting a group of each size. Store this in a new data frame called size_distribution.

# Create probability distribution
size_distribution <- restaurant_groups %>%
  # Count number of each group size
  count(group_size) %>%
  # Calculate probability
  mutate(probability = n / sum(n))

size_distribution

>>> 3 Calculate the expected value of the size_distribution, which represents the expected group size.

# Create probability distribution
size_distribution <- restaurant_groups %>%
  count(group_size) %>%
  mutate(probability = n / sum(n))

# Calculate expected group size
expected_val <- sum(size_distribution$probability *
                    size_distribution$group_size)
expected_val

>>> 4 Calculate the probability of randomly picking a group of 4 or more people by filtering and summarizing.

# Create probability distribution
size_distribution <- restaurant_groups %>%
  count(group_size) %>%
  mutate(probability = n / sum(n))

# Calculate probability of picking group of 4 or more
size_distribution %>%
  # Filter for groups of 4 or larger
  filter(group_size >= 4) %>%
  # Calculate prob_4_or_more by taking sum of probabilities
  summarise(prob_4_or_more = sum(probability))
  
 >>>>>>>>>>> Data back-ups
 
 >>> To model how long Amir will wait for a back-up using a continuous uniform distribution, save his lowest possible wait time as min and his longest possible wait time as max. Remember that back-ups happen every 30 minutes.
 
 # Min and max wait times for back-up that happens every 30 min
min <- 0
max <- 30

>>> Calculate the probability that Amir has to wait less than 5 minutes, and store in a variable called prob_less_than_5.

# Min and max wait times for back-up that happens every 30 min
min <- 0
max <- 30

# Calculate probability of waiting less than 5 mins
prob_less_than_5 <- punif(5, min, max)
prob_less_than_5

>>> Calculate the probability that Amir has to wait more than 5 minutes, and store in a variable called prob_greater_than_5.


# Min and max wait times for back-up that happens every 30 min
min <- 0
max <- 30

# Calculate probability of waiting more than 5 mins
prob_greater_than_5 <- punif(5, min, max, lower.tail=FALSE)
prob_greater_than_5

>>> Calculate the probability that Amir has to wait between 10 and 20 minutes, and store in a variable called prob_between_10_and_20.

# Min and max wait times for back-up that happens every 30 min
min <- 0
max <- 30

# Calculate probability of waiting 10-20 mins
prob_between_10_and_20 <- punif(20, min, max) - punif(10, min, max)
prob_between_10_and_20

>>>>>>>> Simulating wait times

# Set random seed to 334
set.seed(334)

# Generate 1000 wait times between 0 and 30 mins, save in time column
wait_times %>%
  mutate(time = runif(1000, min = 0, max = 30)) %>%
  # Create a histogram of simulated times
  ggplot(aes(time)) +
  geom_histogram(bins = 30)
  
 >>>>>>>>>> Simulating sales deals
 
 >>> 1 Set the random seed to 10 and simulate a single deal.
 # Set random seed to 10
set.seed(10)

# Simulate a single deal
rbinom(1, 1, .3)

>>> 2 Did you simulate 1 deal?
# Set random seed to 10
set.seed(10)

# Simulate 1 week of 3 deals
rbinom(1, 3, .3)

>>> 3 Simulate a year's worth of Amir's deals, or 52 weeks of 3 deals each, and store in deals.
Calculate the mean number of deals he won per week.

# Set random seed to 10
set.seed(10)

# Simulate 52 weeks of 3 deals
deals <- rbinom(52, 3, .3)

# Calculate mean deals won per week
mean(deals)
 
>>>>>>>>>> Calculating binomial probabilities
 
>>> What's the probability that Amir closes all 3 deals in a week?

# Probability of closing 3 out of 3 deals
dbinom(3,3,.3)

>>> What's the probability that Amir closes 1 or fewer deals in a week?

# Probability of closing <= 1 deal out of 3 deals
pbinom(1,3,.3)

>>> What's the probability that Amir closes more than 1 deal?

# Probability of closing > 1 deal out of 3 deals
pbinom(1,3,.3, lower.tail=FALSE)
 
 
>>>>>>>>>>>> How many sales will be won?

>>> # Expected number won with 30% win rate
won_30pct <- 3 * 0.3
won_30pct

# Expected number won with 25% win rate
won_25pct <- 3 * 0.25
won_25pct

# Expected number won with 35% win rate
won_35pct <- 3 * 0.35
won_35pct
 


  
