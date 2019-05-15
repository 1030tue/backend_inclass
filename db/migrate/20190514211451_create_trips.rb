class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :student, foreign_key: true
      t.references :period, foreign_key: true
      t.string :destination
      t.decimal :duration
      t.datetime :endtime
      t.timestamps
    end
  end
end
