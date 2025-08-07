class Installment < ApplicationRecord
  belongs_to :loan
  belongs_to :collected_by, class_name: 'User', optional: true, foreign_key: 'collected_by_id'

  STATUSES = %w[paid unpaid deferred default].freeze

  validates :installment_status, inclusion: { in: STATUSES }

  scope :paid,     -> { where(installment_status: 'paid') }
  scope :unpaid,   -> { where(installment_status: 'unpaid') }
  scope :deferred, -> { where(installment_status: 'deferred') }
  scope :defaulted,-> { where(installment_status: 'default') }

  def paid?
    installment_status == "paid"
  end

  def unpaid?
    installment_status == "unpaid"
  end

  def deferred?
    installment_status == "deferred"
  end

  def defaulted?
    installment_status == "default"
  end
end
