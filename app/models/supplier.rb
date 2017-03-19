class Supplier < ApplicationRecord
validates :name, presence: true
validates :phn_no, presence: true
validates :address, presence:true
end
