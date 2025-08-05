class CreateLoans < ActiveRecord::Migration[8.0]
  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.integer :installment_number
      t.decimal :installment_amount
      t.integer :grace_period_days
      t.date :first_installment_date
      t.date :last_installment_date
      t.date :final_installment_date
      t.string :lender
      t.string :status
      t.string :security_type
      t.text :security_details
      t.string :guarantor
      t.string :stamp_sl
      t.string :installment_type

      t.timestamps
    end
  end
end
