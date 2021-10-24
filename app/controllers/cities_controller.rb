class CitiesController < ApplicationController

    def index
    end

    def show
        @city = City.find(params[:id])
    end

    def new
        @city = City.new
    end

    def create
        @city = City.new(city_params)
        resolve_form(@city, :new)
    end

    def edit
        @city = City.find_by(params[:id])
    end
    
    def update
        @city = City.find_by(params[:id])
        @city.assign_attributes(city_params)
        resolve_form(@city, :edit)
    end

    private

    def city_params
        params.require(:city).permit(:name)
    end

    def resolve_form(city, invalid_render)
        if city.valid?
            city.save
            redirect_to city
        else
            render invalid_render
        end
    end

end
