class CardsController < ApplicationController

  def index
    @card = Card.all
  end

  def create
    binding.pry
  end
end
