class NeighborhoodsController < ApplicationController
    
    def index
        @neighborhoods = Neighborhood.all
    end

    def show
        @city = find_city
        @neighborhood = Neighborhood.find(params[:neighborhood_id])
    end

    def new
        @city = find_city
        @neighborhood = new_neighborhood
    end

    def create
        @city = find_city
        @neighborhood =  new_neighborhood
        @neighborhood.assign_attributes(neighborhood_params)
        if @neighborhood.valid?
            @neighborhood.save
            redirect_to neighborhood_path(city_id: @city.id, neighborhood_id: @neighborhood.id)
        else
            render :new
        end
    end

    private

    def find_city
        City.find(params[:city_id])
    end

    def new_neighborhood
        Neighborhood.new(city: @city)
    end

    def neighborhood_params
        params.require(:neighborhood).permit(:name)
    end

end
