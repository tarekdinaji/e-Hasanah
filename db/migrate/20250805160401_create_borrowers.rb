class CreateBorrowers < ActiveRecord::Migration[8.0]
  def change
    create_table :borrowers do |t|
      t.string :name
      t.string :photo
      t.string :address
      t.string :phone
      t.string :nid_number
      t.string :nid_document
      t.string :father_name
      t.string :father_nid_number
      t.string :father_nid_document
      t.string :mother_name
      t.string :mother_nid_number
      t.string :mother_nid_document
      t.string :spouse_name
      t.string :spouse_phone
      t.string :spouse_nid_number
      t.string :spouse_nid_document
      t.references :manager, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
