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

  def Item.search(search, which_option)
    if which_option == "2"
      Item.where([
        'name LIKE ? OR introduction LIKE ?',
        "%#{search}%", "%#{search}%"])
    else
      Item.all
    end
  end
end
