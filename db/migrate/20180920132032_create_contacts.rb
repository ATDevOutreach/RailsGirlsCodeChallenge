class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phonenumber
      t.boolean :is_checked

      t.timestamps
    end
  end
end
