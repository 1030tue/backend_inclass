class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.references :teacher, foreign_key: true
      t.string :classname
      t.datetime :date
      t.integer :period_num
      t.decimal :duration
      t.timestamps
    end
  end
end
