class ChangeStatusToStringInInstallments < ActiveRecord::Migration[8.0]
  def change
    change_column :installments, :status, :string

  end
end
