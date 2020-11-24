class Address < ApplicationRecord
  belongs_to :customer

  validates :customer_id, :name, :address, presence: true

  #orderのnewで使用しています
  def order_address
    self.postal_code + self.address + self.name
  end
end
