class Move < ApplicationRecord
  has_many :pokemon_moves, :dependent => true
  has_many :pokemons, :through => :pokemon_moves
end
