class AddCheckToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :check, :boolean, default: false
  end
end
