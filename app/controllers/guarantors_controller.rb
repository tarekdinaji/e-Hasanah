class GuarantorsController < ApplicationController
    before_action :set_borrower
    before_action :set_guarantor, only: [:show, :edit, :update]
  
    def show; end
  
    def new
      @guarantor = @borrower.build_guarantor
    end
  
    def create
      @guarantor = @borrower.build_guarantor(guarantor_params)
      if @guarantor.save
        redirect_to borrower_guarantor_path(@borrower), notice: "Guarantor created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit; end
  
    def update
      if @guarantor.update(guarantor_params)
        redirect_to borrower_guarantor_path(@borrower), notice: "Guarantor updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    
  
    private
  
    def set_borrower
      @borrower = Borrower.find(params[:borrower_id])
    end
  
    def set_guarantor
      @guarantor = @borrower.guarantor
    end
  
    def guarantor_params
      params.require(:guarantor).permit(:name, :photo, :address, :nid_number, :nid_document, :phone)
    end
end
  