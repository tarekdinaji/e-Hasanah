class ReplaceStatusWithInstallmentStatusInInstallments < ActiveRecord::Migration[6.1]
  def change
    # Remove old status column
    remove_column :installments, :status, :string

    # Add new installment_status column
    add_column :installments, :installment_status, :string, default: "unpaid"
  end
end

