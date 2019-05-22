class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :fullname
      t.string :email
      t.binary :img
      t.string :phone
      t.string :subject
      t.string :password_digest
      t.boolean :isAdmin, :default => false
      t.timestamps
    end
  end
end
