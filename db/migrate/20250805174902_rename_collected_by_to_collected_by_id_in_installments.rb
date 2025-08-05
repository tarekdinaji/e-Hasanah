class RenameCollectedByToCollectedByIdInInstallments < ActiveRecord::Migration[8.0]
  def change
    rename_column :installments, :collected_by, :collected_by_id

  end
end
