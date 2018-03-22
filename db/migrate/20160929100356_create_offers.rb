class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.string :summary
      t.text :content

      t.timestamps null: false
    end
  end
end
