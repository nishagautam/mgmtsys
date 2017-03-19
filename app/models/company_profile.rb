class CompanyProfile < ApplicationRecord
  validates :name,presence:true
  validates :address,presence:true
  validates :phone, presence:true
  validates :vat_pan_num, presence:true
  validates :logo_url, presence:true

end
