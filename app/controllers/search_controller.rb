class SearchController < ApplicationController
  def index
    if params[:query].present?
      @query = params[:query]
    else
      @query = "None"
    end
  end
end
