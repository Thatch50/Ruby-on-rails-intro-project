class Move < ApplicationRecord
  has_many :pokemon_moves, dependent: :destroy
  has_many :pokemons, :through => :pokemon_moves

  validates :name, presence: true, length: { minimum: 2 }
end
