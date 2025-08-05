class ChangeInstallmentStatusToInteger < ActiveRecord::Migration[8.0]
  def change
    change_column :installments, :status, :integer, using: 'status::integer', default: 0
  end
end
