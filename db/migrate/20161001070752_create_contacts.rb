class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
