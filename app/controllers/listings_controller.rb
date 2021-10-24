class ListingsController < ApplicationController

    def show
        @listing = Listing.find(params[:id])
        p @listing
    end

    def new
        @neighborhood = find_neighborhood
        @listing = new_listing
    end

    def create
        @neighborhood = find_neighborhood
        @listing = new_listing
        @listing.assign_attributes(listing_params)
        if @listing.valid?
            @listing.save
            redirect_to @neighborhood.city
        else
            render :new
        end
    end

    private

    def find_neighborhood
        Neighborhood.find(params[:neighborhood_id])
    end

    def new_listing
        Listing.new(neighborhood: @neighborhood)
    end

    def listing_params
        params.require(:listing).permit(:address, :listing_type, :title, :description, :price, :host_id)
    end

end
