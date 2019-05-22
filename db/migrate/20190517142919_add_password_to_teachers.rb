class AddPasswordToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :password_digest, :string
    add_column :teachers, :isAdmin, :boolean, :default => false
  end
end
