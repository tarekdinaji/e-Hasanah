class Guarantor < ApplicationRecord
  belongs_to :borrower
  has_many :loans, dependent: :nullify
  
  validates :name, :nid_number, :phone_number, presence: true

end
