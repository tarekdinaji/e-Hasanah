class Guarantor < ApplicationRecord
  belongs_to :borrower
  has_many :loans
  
  validates :name, :address, :nid_number, :phone, presence: true

end

