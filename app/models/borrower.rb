class Borrower < ApplicationRecord
  belongs_to :manager, class_name: 'User'
  has_many :loans
  has_one :guarantor, class_name: 'User', foreign_key: 'guarantor_id'
end
