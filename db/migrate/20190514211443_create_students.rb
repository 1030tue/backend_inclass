class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :img
      t.integer :age
      t.integer :grade
      t.string :gender
      t.string :guardians_email
      t.string :guardians_phone
      t.boolean :inclass, :default => true
      t.integer :demerits, :default => 0
      t.timestamps
    end
  end
end
