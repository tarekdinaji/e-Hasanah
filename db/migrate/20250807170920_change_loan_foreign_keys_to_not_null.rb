class ChangeLoanForeignKeysToNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :loans, :borrower_id, false
    change_column_null :loans, :guarantor_id, false
  end
end
