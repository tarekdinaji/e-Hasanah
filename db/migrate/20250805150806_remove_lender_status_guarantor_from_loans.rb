class RemoveLenderStatusGuarantorFromLoans < ActiveRecord::Migration[8.0]
  def change
    remove_column :loans, :lender, :string
    remove_column :loans, :status, :string
    remove_column :loans, :guarantor, :string
  end
end
