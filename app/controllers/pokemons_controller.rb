class PokemonsController < ApplicationController
  def show
  end

  def index
    @pokemons = Pokemon.all
  end
end
