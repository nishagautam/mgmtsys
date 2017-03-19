class Item < ApplicationRecord
  has_one :stock, inverse_of: :item,
          dependent: :destroy
  belongs_to :item_group
  accepts_nested_attributes_for :stock
  validates :name, presence: true
  validates :unit_id, presence: true
  belongs_to :unit
end
