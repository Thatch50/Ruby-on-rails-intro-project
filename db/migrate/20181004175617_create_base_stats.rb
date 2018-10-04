class CreateBaseStats < ActiveRecord::Migration[5.2]
  def change
    create_table :base_stats do |t|
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed
      t.references :pokemon, foreign_key: true

      t.timestamps
    end
  end
end
