module ApplicationHelper

  def addTax(price)
    taxed_price = (price * 1.1).round
  end

end
