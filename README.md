## Linear Regression
Solve the linear regression problem using gradient descent.

## Environment
ruby: 2.2.2

rspec: 3.4.2

## Sample run
The sample data are retrieved from prices of [ClementiWoods
Condo](http://www.propertyguru.com.sg/project-listings/clementiwoods-condo-109/sale/1)

|Num of bedrooms|Num of bathrooms|Area(1000s sqf)|Price(millions)|
|---------------|:--------------:|:-------------:|--------------:|
|2|2|1.055|1.2|
|2|2|1.173|1.35|
|1|1|0.56|0.83|
|1|1|0.667|0.81|
|3|3|1.561|1.63|
|4|4|2.874|2.98|

Now I want to predict the price of a house with 3 bedrooms, 2 bathrooms and
area of 1076 sqf.

Let's run `sample_run.rb`

```
Initial cost function: 1.3454
Optimizing params"
Optimized cost function: 0.0015818826960609113
The predicted price for a house with 3 bedrooms, 2 bathrooms and area of 1,389
square feets is 1.54 millions."
```

Check the real listed price:
[here](http://www.propertyguru.com.sg/listing/19390742/for-sale-clementiwoods-condo)

## Reference
[Gradient Descent for Linear Regression - by Andrew
Ng](https://www.coursera.org/learn/machine-learning/lecture/kCvQc/gradient-descent-for-linear-regression)
