require "matrix"
require "./cost_function"
require "./gradient_descent"

# Input includes: Number of bedrooms, number of bathrooms, area (in 1000 square feets)
x_train = Matrix.rows([
  [2, 2, 1.055],
  [2, 2, 1.173],
  [1, 1, 0.56],
  [1, 1, 0.667],
  [3, 3, 1.561],
  [4, 4, 2.874],
])

# Output is price (in millions)
y_train = Matrix.rows([
  [1.2],
  [1.35],
  [0.83],
  [0.81],
  [1.63],
  [2.98]
])


# We will try to predict price of a house with 3 bedrooms, 2 bathrooms
# with area of 1,389 square feet

initial_params = Matrix.rows([
  [0],
  [0],
  [0],
  [0]
])

cost_function = CostFunction.new(x_train: x_train, y_train: y_train, params: initial_params)
initial_cost_function = cost_function.calculate

p "Initial cost function: #{initial_cost_function}"
p "Optimizing params"

gradient_descent = GradientDescent
  .new(x_train: x_train, y_train: y_train, initial_params: initial_params)

optimized_params = gradient_descent.optimize_params

cost_function.params = optimized_params
optimized_cost_function = cost_function.calculate

p "Optimized cost function: #{optimized_cost_function}"

prediction = (Matrix.rows([[1, 3, 2, 1.389]]) * optimized_params)[0, 0].round(2)

p "The predicted price for a house with 3 bedrooms, 2 bathrooms and area of 1,389 square feets is #{prediction} millions."
