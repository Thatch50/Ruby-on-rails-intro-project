class BaseStat < ApplicationRecord
  belongs_to :pokemon
  validates :hp, :numericality => { only_integer: true, greater_than: 0}
  validates :attack, :numericality => { only_integer: true, greater_than: 0}
  validates :defense, :numericality => { only_integer: true, greater_than: 0}
  validates :special_attack, :numericality => { only_integer: true, greater_than: 0}
  validates :special_defense, :numericality => { only_integer: true, greater_than: 0}
  validates :speed, :numericality => { only_integer: true, greater_than: 0}
end