class Pokemon < ApplicationRecord
  has_many :pokemon_moves, :dependent => true
  has_many :moves, :through => :pokemon_moves
  has_many :base_stats
  has_many :sprites

  validates :name, presence: true, length: { minimum: 2 }
  validates :number, :numericality => { only_integer: true, greater_than: 0}
  validates :height, :numericality => { only_integer: true, greater_than: 0}
  validates :weight, :numericality => { only_integer: true, greater_than: 0}
end
