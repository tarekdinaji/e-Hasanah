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
Installment.destroy_all
Loan.destroy_all
Guarantor.destroy_all
Borrower.destroy_all
User.destroy_all

# Create admin users
admin_hasanah = User.create!(
  name: "Hasanah Rahman",
  email: "adminhasanah@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: "admin"
)

# Create manager users
manager_rahim = User.create!(
  name: "Rahim Uddin",
  email: "managerrahim@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: "manager"
)

manager_hamid = User.create!(
  name: "Hamid Ali",
  email: "managerhamid@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: "manager"
)

# Create agent users
agent_rakib = User.create!(
  name: "Rakib Hassan",
  email: "agentrakib@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: "agent"
)

agent_oyon = User.create!(
  name: "Oyon Miah",
  email: "agentoyon@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: "agent"
)

agent_rupok = User.create!(
  name: "Rupok Khan",
  email: "agentrupok@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: "agent"
)

# Create borrowers
khadem_grocery = Borrower.create!(
  name: "Khadem Ali",
  address: "Shop #5, Moghbazar, Dhaka-1217",
  phone: "+8801711000001",
  nid_number: "1985123456789",
  nid_document: "khadem_nid.pdf",
  father_name: "Late Abdul Khadem",
  father_nid_number: "1955987654321",
  mother_name: "Rashida Begum",
  mother_nid_number: "1960123987456",
  spouse_name: "Nasreen Khadem",
  spouse_phone: "+8801722000001",
  spouse_nid_number: "1990456789123",
  manager_id: manager_rahim.id,
  account_status: "active"
)

nazmul_tailor = Borrower.create!(
  name: "Md. Nazmul Haque",
  address: "Tailoring Shop, Elephant Road, Dhaka-1205",
  phone: "+8801733000002",
  nid_number: "1987567891234",
  father_name: "Abdur Rahman Haque",
  father_nid_number: "1958321654987",
  mother_name: "Salma Haque",
  mother_nid_number: "1962789456123",
  spouse_name: "Fatema Nazmul",
  spouse_phone: "+8801744000002",
  spouse_nid_number: "1992147258369",
  manager_id: manager_rahim.id,
  account_status: "active"
)

rukshana_parlor = Borrower.create!(
  name: "Rukshana Akter",
  address: "Ladies Beauty Parlor, Dhanmondi-32, Dhaka",
  phone: "+8801755000003",
  nid_number: "1990741852963",
  father_name: "Mohammad Karim",
  father_nid_number: "1965159753486",
  mother_name: "Rashida Karim",
  mother_nid_number: "1970486159753",
  spouse_name: "Rafiq Ahmed",
  spouse_phone: "+8801766000003",
  spouse_nid_number: "1988963741852",
  manager_id: manager_rahim.id,
  account_status: "active"
)

ashraf_vendor = Borrower.create!(
  name: "Md. Ashraful Islam",
  address: "Vegetable Stall, Karwan Bazar, Dhaka",
  phone: "+8801777000004",
  nid_number: "1983963741852",
  father_name: "Mofizur Rahman",
  father_nid_number: "1955753951486",
  mother_name: "Amena Begum",
  mother_nid_number: "1960486951753",
  spouse_name: "Nasreen Ashraf",
  spouse_phone: "+8801788000004",
  spouse_nid_number: "1988852741963",
  manager_id: manager_rahim.id,
  account_status: "pending"
)

shipon_rickshaw = Borrower.create!(
  name: "Shipon Miah",
  address: "Room #12, Korail Basti, Mohakhali, Dhaka",
  phone: "+8801799000005",
  nid_number: "1986159753482",
  father_name: "Late Siraj Miah",
  father_nid_number: "1950852963741",
  mother_name: "Rahima Miah",
  mother_nid_number: "1955741963852",
  spouse_name: "Rashida Shipon",
  spouse_phone: "+8801700000005",
  spouse_nid_number: "1992369258147",
  manager_id: manager_hamid.id,
  account_status: "active"
)

rashida_tea = Borrower.create!(
  name: "Rashida Begum",
  address: "Tea Stall, Panthapath Bus Stop, Dhaka",
  phone: "+8801711000006",
  nid_number: "1989654321987",
  father_name: "Abdul Majid",
  father_nid_number: "1962147258369",
  mother_name: "Khaleda Majid",
  mother_nid_number: "1967258369147",
  manager_id: manager_hamid.id,
  account_status: "active"
)

monir_rejected = Borrower.create!(
  name: "Monir Hossain",
  address: "Fish Market, Wari, Old Dhaka",
  phone: "+8801722000007",
  nid_number: "1984987654321",
  father_name: "Nazir Hossain",
  father_nid_number: "1958741963852",
  mother_name: "Salma Hossain",
  mother_nid_number: "1963852741963",
  manager_id: manager_hamid.id,
  account_status: "closed"
)

# Create guarantors
guarantee_khadem = Guarantor.create!(
  name: "Majid Wholesale Supplier",
  address: "Wholesale Market, Badamtoli, Dhaka",
  nid_number: "1975123456789",
  phone: "+8801811000001",
  borrower_id: khadem_grocery.id
)

guarantee_nazmul = Guarantor.create!(
  name: "Shahid Business Partner",
  address: "Tailoring Association, New Market, Dhaka",
  nid_number: "1985456789123",
  phone: "+8801833000002",
  borrower_id: nazmul_tailor.id
)

guarantee_rukshana = Guarantor.create!(
  name: "Shamima Senior Beautician",
  address: "Beauty Training Center, Dhanmondi, Dhaka",
  nid_number: "1978789456123",
  phone: "+8801844000003",
  borrower_id: rukshana_parlor.id
)

guarantee_shipon = Guarantor.create!(
  name: "Alamgir Garage Master",
  address: "Rickshaw Garage, Tejgaon, Dhaka",
  nid_number: "1976147258369",
  phone: "+8801866000005",
  borrower_id: shipon_rickshaw.id
)

guarantee_rashida = Guarantor.create!(
  name: "Hafez Community Leader",
  address: "Panthapath Community Center, Dhaka",
  nid_number: "1970963741852",
  phone: "+8801877000006",
  borrower_id: rashida_tea.id
)

# Create loans for approved borrowers only
loan_grocery = Loan.create!(
  amount: 60000.00,
  installment_number: 12,
  installment_amount: 5500.00,
  grace_period_days: 7,
  first_installment_date: 6.months.ago.to_date,
  last_installment_date: 6.months.from_now.to_date,
  final_installment_date: 7.months.from_now.to_date,
  security_type: "Shop Inventory",
  security_details: "Grocery shop equipment and inventory",
  stamp_sl: "SL001-GROCERY",
  installment_type: "monthly",
  loan_status: "active",
  borrower_id: khadem_grocery.id,
  guarantor_id: guarantee_khadem.id
)

loan_tailoring = Loan.create!(
  amount: 85000.00,
  installment_number: 15,
  installment_amount: 6500.00,
  grace_period_days: 5,
  first_installment_date: 4.months.ago.to_date,
  last_installment_date: 11.months.from_now.to_date,
  final_installment_date: 12.months.from_now.to_date,
  security_type: "Sewing Equipment",
  security_details: "Industrial sewing machines and equipment",
  stamp_sl: "SL002-TAILORING",
  installment_type: "monthly", 
  loan_status: "active",
  borrower_id: nazmul_tailor.id,
  guarantor_id: guarantee_nazmul.id
)

loan_parlor = Loan.create!(
  amount: 45000.00,
  installment_number: 10,
  installment_amount: 5000.00,
  grace_period_days: 10,
  first_installment_date: 2.months.ago.to_date,
  last_installment_date: 8.months.from_now.to_date,
  final_installment_date: 9.months.from_now.to_date,
  security_type: "Parlor Equipment",
  security_details: "Beauty parlor equipment and furniture",
  stamp_sl: "SL003-PARLOR",
  installment_type: "monthly",
  loan_status: "active",
  borrower_id: rukshana_parlor.id,
  guarantor_id: guarantee_rukshana.id
)

loan_rickshaw = Loan.create!(
  amount: 38000.00,
  installment_number: 10,
  installment_amount: 4200.00,
  grace_period_days: 3,
  first_installment_date: 12.months.ago.to_date,
  last_installment_date: 2.months.ago.to_date,
  final_installment_date: 1.month.ago.to_date,
  security_type: "Rickshaw Ownership",
  security_details: "Rickshaw registration documents",
  stamp_sl: "SL004-RICKSHAW",
  installment_type: "monthly",
  loan_status: "complete",
  borrower_id: shipon_rickshaw.id,
  guarantor_id: guarantee_shipon.id
)

loan_tea = Loan.create!(
  amount: 28000.00,
  installment_number: 8,
  installment_amount: 3800.00,
  grace_period_days: 5,
  first_installment_date: 1.month.from_now.to_date,
  last_installment_date: 8.months.from_now.to_date,
  final_installment_date: 9.months.from_now.to_date,
  security_type: "Tea Stall Equipment",
  security_details: "Tea preparation equipment and furniture",
  stamp_sl: "SL005-TEASTALL",
  installment_type: "monthly",
  loan_status: "active",
  borrower_id: rashida_tea.id,
  guarantor_id: guarantee_rashida.id
)

# Create installments for loans
all_loans = [loan_grocery, loan_tailoring, loan_parlor, loan_rickshaw, loan_tea]

all_loans.each do |loan|
  loan.installment_number.times do |i|
    installment_date = loan.first_installment_date + i.months
    
    if loan.loan_status == 'complete'
      # All installments paid for completed loans
      status = 'paid'
      collected_at = installment_date + rand(0..loan.grace_period_days).days
    elsif installment_date < Date.current
      # Past installments - mostly paid, some overdue
      if rand < 0.85
        status = 'paid'
        collected_at = installment_date + rand(0..loan.grace_period_days).days
      else
        status = 'deferred'
        collected_at = nil
      end
    elsif installment_date <= Date.current + 2.weeks
      # Current installments - some early payments
      if rand < 0.3
        status = 'paid'
        collected_at = installment_date - rand(1..7).days
      else
        status = 'unpaid'
        collected_at = nil
      end
    else
      # Future installments
      status = 'unpaid'
      collected_at = nil
    end

    Installment.create!(
      loan_id: loan.id,
      amount: loan.installment_amount,
      installment_status: status,
      collected_at: collected_at
    )
  end
end