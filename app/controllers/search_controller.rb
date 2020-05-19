class SearchController < ApplicationController
  def index
    house = params[:house]
    require "pry"; binding.pry
  end
end
