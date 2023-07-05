module CategoriesHelper
  def calculate_total(category)
    operations = category.operations
    prices = operations.map(&:amount)
    prices.reduce { |a, b| a + b }
  end
end
