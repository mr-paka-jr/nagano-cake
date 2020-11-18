class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def customer_total_price
    sum = 0
    total_record = self.cart_items
  end
  
  def total_price_commission
    self.user_total_price + 800
  end
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :first_name, :last_name, :first_name_kana, :last_name_kana,
            :address, presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }

  validates :is_deleted, inclusion: { in: [true, false] }
end