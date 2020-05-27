class Company < ApplicationRecord
  validates :name, :country, presence: true
  validates :name, uniqueness: true

  has_many :involved_companies
  has_many :games, through: :involved_companies
  has_many :reviews, as: :parent
end
