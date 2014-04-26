class RatingsController < ApplicationController
  def new
    @rating = Rating.new(theme_park: ThemePark.find(params[:theme_park_id]))
  end

  def create
    @theme_park = ThemePark.find(params[:theme_park_id])
    @rating = Rating.new(theme_park: @theme_park, rating: params[:rating][:rating], user: current_user)
    if @rating.save
      redirect_to @theme_park, notice: 'Success!'
    else
      render :new
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:theme_park_id, :user_id, :rating)
  end
end
