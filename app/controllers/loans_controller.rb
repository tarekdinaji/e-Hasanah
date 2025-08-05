class LoansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_loan, only: %i[show edit update destroy]

  def index
    @loans = current_user.loans
  end

  def show
  end

  def new
    @loan = current_user.loans.build
  end

  def create
    @loan = current_user.loans.build(loan_params)
    if @loan.save
      redirect_to @loan, notice: "Loan was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @loan.update(loan_params)
      redirect_to @loan, notice: "Loan was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @loan.destroy
    redirect_to loans_path, notice: "Loan was successfully deleted."
  end

  private

  def set_loan
    @loan = current_user.loans.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(
      :amount, :installment_number, :installment_amount,
      :grace_period_days, :first_installment_date, :last_installment_date,
      :final_installment_date, :lender, :status, :security_type,
      :security_details, :guarantor, :stamp_sl, :installment_type
    )
  end
end
