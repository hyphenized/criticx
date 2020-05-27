class InvolvedCompany < ApplicationRecord
  validates :developer, :publisher, inclusion: {
    in: [true, false], message:
    "Expected boolean as value",
  }

  belongs_to :company
  belongs_to :game
end
