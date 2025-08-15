class RenamePhoneNumberToPhoneOnGuarantors < ActiveRecord::Migration[8.0]
  def change
    rename_column :guarantors, :phone_number, :phone

  end
end
