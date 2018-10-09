class PokemonsController < ApplicationController
  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def index
    @pokemons = Pokemon.search(params[:search]).page(params[:page])
  end
end
