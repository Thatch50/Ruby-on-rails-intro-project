class PokemonsController < ApplicationController
  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def index
    @pokemons = Pokemon.all.page(params[:page])
  end
end
