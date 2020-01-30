library(randomForest)
library(MASS)
library(bindata)
library("r2pmml")

N <- 5000

scale <- function(x) {x / sqrt(sum(x^2))}

age <- ceiling(runif(N, 16, 75))

plot(hist(age))

income <- age + abs(rnorm(N, 20, 100))

max_income <- max(income)

plot(hist(income))

calculate_class <- function(age, income) {
  if (age < 30) {
    if (income >= 300) {
      return(2)
    } else if (income >= 200) {
      return(1)
    } else {
    return(0)
    } 
  } else if (age < 50) {
    if (income >= 250) {
      return(2)
    } else if (income >= 150) {
      return(1)
    } else {
      return(0)
    }
  } else if (age < 60) {
    if (income >= 150) {
      return(2)
    } else if (income >= 75) {
      return(1)
    } else {
      return(0)
    }
  } else {
    if (income >= 200) {
      return(2)
    } else if (income >= 150) {
      return(1)
    } else {
    return(0)
    }
  }      
}

customer_class <- mapply(calculate_class, age, income)

plot(hist(customer_class))

# AIRLINES = 1
# MERCHANDISE = 2
# HOTEL = 3
# ONLINE_PURCHASE = 4
# UTILITIES = 5
# RESTAURANTS = 6
# OTHERS = 7

calculate_events <- function(age, income) {
  s <- seq(7)
  if (age < 50) {
    return(sample(s, 1, prob=scale(c(0.1, 0.75, 0.6, 0.8, 0.5, 0.79, 0.3) * income / max_income)))
  } else {
    return(sample(s, 1, prob=scale(c(0.2, 0.55, 0.65, 0.7, 0.63, 0.70, 0.4) * income / max_income)))
  }
}

events <- mapply(calculate_events, age, income)

k <- kde2d(age, events)
image(k)

calculate_response <- function(age) {
    p <- runif(1)
    if (age < 50) {
      return(if (p < 0.5) 1 else 0)
    } else {
      return(if (p < 0.3) 1 else 0)
    }
}

response <- sapply(X=age, FUN=calculate_response)

plot(hist(response))

segmentation <- function(customer_class, response) {
  if (customer_class == 2) {
    if (response == 1) {
      return(2)
    } else {
      return(1)
    }
  } else if (customer_class == 1) {
    if (response == 1) {
      return(2)
    } else {
      return(1)
    }
  } else if (customer_class == 0) {
    if (response == 1) {
      return(1)
    } else {
      return(0)
    }
  }
}

segment <- mapply(segmentation, customer_class, response)

data <- data.frame(
  age = age,
  income = income,
  cclass = customer_class,
  response = response,
  segment = segment,
  events = events
)

plot(data$age[data$segment == 0], data$income[data$segment == 0], cex=0.5, col="red")
points(data$age[data$segment == 1], data$income[data$segment == 1], cex=0.5, col="yellow")
points(data$age[data$segment == 2], data$income[data$segment == 2], cex=0.5, col="green")

# factorise
data$segment <- as.factor(data$segment)
data$cclass <- as.factor(data$cclass)
data$response <- as.factor(data$response)
data$events <- as.factor(data$events)

# train random forest
forest <- randomForest(segment ~ age + income + response + events, data = data)

data <- rbind(data[1, ] , data.frame(age=53, cclass=1,
                                     income=150.0, response=1, events = 2, segment=1))
d <- data[-1,]

# test a prediction
prediction <- predict(forest, d)

# save PMML model
r2pmml(forest, "models/rf_segmentation_r.pmml")