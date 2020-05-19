class SearchController < ApplicationController
  def index
    house = params[:house]
    house_wizards = HogwartsService.new.wizards_by_house(house)
    @house_phoenixs = house_wizards.select do |wizard|
       wizard['orderOfThePhoenix']
    end
  end
end
