class CreateEnrolls < ActiveRecord::Migration[5.2]
  def change
    create_table :enrolls do |t|
      t.references :student, foreign_key: true
      t.references :period, foreign_key: true

      t.timestamps
    end
  end
end
