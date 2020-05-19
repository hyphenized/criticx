class UpdateGame < ActiveRecord::Migration[6.0]
  def change
    change_table :critics do |t|
      t.string :title
    end

    change_table :games do |t|
      t.references :company, null: false, foreign_key: true
    end
  end
end
