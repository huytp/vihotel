class AddUserTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_type, :integer, default: 10
  end
end
