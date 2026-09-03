class SearchController < ApplicationController
  def index
    @query = params[:query].to_s

    @category = Category.find_by(slug: params[:category])
    @area = Area.find_by(slug: params[:area])
    @offer_type = params[:offer_type]

    @businesses = Business.includes(:category, :area, :offers)

    if @query.present?
      @businesses = @businesses.where(
        "businesses.name ILIKE :q OR businesses.description ILIKE :q",
        q: "%#{@query}%"
      )
    end

    @businesses = @businesses.where(category: @category) if @category
    @businesses = @businesses.where(area: @area) if @area
    @businesses = @businesses.joins(:offers).where(offers: {offer_type: @offer_type, is_active: true}).distinct if @offer_type.present?
  end
end
