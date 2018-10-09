require 'net/http'
require 'json'
require 'pp'
require 'set'

all_types = JSON.parse(Net::HTTP.get(URI('https://pokeapi.co/api/v2/type/')))
all_moves = JSON.parse(Net::HTTP.get(URI('https://pokeapi.co/api/v2/move/')))
all_pokemon = JSON.parse(Net::HTTP.get(URI('https://pokeapi.co/api/v2/pokemon/')))

Type.destroy_all
all_types['results'].each do |i|
  type = Type.create(name: "#{i["name"]}" )
end

Move.destroy_all
all_moves['results'].each do |i|
  move = Move.create(name: "#{i["name"]}" )
end

# Add this many pokemon to pokedex + 1
NUMBER_OF_POKEMON = 205

# Pokemon Table entry
Pokemon.destroy_all
NUMBER_OF_POKEMON.times do |i|
  single_pokemon_endpoint = "#{all_pokemon["results"][i]["url"]}"
  single_pokemon_uri = URI(single_pokemon_endpoint)
  single_pokemon_response = Net::HTTP.get(single_pokemon_uri)
  single_pokemon = JSON.parse(single_pokemon_response)

  # --------------------------------------------------
  #
  # Data to add to db
  #
  # --------------------------------------------------

  pokemon = Pokemon.create!(name: "#{single_pokemon["species"]["name"].capitalize}",
                           number: i + 1,
                           height: single_pokemon["height"]/10.0,
                           weight: single_pokemon["weight"]/10.0)

  pokemon.sprites.create(front_default: "#{single_pokemon["sprites"]["front_default"]}",
                         back_default: "#{single_pokemon["sprites"]["back_default"]}",
                         front_shiny: "#{single_pokemon["sprites"]["front_shiny"]}",
                         back_shiny: "#{single_pokemon["sprites"]["back_shiny"]}"
  )

  pokemon.base_stats.create(hp: single_pokemon["stats"][5]["base_stat"],
                         attack: single_pokemon["stats"][4]["base_stat"],
                         defense: single_pokemon["stats"][3]["base_stat"],
                         special_attack: single_pokemon["stats"][2]["base_stat"],
                         special_defense: single_pokemon["stats"][1]["base_stat"],
                         speed: single_pokemon["stats"][0]["base_stat"]
  )

  single_pokemon["moves"].each do |m|
    move_id = /\b\d{1,3}/.match(m["move"]["url"])[0]
    move = Move.find(move_id)
    PokemonMove.create(pokemon: pokemon,
                      move: move)
  end

  single_pokemon["types"].reverse_each do |t|
    type_id = /\b\d{1,3}/.match(t["type"]["url"])[0]
    type = Type.find(type_id)
    PokemonType.create(pokemon: pokemon,
                      type: type)
  end


  # --------------------------------------------------
  #
  # Testing Data to display all data pulled from API
  #
  # --------------------------------------------------

  ## pokemon data test - tested successfully
  # puts "#{single_pokemon["species"]["name"].capitalize}"
  # puts "Pokedex ##{(i + 1).to_s.rjust(2, '0')}"
  # puts "Height: #{single_pokemon["height"]/10.0} m"
  # puts "Height: #{single_pokemon["weight"]} lbs"
  # puts ""

  ## sprites data test - tested successfully
  # puts "Front default: #{single_pokemon["sprites"]["front_default"]}"
  # puts "Back default: #{single_pokemon["sprites"]["back_default"]}"
  # puts "Front shiny: #{single_pokemon["sprites"]["front_shiny"]}"
  # puts "Back shiny: #{single_pokemon["sprites"]["back_shiny"]}"
  # puts ""

  # # baseStats data test - tested successfully
  # puts "#{single_pokemon["stats"][5]["base_stat"]}" # hp
  # puts "#{single_pokemon["stats"][4]["base_stat"]}" # attack
  # puts "#{single_pokemon["stats"][3]["base_stat"]}" # defense
  # puts "#{single_pokemon["stats"][2]["base_stat"]}" # special attack
  # puts "#{single_pokemon["stats"][1]["base_stat"]}" # special defense
  # puts "#{single_pokemon["stats"][0]["base_stat"]}" # speed
  # puts ""

  ## pokemon types data test
  # single_pokemon["types"].reverse_each do |t|
  #     puts "#{t["type"]["name"]}"
  #     type_id = /\b\d{1,3}/.match(t["type"]["url"])
  #     puts "#{type_id}"
  #     puts ""
  # end

  ## pokemon moves data test - tested successfully
  # single_pokemon["moves"].each do |m|
  #     puts "#{m["move"]["name"]}"
  #     move_id = /\b\d{1,3}/.match(m["move"]["url"])
  #     puts "#{move_id}"
  #     puts ""
  # end

end