require "matrix"
require "./cost_function"
require "./gradient_descent"

RSpec.describe GradientDescent do
  let(:x_train) do
    Matrix.rows([
      [1, 2, 4],
      [3, 1, 3]
    ])
  end

  let(:y_train) do
    Matrix.rows([
      [5],
      [6]
    ])
  end

  let(:initial_params) do
    Matrix.rows([
      [1],
      [1],
      [1],
      [1]
    ])
  end

  let(:gradient_descent) do
    described_class.new(
      x_train: x_train,
      y_train: y_train,
      initial_params: initial_params
    )
  end

  describe "#optimize_params" do
    let(:initial_cost_function) do
      CostFunction
        .new(x_train: x_train, y_train: y_train, params: initial_params)
        .calculate
    end

    let(:optimized_cost_function) do
      optimized_params = gradient_descent.optimize_params
      CostFunction
        .new(x_train: x_train, y_train: y_train, params: optimized_params)
        .calculate
    end

    it { expect(initial_cost_function).to be > optimized_cost_function }
  end
end
