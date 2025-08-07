class Installment < ApplicationRecord
  belongs_to :loan

 
  INSTALLMENT_STATUSES = %w[unpaid paid deferred defaulted].freeze

  validates :installment_status, inclusion: { in: INSTALLMENT_STATUSES }
  validates :amount, presence: true

  scope :paid,      -> { where(installment_status: 'paid') }
  scope :unpaid,    -> { where(installment_status: 'unpaid') }
  scope :deferred,  -> { where(installment_status: 'deferred') }
  scope :defaulted, -> { where(installment_status: 'defaulted') }

  def paid?
    installment_status == 'paid'
  end

  def unpaid?
    installment_status == 'unpaid'
  end

  def deferred?
    installment_status == 'deferred'
  end

  def defaulted?
    installment_status == 'defaulted'
  end
end
