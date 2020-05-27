class Game < ApplicationRecord
  validates :name, :category, presence: true
  validates :name, uniqueness: true
  validates :rating, inclusion: { in: 0..100 }
  validate :valid_expansion

  has_many :involved_companies
  has_many :companies, through: :involved_companies
  has_and_belongs_to_many :platforms
  has_and_belongs_to_many :genres
  has_many :expansions, class_name: 'Game', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Game', optional: true
  has_many :reviews, as: :parent

  enum category: {
    main_game: 0,
    expansion: 1,
  }

  private

  def valid_expansion
    if expansion? && !Game.exists?(parent_id)
      errors.add(:parent, "Invalid parent game for expansion")
    end
  end
end
