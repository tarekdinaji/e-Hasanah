class AddAccountStatusToBorrowers < ActiveRecord::Migration[8.0]
  def change
    add_column :borrowers, :account_status, :string, default: "pending"
  end
end
