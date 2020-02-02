class Api::V1::PlacesController < ApplicationController
  def index
    @places = Place.all
    render json: PlaceSerializer.new(@places).serialized_json
  end
  
  def show
    @place = Place.find(params[:id])
    render json: PlaceSerializer.new(@place).serialized_json
  end
end
