class Critic < ApplicationRecord
  belongs_to :game
  validates :username, presence: true, length: { minimum: 2, maximum: 12 }, format: {
    with: /\A[a-zA-Z0-9]+\z/,
    message: "only alphanumeric allowed",
  }
  validates :body, presence: { message: "Please write something!"}
  validates :title, presence: { message: "Please write something!"}
end
