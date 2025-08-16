class BorrowersController < ApplicationController
  before_action :set_borrower, only: [:show, :edit, :update]

  def index
    @borrowers = Borrower.order(created_at: :desc)
  end

  def show; end

  def new
    @borrower = Borrower.new(manager_id: current_user.id)
    @borrower.build_guarantor
  end

  def create
    @borrower = Borrower.new(borrower_params.merge(manager_id: current_user.id))
    if @borrower.save
      redirect_to @borrower, notice: "Borrower created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @borrower.build_guarantor unless @borrower.guarantor
  end

  def update
    if @borrower.update(borrower_params)
      redirect_to @borrower, notice: "Borrower updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_borrower
    @borrower = Borrower.find(params[:id])
  end

  def borrower_params
    params.require(:borrower).permit(
      :name, :photo, :address, :phone, :nid_number, :nid_document,
      :father_name, :father_nid_number, :father_nid_document,
      :mother_name, :mother_nid_number, :mother_nid_document,
      :spouse_name, :spouse_phone, :spouse_nid_number, :spouse_nid_document,
      :account_status,
      guarantor_attributes: [:id, :name, :photo, :address, :nid_number, :nid_document, :phone ]
    )
  end
end
