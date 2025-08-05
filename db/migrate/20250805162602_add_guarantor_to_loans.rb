class AddGuarantorToLoans < ActiveRecord::Migration[8.0]
  def change
    add_reference :loans, :guarantor, foreign_key: true
  end
end
