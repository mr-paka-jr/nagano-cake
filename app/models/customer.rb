class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :address, dependent: :destroy

  validates :first_name, :last_name, :first_name_kana, :last_name_kana,
            :address, presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
end