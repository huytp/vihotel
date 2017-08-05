class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :address
      t.string :phone
      t.string :mobile
      t.string :fax
      t.string :email
      t.string :youtube

      t.timestamps null: false
    end
  end
end
