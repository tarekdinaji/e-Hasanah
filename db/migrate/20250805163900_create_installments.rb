class CreateInstallments < ActiveRecord::Migration[8.0]
  def change
    create_table :installments do |t|
      t.references :loan, null: false, foreign_key: true
      t.decimal :amount
      t.string :status
      t.integer :collected_by
      t.datetime :collected_at

      t.timestamps
    end
  end
end
