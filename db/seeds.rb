# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data

Installment.delete_all
Loan.delete_all
Guarantor.delete_all
Borrower.delete_all
User.delete_all

# 1. Create a User (Manager)
manager = User.create!(
  email: "manager@example.com",
  password: "123456",
  name: "Manager User",
  role: "manager"
)

# 2. Create a Borrower
borrower = Borrower.create!(
  name: "Rahim Uddin",
  address: "123 Dhaka Road",
  phone: "01712345678",
  nid_number: "1990123456",
  manager_id: manager.id
)

# 3. Create a Guarantor
guarantor = Guarantor.create!(
  name: "Karim Mia",
  address: "456 Chittagong Road",
  phone_number: "01812345678",
  nid_number: "1987654321",
  borrower_id: borrower.id
)

# 4. Create a Loan
loan = Loan.create!(
  amount: 50000,
  installment_number: 10,
  installment_amount: 5000,
  grace_period_days: 5,
  first_installment_date: Date.today + 7,
  last_installment_date: Date.today + 70,
  final_installment_date: Date.today + 77,
  security_type: "Land Document",
  security_details: "1 Katha land at Dhanmondi",
  stamp_sl: "STMP1234",
  installment_type: "weekly",
  loan_status: "approved",
  borrower_id: borrower.id,
  guarantor_id: guarantor.id
)

# 5. Create 10 Installments
10.times do |i|
  Installment.create!(
    loan_id: loan.id,
    amount: 5000,
    status: i < 5 ? "paid" : "unpaid", # first 5 paid, rest unpaid
    collected_by_id: i < 5 ? manager.id : nil,
    collected_at: i < 5 ? (Date.today + i * 7) : nil
  )
end


