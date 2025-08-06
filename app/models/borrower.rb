class Borrower < ApplicationRecord
  belongs_to :manager, class_name: 'User'
  has_many :loans, dependent: :destroy
  has_one :guarantor, dependent: :destroy

  validates :name, :address, :phone_number, presence: true

  accepts_nested_attributes_for :guarantor, allow_destroy: true
end

