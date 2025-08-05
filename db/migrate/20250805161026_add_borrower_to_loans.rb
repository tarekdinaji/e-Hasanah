class AddBorrowerToLoans < ActiveRecord::Migration[8.0]
  def change
    add_reference :loans, :borrower, foreign_key: true
  end
end
