class Installment < ApplicationRecord
  belongs_to :loan
  belongs_to :collected_by, class_name: 'User', foreign_key: 'collected_by_id'

  STATUSES = %w[unpaid paid]

  validates :status, inclusion: { in: STATUSES }

  def paid?
    status == "paid"
  end

  def unpaid?
    status == "unpaid"
  end

end
