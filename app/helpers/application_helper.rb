module ApplicationHelper

  def addTax(price)
    taxed_price = (price * 1.08).round
  end

end
