class Loan < ApplicationRecord
  belongs_to :borrower
  belongs_to :guarantor
  has_many :installments, dependent: :destroy
  

  validates :amount, :installment_number, :installment_amount, :grace_period_days,
            :first_installment_date, :last_installment_date, :final_installment_date,
            :loan_status, :installment_type, presence: true
end
