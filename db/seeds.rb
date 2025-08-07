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

# === USERS ===
admin = User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "password",
  role: :admin
)

manager = User.create!(
  name: "Manager User",
  email: "manager@example.com",
  password: "password",
  role: :manager
)

agent = User.create!(
  name: "Agent User",
  email: "agent@example.com",
  password: "password",
  role: :agent
)

# === BORROWERS ===
borrower1 = Borrower.create!(
  name: "John Doe",
  address: "Village 1, District A",
  phone: "01711111111",
  nid_number: "19901123456",
  manager: manager,
  account_status: "active"
)

borrower2 = Borrower.create!(
  name: "Jane Smith",
  address: "Village 2, District B",
  phone: "01822222222",
  nid_number: "19902234567",
  manager: manager,
  account_status: "pending"
)


# === GUARANTORS ===
guarantor1 = Guarantor.create!(
  name: "Guarantor A",
  address: "Town X",
  phone_number: "01933333333",
  nid_number: "19801234567",
  borrower: borrower1
)

guarantor2 = Guarantor.create!(
  name: "Guarantor B",
  address: "Town Y",
  phone_number: "01944444444",
  nid_number: "19802345678",
  borrower: borrower2
)


# === LOANS ===
loan1 = Loan.create!(
  borrower: borrower1,
  guarantor: guarantor1,
  amount: 10000,
  installment_number: 5,
  installment_amount: 2000,
  grace_period_days: 7,
  first_installment_date: Date.today + 7.days,
  last_installment_date: Date.today + 35.days,
  final_installment_date: Date.today + 42.days,
  security_type: "Gold",
  security_details: "Necklace 22k",
  stamp_sl: "SL123",
  installment_type: "weekly",
  loan_status: "approved"
)

loan2 = Loan.create!(
  borrower: borrower2,
  guarantor: guarantor2,
  amount: 5000,
  installment_number: 5,
  installment_amount: 1000,
  grace_period_days: 7,
  first_installment_date: Date.today + 7.days,
  last_installment_date: Date.today + 35.days,
  final_installment_date: Date.today + 42.days,
  security_type: "Land",
  security_details: "2 decimal plot",
  stamp_sl: "SL456",
  installment_type: "weekly",
  loan_status: "pending"
)


# === INSTALLMENTS ===
loan1.installment_number.times do |i|
  Installment.create!(
    loan: loan1,
    amount: 2000,
    collected_at: nil,
    installment_status: "unpaid"
  )
end

loan2.installment_number.times do |i|
  Installment.create!(
    loan: loan2,
    amount: 1000,
    collected_at: nil,
    installment_status: "unpaid"
  )
end


