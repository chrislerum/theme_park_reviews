class ThemeParksController < ApplicationController

  def index
    @theme_parks = ThemePark.all
  end

  def show
    @theme_park = ThemePark.find(params[:id])
  end

  def new
    @theme_park = ThemePark.new
  end

  def create
    @theme_park = ThemePark.new(theme_park_params)
    @theme_park.save
    redirect_to @theme_park, notice: 'Theme park was successfully created.'
  end

  def theme_park_params
    params.require(:theme_park).permit(:name, :description, :location, :rating)
  end
end
