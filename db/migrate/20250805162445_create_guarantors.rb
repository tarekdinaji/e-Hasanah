class CreateGuarantors < ActiveRecord::Migration[8.0]
  def change
    create_table :guarantors do |t|
      t.string :name
      t.string :photo
      t.string :address
      t.string :nid_number
      t.string :nid_document
      t.string :phone_number
      t.references :borrower, null: false, foreign_key: true

      t.timestamps
    end
  end
end
