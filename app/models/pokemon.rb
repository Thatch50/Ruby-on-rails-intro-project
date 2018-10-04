class Pokemon < ApplicationRecord
  has_many :pokemon_moves, :dependent => true
  has_many :moves, :through => :pokemon_moves
  has_many :base_stats
  has_many :sprites
end
