class AddParentToReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :parent, null: false, polymorphic: true
  end
end
