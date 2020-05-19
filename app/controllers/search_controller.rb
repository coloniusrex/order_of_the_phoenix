class SearchController < ApplicationController
  def index
    house = params[:house]
    house_wizards = HogwartsService.new.wizards_by_house(house)
    house_phoenixs = house_wizards.select do |wizard|
       wizard['orderOfThePhoenix']
    end
    @order_of_the_phoenix = { wizards: house_phoenixs, house: house }
  end
end
