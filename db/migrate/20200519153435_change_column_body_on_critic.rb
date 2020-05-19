class ChangeColumnBodyOnCritic < ActiveRecord::Migration[6.0]
  def change
    change_column :critics, :body, :text
  end
end
