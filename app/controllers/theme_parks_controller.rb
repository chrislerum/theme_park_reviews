class ThemeParksController < ApplicationController
  before_action :set_theme_park, only: [:show, :edit, :update, :destroy]

  # GET /theme_parks
  # GET /theme_parks.json
  def index
    @theme_parks = ThemePark.all
  end

  # GET /theme_parks/1
  # GET /theme_parks/1.json
  def show
  end

  # GET /theme_parks/new
  def new
    @theme_park = ThemePark.new
  end

  # GET /theme_parks/1/edit
  def edit
  end

  # POST /theme_parks
  # POST /theme_parks.json
  def create
    @theme_park = ThemePark.new(theme_park_params)

    respond_to do |format|
      if @theme_park.save
        format.html { redirect_to @theme_park, notice: 'Theme park was successfully created.' }
        format.json { render action: 'show', status: :created, location: @theme_park }
      else
        format.html { render action: 'new' }
        format.json { render json: @theme_park.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /theme_parks/1
  # PATCH/PUT /theme_parks/1.json
  def update
    respond_to do |format|
      if @theme_park.update(theme_park_params)
        format.html { redirect_to @theme_park, notice: 'Theme park was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @theme_park.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theme_parks/1
  # DELETE /theme_parks/1.json
  def destroy
    @theme_park.destroy
    respond_to do |format|
      format.html { redirect_to theme_parks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme_park
      @theme_park = ThemePark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theme_park_params
      params.require(:theme_park).permit(:name, :description, :location, :rating, :theme_park_images_attributes)
    end
end
