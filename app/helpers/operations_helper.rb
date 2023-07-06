module OperationsHelper
  def calculate_total(operations)
    prices = operations.map(&:amount)
    prices.reduce { |a, b| a + b }
  end
end
