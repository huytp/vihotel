class AddFriendlyToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :friendly, :string
  end
end
