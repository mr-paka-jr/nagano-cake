class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :first_name, :last_name, :first_name_kana, :last_name_kana,
            :address, presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }

  validates :is_deleted, inclusion: { in: [true, false] }

  def Customer.search(search, which_option)
    if which_option == "1"
      Customer.where([
        'last_name LIKE ? OR first_name LIKE ? OR last_name_kana LIKE ? OR first_name_kana LIKE ? OR address LIKE ? OR telephone_number LIKE ?',
        "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Customer.all
    end
  end

end