class LensesController < ApplicationController

  def show
    @lens = Lens.find(params[:id])
  end

  def update
    @lens = Lens.find(params[:id])
    @lens.update!(lens_params)
  end

  private

    def lens_params
      params.require(:lens).permit(:name)
    end
end
