class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  
  def index
    @places = Place.all
  end
  
  def show
  
  end
  
  def new
    @place = Place.new
    @place.build_address
  end

  def edit
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to @place, notice: 'Place was successfully created.'
    else
      render :new
    end
  end

  def update
    if @place.update(place_params)
      redirect_to @place, notice: 'Place was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @place.destroy
    redirect_to places_url, notice: 'Place was successfully destroyed.'
  end

  private
  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    #params.require(:place).permit(:name, address_attributes: [:id, :city, :street_address, :zipcode, :state, :nation, :place_id, :_destroy])
    params.require(:place).permit(:name, address_attributes: Address.attribute_names.map(&:to_sym).push(:_destroy))
  end

end
