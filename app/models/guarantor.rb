class Guarantor < ApplicationRecord
  belongs_to :borrower
  has_many :loans
end
