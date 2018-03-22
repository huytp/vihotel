class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.decimal :currency

      t.timestamps null: false
    end
  end
end
