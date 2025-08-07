class Loan < ApplicationRecord
  belongs_to :borrower
  belongs_to :guarantor
  has_many :installments, dependent: :destroy


  STATUSES = %w[active halt grace complete default].freeze
  INSTALLMENT_TYPES = %w[weekly monthly daily].freeze

  validates :amount, :installment_number, :installment_amount, :grace_period_days,
            :first_installment_date, :last_installment_date, :final_installment_date,
            :loan_status, :installment_type, presence: true

  validates :loan_status, inclusion: { in: STATUSES }
  validates :installment_type, inclusion: { in: INSTALLMENT_TYPES }


  def active?
    loan_status == "active"
  end

  def complete?
    loan_status == "complete"
  end
  def halt?
    loan_status == "halt"
  end
  def grace?
    loan_status == "grace"
  end

  def default?
    loan_status == "default"
  end

end
