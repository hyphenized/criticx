class Game < ApplicationRecord
  has_many :critics, dependent: :destroy
  validates :name, presence: true
  validates :genre, presence: true, inclusion: { in: ["Simulator", "Adventure", "Strategy", "Role-playing (RPG)", "Shooter", "Fighting", "Sport"] }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :release_date, presence: true
end
