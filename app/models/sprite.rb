class Sprite < ApplicationRecord
  belongs_to :pokemon

  validates :front_default, presence: true
  validates :back_default, presence: true
  validates :front_shiny, presence: true
  validates :back_shiny, presence: true
end
