class CreatePokemonTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemon_types do |t|
      t.pokemon :references
      t.type :references

      t.timestamps
    end
  end
end
