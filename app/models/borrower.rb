class Borrower < ApplicationRecord
  belongs_to :manager, class_name: 'User'
  has_many :loans
end
