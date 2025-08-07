class Borrower < ApplicationRecord
  belongs_to :manager, class_name: 'User'
  has_many :loans, dependent: :destroy
  has_one :guarantor, dependent: :destroy
  
  ACCOUNT_STATUSES = %w[active pending closed].freeze

  validates :account_status, inclusion: { in: ACCOUNT_STATUSES }

  scope :active,  -> { where(account_status: 'active') }
  scope :pending, -> { where(account_status: 'pending') }
  scope :closed,  -> { where(account_status: 'closed') }

  def active?
    account_status == 'active'
  end

  def pending?
    account_status == 'pending'
  end

  def closed?
    account_status == 'closed'
  end


  validates :name, :address, :phone_number, presence: true

  accepts_nested_attributes_for :guarantor, allow_destroy: true
end

