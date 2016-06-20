require "matrix"

class CostFunction
  def initialize(x_train:, y_train:, thetas:)
    @x_train = add_one_column_vector(x_train)
    @y_train = y_train
    @thetas = thetas
  end

  def calculate
    scalar = 1.0 / (2 * train_size)
    square_difference = (hypothesis - @y_train).map { |e| e**2 }
    sum_square_difference = square_difference.to_a.flatten.reduce(:+)
    scalar * sum_square_difference
  end

  private

  def hypothesis
    @x_train * @thetas
  end

  def add_one_column_vector(matrix)
    row_count = matrix.row_count
    ones_array = [1] * row_count
    Matrix.columns(matrix.to_a.transpose.unshift(ones_array))
  end

  def train_size
    @x_train.row_count
  end
end
