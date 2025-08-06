class User < ApplicationRecord
  
  has_many :managed_borrowers, class_name: 'Borrower', foreign_key: 'manager_id'
  has_many :collected_installments, class_name: 'Installment', foreign_key: 'collected_by_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    role == "admin"
  end

  def manager?
    role == "manager"
  end

  def agent?
    role == "agent"
  end
end
