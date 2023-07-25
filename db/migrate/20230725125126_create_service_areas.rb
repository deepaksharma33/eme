class CreateServiceAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :service_areas do |t|
      t.text :primary_service_area_code
      t.text :additional_service_area_codes

      t.belongs_to :ticket

      t.timestamps
    end
  end
end
