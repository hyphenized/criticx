class Game < ApplicationRecord
  has_many :critics, dependent: :destroy
end
