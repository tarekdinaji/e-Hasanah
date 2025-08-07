class RemoveCollectedByIdFromInstallments < ActiveRecord::Migration[8.0]
  def change
    remove_column :installments, :collected_by_id, :integer
  end
end
