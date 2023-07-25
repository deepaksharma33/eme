class CreateDigSiteInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :dig_site_infos do |t|
      t.text :well_known_text

      t.belongs_to :ticket

      t.timestamps
    end
  end
end
