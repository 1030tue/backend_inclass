class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :fullname
      t.string :email
      t.string :img
      t.string :phone
      t.string :subject
      t.timestamps
    end
  end
end
