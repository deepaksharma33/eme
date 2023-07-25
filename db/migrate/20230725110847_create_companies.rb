class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :company_type

      t.belongs_to :excavator

      t.timestamps
    end
  end
end
