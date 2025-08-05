class AddLoanStatusToLoans < ActiveRecord::Migration[8.0]
  def change
    add_column :loans, :loan_status, :string
  end
end
