# mylm output can be used with additional functions

    Code
      summary(result)
    Output
      Linear model mylm object
      
      Call:
      mylm(formula = mpg ~ wt + disp + hp, data = mtcars)
      
      Coefficients:
                       Estimate Std. Error     t value     Pr(>|t|)    
      (Intercept) 37.1055052690 2.11081525 17.57875558 1.161936e-16 ***
      wt          -3.8008905826 1.06619064 -3.56492586 1.330991e-03  **
      disp        -0.0009370091 0.01034974 -0.09053451 9.285070e-01    
      hp          -0.0311565508 0.01143579 -2.72447633 1.097103e-02   *
      ---
      Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
      
      Residual standard error:  2.63893  on  28  degrees of freedom
      Multiple R-squared: 0.8268361 Adjusted R-squared: 0.8082829
      F-statistic: 44.56552 on 3 and 28 DF, p-value 8.649588e-11
      
      Variance Covariance matrix:
                   (Intercept)           wt          disp            hp
      (Intercept)  4.455541001 -1.905007074  1.391994e-02 -9.003279e-03
      wt          -1.905007074  1.136762479 -8.795663e-03  1.889117e-03
      disp         0.013919942 -0.008795663  1.071172e-04 -7.046532e-05
      hp          -0.009003279  0.001889117 -7.046532e-05  1.307774e-04
      

---

    Code
      residuals(result)
    Output
       [1] -2.5700299 -1.6008028 -2.4886829  0.1833269  0.4592780 -2.3721590
       [7] -1.2656477  1.4885011  0.7591033 -0.8411432 -2.2411432  0.6307257
      [13]  0.2384229 -1.6715326  0.0785315  1.0402079  5.4885456  5.7865290
      [19]  1.1240053  5.8609261 -3.1015898 -3.2549189 -3.8911127 -1.2487773
      [25]  2.5361190 -0.3204259 -0.0236311  2.6550420 -0.7024625 -1.2887756
      [31]  2.1831584 -1.6295873

---

    Code
      fitted(result)
    Output
       [1] 23.570030 22.600803 25.288683 21.216673 18.240722 20.472159 15.565648
       [8] 22.911499 22.040897 20.041143 20.041143 15.769274 17.061577 16.871533
      [15] 10.321469  9.359792  9.211454 26.613471 29.275995 28.039074 24.601590
      [22] 18.754919 19.091113 14.548777 16.663881 27.620426 26.023631 27.744958
      [29] 16.502463 20.988776 12.816842 23.029587

---

    Code
      vcov(result)
    Output
                   (Intercept)           wt          disp            hp
      (Intercept)  4.455541001 -1.905007074  1.391994e-02 -9.003279e-03
      wt          -1.905007074  1.136762479 -8.795663e-03  1.889117e-03
      disp         0.013919942 -0.008795663  1.071172e-04 -7.046532e-05
      hp          -0.009003279  0.001889117 -7.046532e-05  1.307774e-04

---

    Code
      confint(result)
    Output
                   2.500000 %  97.500000 %
      (Intercept) 32.78169625 41.429314293
      wt          -5.98488310 -1.616898063
      disp        -0.02213750  0.020263482
      hp          -0.05458171 -0.007731388

---

    Code
      print(result)
    Output
      Linear model mylm object
      
      Call:
      mylm(formula = mpg ~ wt + disp + hp, data = mtcars)
      
      Coefficients:
        (Intercept)            wt          disp            hp 
      37.1055052690 -3.8008905826 -0.0009370091 -0.0311565508 
      

---

    Code
      print(summary(result))
    Output
      Linear model mylm object
      
      Call:
      mylm(formula = mpg ~ wt + disp + hp, data = mtcars)
      
      Coefficients:
                       Estimate Std. Error     t value     Pr(>|t|)    
      (Intercept) 37.1055052690 2.11081525 17.57875558 1.161936e-16 ***
      wt          -3.8008905826 1.06619064 -3.56492586 1.330991e-03  **
      disp        -0.0009370091 0.01034974 -0.09053451 9.285070e-01    
      hp          -0.0311565508 0.01143579 -2.72447633 1.097103e-02   *
      ---
      Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
      
      Residual standard error:  2.63893  on  28  degrees of freedom
      Multiple R-squared: 0.8268361 Adjusted R-squared: 0.8082829
      F-statistic: 44.56552 on 3 and 28 DF, p-value 8.649588e-11
      
      Variance Covariance matrix:
                   (Intercept)           wt          disp            hp
      (Intercept)  4.455541001 -1.905007074  1.391994e-02 -9.003279e-03
      wt          -1.905007074  1.136762479 -8.795663e-03  1.889117e-03
      disp         0.013919942 -0.008795663  1.071172e-04 -7.046532e-05
      hp          -0.009003279  0.001889117 -7.046532e-05  1.307774e-04
      

