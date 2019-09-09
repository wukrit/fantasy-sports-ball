class AddColumnsToPlayers < ActiveRecord::Migration[6.0]
  def change
    change_table :players do |t|
      t.string :name
      t.string :position
      t.string :team
      t.date :dob
      t.string :height
      t.integer :weight
      t.string :college
      t.integer :jersey
    end
  end
end
