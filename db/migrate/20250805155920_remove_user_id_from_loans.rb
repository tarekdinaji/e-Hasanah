class RemoveUserIdFromLoans < ActiveRecord::Migration[8.0]
  def change
    remove_reference :loans, :user, null: false, foreign_key: true
  end
end
