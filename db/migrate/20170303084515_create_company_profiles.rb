class CreateCompanyProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :company_profiles do |t|
      t.string :name
      t.string :address
      t.string :vdc_mun
      t.string :ward_no
      t.string :phone
      t.string :vat_pan_num
      t.string :logo_url
      t.string :district
      t.string :zone
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
