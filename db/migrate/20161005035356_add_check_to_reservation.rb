class AddCheckToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :check, :boolean, default: false
  end
end
