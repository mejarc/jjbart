class StationsController < ApplicationController
  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all

    render json: @stations
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
    @station = Station.find_by_id!(params[:id])
    render json: @station
  end

# GET /stations/woak
  # GET /stations/woak.json
  def show_by_abbr
    @station = Station.find_by_abbr!(params[:abbr].upcase)
    render json: @station
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)

    if @station.save
      render json: @station, status: :created, location: @station
    else
      render json: @station.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    @station = Station.find(params[:id])

    if @station.update(station_params)
      head :no_content
    else
      render json: @station.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station = Station.find(params[:id])
    @station.destroy

    head :no_content
  end

  private
    
    def station_params
      params.require(:station).permit(:id, :name, :abbr, :latitude, :longitude, :address, :city, :state, :zipcode, :county)
    end
end
