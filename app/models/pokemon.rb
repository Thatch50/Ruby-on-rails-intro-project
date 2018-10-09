class Pokemon < ApplicationRecord
  has_many :pokemon_moves, dependent: :destroy
  has_many :moves, :through => :pokemon_moves, dependent: :destroy
  has_many :base_stats, dependent: :destroy
  has_many :sprites, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :number, :numericality => { only_integer: true, greater_than: 0}
  validates :height, :numericality => { only_integer: false, greater_than: 0}
  validates :weight, :numericality => { only_integer: false, greater_than: 0}

  paginates_per 27

  def self.search(name)
    if name
      where('name LIKE ?', "%#{name}%")
    else
      all
    end
  end
end
