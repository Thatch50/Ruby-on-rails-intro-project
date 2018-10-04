class CreateSprites < ActiveRecord::Migration[5.2]
  def change
    create_table :sprites do |t|
      t.string :front_default
      t.string :back_default
      t.string :front_shiny
      t.string :back_shiny
      t.pokemon :referenes

      t.timestamps
    end
  end
end
