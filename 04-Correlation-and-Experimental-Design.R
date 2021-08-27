>>>>>>>>>>>>>> Relationships between variables

>>> Create a scatterplot of happiness_score vs. life_exp using ggplot2.

# Create a scatterplot of happiness_score vs. life_exp
ggplot(world_happiness, aes(x=life_exp, y= happiness_score)) +
    geom_point()
    
 >>> Add a linear trendline to the scatterplot, setting se to FALSE.
 # Add a linear trendline to scatterplot
ggplot(world_happiness, aes(life_exp, happiness_score)) +
  geom_point() +
  geom_smooth(method = "lm", se=FALSE )
  
 >>> Based on the scatterplot, which is most likely the correlation between life_exp and happiness_score?
 answer 0.8
 
 >>> Calculate the correlation between life_exp and happiness_score.
 
 # Add a linear trendline to scatterplot
ggplot(world_happiness, aes(life_exp, happiness_score)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# Correlation between life_exp and happiness_score
cor(world_happiness$life_exp, world_happiness$ happiness_score)

>>>>>>>>>>>> What can't correlation measure?

>>> Create a scatterplot showing the relationship between gdp_per_cap (on the x-axis) and life_exp (on the y-axis).
# Scatterplot of gdp_per_cap and life_exp
ggplot(world_happiness, aes(x=gdp_per_cap, y=life_exp)) +
    geom_point()
    
>>> Calculate the correlation between gdp_per_cap and life_exp.

# Scatterplot of gdp_per_cap and life_exp
ggplot(world_happiness, aes(gdp_per_cap, life_exp)) +
  geom_point()

# Correlation between gdp_per_cap and life_exp
cor(world_happiness$gdp_per_cap, world_happiness$life_exp)

>>> The correlation between GDP per capita and life expectancy is 0.7. Why is correlation not the best way to measure the relationship between the two variables?

answer : Correlation only measures linear relationships.

>>>>>>>>>>>>>> Transforming variables

>>> Create a scatterplot of happiness_score vs. gdp_per_cap and calculate the correlation between them.

# Scatterplot of happiness_score vs. gdp_per_cap
ggplot(world_happiness, aes(x=gdp_per_cap, y=happiness_score)) +
geom_point()

# Calculate correlation
cor(world_happiness$happiness_score, world_happiness$gdp_per_cap)

>>> Add a new column to world_happiness called log_gdp_per_cap that contains the log of gdp_per_cap.
Create a scatterplot of log_gdp_per_cap vs. happiness_score and calculate the correlation between them.

# Create log_gdp_per_cap column
world_happiness <- world_happiness %>%
  mutate(log_gdp_per_cap = log(gdp_per_cap))

# Scatterplot of log_gdp_per_cap vs. happiness_score
ggplot(world_happiness, aes(log_gdp_per_cap, happiness_score)) +
  geom_point()

# Calculate correlation
cor(world_happiness$log_gdp_per_cap, world_happiness$happiness_score)

>>>>>>>>>>>>Does sugar improve happiness?

>>> Create a scatterplot showing the relationship between grams_sugar_per_day (on the x-axis) and happiness_score (on the y-axis).
Calculate the correlation between grams_sugar_per_day and happiness_score.

# Scatterplot of grams_sugar_per_day and happiness_score
ggplot(world_happiness, aes(x=grams_sugar_per_day, y=happiness_score)) +
geom_point()

# Correlation between grams_sugar_per_day and happiness_score
cor(world_happiness$grams_sugar_per_day, 
world_happiness$happiness_score)

>>> Based on this data, which statement about sugar consumption and happiness scores is true?

Answer: Increased sugar consumption is associated with a higher happiness score.



