class CreatePokemonMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemon_moves do |t|
      t.pokemon :references
      t.move :references

      t.timestamps
    end
  end
end
