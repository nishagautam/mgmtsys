class Sale < ApplicationRecord
  validates :item_id, presence: true
  validates :unit_sell_price, presence: true
  validates :customer_id, presence: true
  validates :quantity, presence: true
end
