class Platform < ApplicationRecord
  validates :name, :category, presence: true
  validates :name, uniqueness: true

  has_and_belongs_to_many :games
  enum category: {
    "PC (Microsoft Windows)": 0,
    "PlayStation 4": 1,
    "Xbox One": 2,
    "Google Stadia": 3,
    "Nintendo Switch": 4,
    "Wii U": 5,
    "Linux": 6,
    "Mac": 7,
    "PlayStation 3": 8,
  }
end
