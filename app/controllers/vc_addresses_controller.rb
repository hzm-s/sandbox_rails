class VcAddressesController < ApplicationController
  helper_method :current_inquiry

  def create
    @vc_address = current_inquiry.vc_addresses.build(form_params)
    if @vc_address.filled? && @vc_address.save
      render :create
    else
      render :new
    end
  end

  private

    def form_params
      params.require(:form).permit(:currency, :address)
    end

    def current_inquiry
      @current_inquiry ||= Inquiry.find(params[:inquiry_id])
    end
end
