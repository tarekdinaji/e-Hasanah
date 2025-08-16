class LoansController < ApplicationController
  before_action :set_borrower, only: [:index, :new, :create]
  before_action :set_loan, only: [:show, :edit, :update]

  def index
    @loans = if @borrower
      @borrower.loans.order(created_at: :desc)
    else
      Loan.includes(:borrower, :guarantor).order(created_at: :desc)
    end
  end

  def show; end

  def new
    @loan = Loan.new
    @loan.borrower = @borrower if @borrower
    @loan.guarantor = @borrower.guarantor if @borrower&.guarantor
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.borrower ||= @borrower
    @loan.guarantor ||= @borrower&.guarantor

    if @loan.save
      redirect_to @loan, notice: "Loan created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @loan.update(loan_params)
      redirect_to @loan, notice: "Loan updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_borrower
    @borrower = Borrower.find_by(id: params[:borrower_id])
  end

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(
      :amount, :installment_number, :installment_amount, :grace_period_days,
      :first_installment_date, :last_installment_date, :final_installment_date,
      :security_type, :security_details, :stamp_sl, :installment_type, :loan_status,
      :borrower_id, :guarantor_id
    )
  end
end
