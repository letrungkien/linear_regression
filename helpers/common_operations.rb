module Helpers
  module CommonOperations
    private

    def hypothesis(x_train, params)
      x_train * params
    end

    def add_one_column_vector(matrix)
      row_count = matrix.row_count
      ones_array = [1] * row_count
      Matrix.columns(matrix.to_a.transpose.unshift(ones_array))
    end
  end
end
