class CreateSlogans < ActiveRecord::Migration
  def change
    create_table :slogans do |t|
      t.string :content

      t.timestamps null: false
    end
  end
end
