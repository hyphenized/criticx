class Review < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, length: { maximum: 40 }, uniqueness: true

  belongs_to :user
  belongs_to :parent, polymorphic: true

  after_create :inc_review_count
  after_destroy :dec_review_count

  private

  def inc_review_count
    review_count = user.review_count || 0
    user.update(review_count: review_count + 1)
  end

  def dec_review_count
    review_count = user.review_count
    user.update(review_count: review_count - 1)
  end
end
