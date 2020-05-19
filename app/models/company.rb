class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }
  validates :country, presence: true
end
