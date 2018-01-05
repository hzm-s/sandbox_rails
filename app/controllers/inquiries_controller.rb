class InquiriesController < ApplicationController

  def index
    @inquiries = Inquiry.all.order(:created_at)
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def new
    @form = Inquiry.new_with_default
  end

  def create
    inquiry = Inquiry.new(form_params)
    if inquiry.save
      redirect_to inquiry_vc_addresses_url(inquiry)
    end
  end

  private

    def form_params
      params.require(:form).permit(:title, :description)
    end
end
