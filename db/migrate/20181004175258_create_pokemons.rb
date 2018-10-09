class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :number
      t.float :height
      t.float :weight

      t.timestamps
      # drop_table :moves
      # drop_table :types
    end
  end
end
