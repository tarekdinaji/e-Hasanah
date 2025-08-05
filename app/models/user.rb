class User < ApplicationRecord
  has_many :loans, dependent: :destroy
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
