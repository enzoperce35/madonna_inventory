module InventoryUpdatesHelper
  def ommit_zero_decimal(num)
    num == num.to_i ? num.to_i : num
  end

  def create_dots
    '.' * 200
  end
end
