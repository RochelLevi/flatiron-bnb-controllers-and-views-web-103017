class ListingsController < ApplicationController

  def index
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @listings = @neighborhood.neighborhood_openings(params[:check_in], params[:check_out])
  end

  def new
    @listing = Listing.new
  end

  def browse_specifications
    render :specs_form
  end

  def create
    @listing = Listing.create(listings_params)

    redirect_to listing_path(@listing)
  end

  def edit
  end

  def show
    @listing = Listing.find(params[:id])
  end

  private

  def listings_params
    params.require(:listing).permit(
    listings_attributes: [
      :address,
      :listing_type,
      :title,
      :description,
      :price,
      :neighborhood_id,
      :host_id
      ])
  end
end
