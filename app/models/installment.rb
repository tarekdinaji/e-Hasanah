class Installment < ApplicationRecord
  
  belongs_to :loan
  belongs_to :collected_by, class_name: 'User', foreign_key: 'collected_by_id', optional: true
 

  STATUSES = %w[unpaid paid].freeze

  validates :amount, presence: true
  validates :status, inclusion: { in: STATUSES }

  
  scope :paid, -> { where(status: "paid") }
  scope :unpaid, -> { where(status: "unpaid") }
  scope :collected_by, ->(user) { where(collected_by_id: user.id) }

  
  def paid?
    status == "paid"
  end

  def unpaid?
    status == "unpaid"
  end
end
