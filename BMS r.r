rm(list=ls())
library('rio')
library(corrplot)
library(PerformanceAnalytics)
library(dplyr)
bms = import("BigMartSales.xlsx")
str(bms)
colnames(bms) = tolower(make.names(colnames(bms)))
str(bms)
dim(bms)
colSums(is.na(bms))   # We have 2410 recorbmss missing outlet sizes, anbms 1463 item_weight missing.
#Converting to factors
bms <- bms %>%
  mutate(
    item_id = factor(item_id),
    item_fat_content = factor(item_fat_content),
    item_type = factor(item_type),
    outlet_id = factor(outlet_id),
    outlet_size = factor(outlet_size),
    city_type = factor(city_type),
    outlet_type = factor(outlet_type)
  )


bms$city_type = relevel(bms$city_type, "Tier 1")
bms$outlet_type = relevel(bms$outlet_type, "Grocery Store")
# Calculate outlet age
bms$outlet_age <- 2013 - bms$outlet_year

colSums(is.na(bms))                                               
#We have2410 missing values unbmser Outlet_Size, 1463 missing values for Item-Weight.
#Since outlet_size serves as a substitute for outlet_Ibms, we will exclubmse it from the analysis.


# bmsata Visualization

hist(bms$item_sales)
hist(log(bms$item_sales))

library(lattice)
histogram(~item_sales | outlet_type, data=bms)
densityplot(~item_sales | outlet_type, data=bms)
bwplot(item_sales ~ outlet_type, data=bms)
bwplot(item_sales ~ city_type, data=bms)

table(bms$outlet_type)
table(bms$city_type)
table(bms$city_type, bms$outlet_type)

items = bms[, c(2, 4, 6, 12)] #Extracting the item-level variables.
str(items)
library(PerformanceAnalytics)
chart.Correlation(items)                                


#' Variable selection for Mixed Level Analysis

#' dependent variable: item_sales

#'   item_id:          id of product. We will omit this variable.
#'   item_visibility:  Products having higher visibility will have higher sales.
#'   item_type:        day-to-day items might sell more.
#'   item_mrp:         low price items may sell more.

#'   outlet_id:        required to answer q3.
#'   outlet_type:      will tell how the sales differ by outlet type and to answer question 1.
#'   city_type:        how sales differ by city tiers and will answer question 2
#'   outlet_age:       Calculated. Established outlets might have more sales than newer ones.



# Models
ols_sales <- fe_sales  <- lm(log(item_sales) ~ item_visibility + item_type  + item_mrp + outlet_type + outlet_age + city_type, data=bms)

fe_sales  <- lm(log(item_sales) ~ item_visibility + item_type  + item_mrp + outlet_type + outlet_age  + city_type + outlet_id, data=bms)  

library(lme4)             
re_sales <- lmer(log(item_sales) ~ item_visibility + item_type + item_mrp + outlet_type + city_type + outlet_age + (1 | outlet_id), data=bms,REML=FALSE) 
summary(re_sales)
bms$item_sales2 = round(bms$item_sales, digits = 0)

re_sales_glmer<- glmer(item_sales2 ~ item_visibility + item_type + item_weight + item_mrp + outlet_type + city_type + outlet_age + (1 | outlet_id), data=bms,family = poisson(link="log"))
summary(re_sales_glmer)

library(car)
vif(x) #fail because including outlet_type to answer q
library(stargazer)
options(max.print=100000)
stargazer(fe_sales, re_sales,re_sales_glmer ,type="text", single.row=TRUE)

summary(re_sales)
ranef(re_sales)
AIC(fe_sales, re_sales, re_sales_glmer) #fe_sales has the least AIC.
BIC(fe_sales, re_sales, re_sales_glmer)                                      


# Test of assumptions
# We cannot perform Durbin-Watson Test as re model is multi-level.

library(car)
vif(re_sales)


library(DHARMa)
sim_residuals <- simulateResiduals(re_sales)
plot(sim_residuals)
testDispersion(re_sales)

library(car)
durbinWatsonTest(re_sales)

bgtest(re_sales)

library(lmtest)
resid <- resid(re_sales)
dwtest(resid ~ 1)
