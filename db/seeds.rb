puts "Start creating Companies"

companies = JSON.parse(File.read("db/companies.json"), symbolize_names: true )
companies.each { |company| Company.create(company) }

puts "End up creating Companies"

puts "Start creating Platforms"

platforms = JSON.parse(File.read("db/platforms.json"), symbolize_names: true)
platforms.each { |platform| Platform.create(platform) }

puts "End up creating Platforms"

puts "Start creating Genres"

genres = JSON.parse(File.read("db/genres.json"))
genres.each { |genre| Genre.create(name: genre) }

puts "End up creating Genres"

puts "Start creating Games"

games = JSON.parse(File.read("db/games.json"), symbolize_names: true)
games.each do |game|
  obj_game = {  
    name: game[:name],
    summary: game[:summary],
    released_date: game[:release_date],
    category: game[:category],
    rating: game[:rating],
    parent: Game.find_by(name: game[:parent])
  }

  new_game = Game.create(obj_game)

  game[:genres].each do |genre|
    found_genre = Genre.find_by(name: genre) 
    new_game.genres << found_genre
  end

  game[:platforms].each do |platform|
    found_platform = Platform.find_by(name: platform[:name])
    new_game.platforms << found_platform 
  end

  game[:involved_companies].each do |involved_company|
    obj_involved_company = {
      company: Company.find_by(name: involved_company[:name]),
      developer: involved_company[:developer],
      publisher: involved_company[:publisher],
    }

    new_game.involved_companies.create(obj_involved_company)
  end
end

puts "End up creating Games"

puts "Start Creating cover"

Game.find(1).update(cover: { io: File.open('db/images/image_40.png'), filename: 'the_last_of_us.jpg' })
Game.find(2).update(cover: { io: File.open('db/images/image_41.png'), filename: 'borderlands3.jpg' })

puts "End up creating cover"