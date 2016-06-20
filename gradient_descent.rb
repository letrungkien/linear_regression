require "matrix"
require "./helpers/common_operations"

class GradientDescent
  include Helpers::CommonOperations

  def initialize(x_train:,
                 y_train:,
                 initial_params:,
                 learning_rate: 0.01,
                 iterations: 5_000)
    @x_train = add_one_column_vector(x_train)
    @y_train = y_train
    @initial_params = initial_params
    @learning_rate = learning_rate
    @iterations = iterations
  end

  def optimize_params
    optimized_params = @initial_params.clone
    scalar = @learning_rate.to_f / @x_train.row_count

    @iterations.times do
      optimized_params -= scalar * summed_error(optimized_params)
    end

    optimized_params
  end

  private

  def summed_error(params)
    @x_train.transpose * (hypothesis(@x_train, params) - @y_train)
  end
end
