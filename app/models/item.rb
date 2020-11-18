class Item < ApplicationRecord

  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, through: :order_details

  attachment :image

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :is_active, inclusion: { in: [true, false] }

end
