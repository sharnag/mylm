# Test file containing unit tests for "mylm" function
# Author: Sharna Granwal
# Last Modified Date: 4/08/2023

#context("Testing mylm context")

####### Valid Inputs Testing ####### 
# an object of class "formula" (or one that can be coerced to that class) a symbolic description of the model to be fitted. The details of model specification are given under ‘Details’.
#an optional data frame, list or environment (or object coercible by as.data.frame to a data frame) containing the variables in the model. If not found in data, the variables are taken from environment(formula), typically the environment from which lm is called.
#an optional vector specifying a subset of observations to be used in the fitting process.

test_that("mylm works with valid formula, data and subset arguments", {
  #Create data objects and environment variables for model parameters
  mtcars <- mtcars
  mtcars_list <- as.list(mtcars)
  mpg <- mtcars[,"mpg"]
  wt <- mtcars[,"wt"]
  disp <- mtcars[,"disp"]
  hp <- mtcars[,"hp"]
  
  # dataframe
  expect_silent(mylm(mtcars, data=mtcars)) 
  expect_silent(mylm(formula=mpg ~ wt + disp + hp, data=mtcars))
  expect_silent(mylm(formula="mpg ~ wt + disp + hp", data=mtcars))
  
  # list
  expect_silent(mylm(formula=mpg ~ wt + disp + hp, data=mtcars_list))
  
  # data is NULL but environment vars exist.
  expect_silent(mylm(formula=mpg ~ wt + disp + hp))
  
  # valid subsets
  expect_silent(mylm(formula=mpg ~ wt + disp + hp, data=mtcars, subset=c(1:25)))
  expect_silent(mylm(formula=mpg ~ wt + disp + hp, data=NULL, subset=c(1:25))) 
  expect_silent(mylm(formula=mpg ~ wt + disp + hp, data=mtcars, subset=c(rep(TRUE,25),rep(FALSE,7))))
})

####### Invalid Inputs Testing ####### 

test_that("mylm gives helpful errors for invalid formula argument", {
  expect_error(mylm(), "argument \"formula\" is missing, with no default")
  expect_error(mylm("mpg = wt + disp + hp", data=mtcars), "The argument \"formula\" is not a valid formula") # = assignment is deprecated
  expect_error(mylm("abc", data=mtcars), "The argument \"formula\" is not a valid formula") 
  expect_error(mylm(123, data=mtcars),"The argument \"formula\" is not a valid formula") 
})

test_that("mylm gives helpful errors for invalid data argument", {
  expect_error(mylm(mpg ~ wt + disp + hp, data="mtcars"), "The argument \"data\" is not a dataframe or list object")
  
  # check if model parameters are missing from the dataframe
  expect_error(mylm(formula=random ~ wt + disp + hp, data=mtcars), "The response variable is undefined")
  expect_error(mylm(mpg ~ wt + disp + hp + random, data=mtcars), "object 'random' not found")
 
  # data is NULL. Check environment variables exist and do not generate an error when creating the model matrix.
  expect_error(mylm(random ~ wt + var1), "There was an error generating the dataframe from the environment variables.") 
  expect_error(mylm(mpg ~ wt + var1), "There was an error generating the dataframe from the environment variables.") 
  invalid_param <- c(1:10)
  expect_error(mylm(formula=mpg ~ wt + disp + hp + invalid_param), "There was an error generating the dataframe from the environment variables.") 
})

test_that("mylm gives helpful errors for invalid subset argument", {
  expect_error(mylm(mpg ~ wt + disp + hp, data=mtcars, subset=mtcars), "The argument \"subset\" is not a vector") 
  expect_error(mylm(mpg ~ wt + disp + hp, data=mtcars, subset="abc"), "The argument \"subset\" is not a numerical or logical vector") 
  expect_error(mylm(mpg ~ wt + disp + hp, data=mtcars, subset=c(-2:0)), "The subset is out of range") 
  expect_error(mylm(formula=mpg ~ wt + disp + hp, data=mtcars, subset=c(1:25, 55)), "The subset is out of range") 
  
})


####### Functionality Testing ####### 
test_that("mylm produces valid output", {
  # Create mylm and lm objects from the same data
  result <- mylm(formula=mpg ~ wt + disp + hp, data=mtcars)
  result_lm <- lm(formula=mpg ~ wt + disp + hp, data=mtcars)
  
  # Check object of expected class is created
  expect_s3_class(result, "mylm")
  expect_type(result$coef, "double")
  expect_type(result$call, "language")
  
  # Check/spot check coefficients, std dev, residuals and fitted values are the same as those fitted by lm()
  expect_equal(result$coef,result_lm$coef)
  expect_equal(result$sigma, summary(result_lm)$sigma)
  expect_equal(result$residuals[[2]], result_lm$residuals[[2]])
  expect_equal(result$fitted.values[[3]], result_lm$fitted.values[[3]])
  
})


####### Additional Testing of Related Functions ####### 
test_that("mylm output can be used with additional functions",  {
  # Create mylm and lm objects from the same data
  result <- mylm(formula=mpg ~ wt + disp + hp, data=mtcars)
  result_lm <- lm(formula=mpg ~ wt + disp + hp, data=mtcars)
  
  expect_snapshot(summary(result))
  expect_snapshot(residuals(result))
  expect_snapshot(fitted(result))
  expect_snapshot(vcov(result))
  expect_snapshot(confint(result))
  expect_snapshot(print(result))
  expect_snapshot(print(summary(result)))
  expect_silent(plot(result)) # snapshot does not support plots
  
})


