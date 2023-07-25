class CreateDatetimes < ActiveRecord::Migration[7.0]
  def change
    create_table :datetimes do |t|
      t.string :response_due_date_time
      t.belongs_to :ticket

      t.timestamps
    end
  end
end
