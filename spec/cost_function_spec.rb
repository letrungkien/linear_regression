require "./cost_function"
require "matrix"

RSpec.describe CostFunction do
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

  let(:thetas) do
    Matrix.rows([
      [1],
      [1],
      [1],
      [1]
    ])
  end

  let(:cost_function) do
    described_class.new(x_train: x_train, y_train: y_train, thetas: thetas)
  end

  describe "#calculate" do
    subject { cost_function.calculate }

    it { is_expected.to eq(3.25) }
  end
end
