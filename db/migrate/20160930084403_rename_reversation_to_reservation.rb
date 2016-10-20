class RenameReversationToReservation < ActiveRecord::Migration
  def change
    rename_table :reversations, :reservations
  end
end
