class ThemeParksController < ApplicationController

  def index
    @theme_parks = ThemePark.all
  end

  def show
    @theme_park = ThemePark.find(params[:id])
  end

  def new
    @theme_park = ThemePark.new
    @theme_park.theme_park_images.build
  end

  def create
    @theme_park = ThemePark.new(theme_park_params)
    if @theme_park.save
      redirect_to @theme_park, notice: 'Theme park was successfully created.'
    else
      render :new
    end
  end

  def theme_park_params
    params.require(:theme_park).permit(:name, :description, :location, :rating, theme_park_images_attributes: [:photo, :title])
  end
end
