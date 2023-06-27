class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.integer :code
      t.boolean :listing_status
      t.string :name
      t.string :name_kana
      t.string :postal_code
      t.string :address
      t.string :representative_name
      t.string :representative_name_kana
      t.string :phone
      t.integer :revenue_2022
      t.integer :profit_2022
      t.integer :revenue_2021
      t.integer :profit_2021
      t.integer :revenue_2020
      t.integer :profit_2020

      t.timestamps
    end
  end
end
