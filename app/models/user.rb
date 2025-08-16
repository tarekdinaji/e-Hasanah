class User < ApplicationRecord
  
  has_many :managed_borrowers, class_name: 'Borrower', foreign_key: 'manager_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { admin: 0, manager: 1, agent: 2 }

         
  validates :name, presence: true
  
end
