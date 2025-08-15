class Guarantor < ApplicationRecord
  belongs_to :borrower
  has_many :loans, dependent: :nullify
  
  validates :name, :address, :nid_number, :phone, presence: true

end

