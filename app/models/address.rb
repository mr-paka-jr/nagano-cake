class Address < ApplicationRecord
  belongs_to :customer

  #orderのnewで使用しています
  def order_address
    self.postal_code + self_address + self_name
  end
end
