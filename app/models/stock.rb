class Stock < ApplicationRecord
  belongs_to :item, required:false
  validates :item_id, presence: true
  validates :quantity, presence: true
  validates :unit_price, presence: true

end
