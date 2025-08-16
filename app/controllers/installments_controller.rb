class InstallmentsController < ApplicationController
  before_action :set_loan, only: [:index, :new, :create]
  before_action :set_installment, only: [:show, :edit, :update]

  def index
    @installments = @loan.installments.order(created_at: :asc)
  end

  def show; end

  def new
    @installment = @loan.installments.build
  end

  def create
    @installment = @loan.installments.build(installment_params)
    if @installment.save
      redirect_to loan_installments_path(@loan), notice: "Installment created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @installment.update(installment_params)
      redirect_to @installment, notice: "Installment updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:loan_id])
  end

  def set_installment
    @installment = Installment.find(params[:id])
  end

  def installment_params
    params.require(:installment).permit(:amount, :collected_at, :installment_status)
  end
end
