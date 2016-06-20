require "matrix"
require "./helpers/common_operations"

class CostFunction
  include Helpers::CommonOperations

  attr_writer :params

  def initialize(x_train:, y_train:, params:)
    @x_train = add_one_column_vector(x_train)
    @y_train = y_train
    @params = params
  end

  def calculate
    scalar = 1.0 / (2 * @x_train.row_count)
    square_difference = (hypothesis(@x_train, @params) - @y_train).map { |e| e**2 }
    summed_square_difference = square_difference.to_a.flatten.reduce(:+)

    scalar * summed_square_difference
  end
end
