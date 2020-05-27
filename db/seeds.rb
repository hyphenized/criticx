# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

def load_json(fname)
  path = File.expand_path(fname, __dir__)
  File.open(path) { |f| JSON.parse(f.read) }
end

def load_companies
  puts "Loading Companies..."
  load_json('companies.json').each do |company|
    Company.find_or_create_by!(company)
  end
end

def load_genres
  puts "Loading Genres..."
  load_json('genres.json')["genres"].each do |genre|
    Genre.create!(name: genre)
  end
end

def load_platforms
  puts "Loading Platforms..."
  load_json('platforms.json').each do |platform|
    Platform.find_or_create_by!(platform)
  end
end

def load_games
  puts "Loading Games..."
  load_json('games.json').each do |game|
    next if [game["rating"], game["name"], game["category"]].any?(&:nil?)

    data = {
      name: game["name"],
      summary: game["summary"],
      release_date: game["release_date"],
      category: game["category"],
      rating: game["rating"],
    }

    if game["parent"].nil?
      new_game = Game.new(data)
    else
      parent = Game.find_by(name: game["parent"])
      new_game = Game.new(**data, parent: parent)
    end

    unless game["platforms"].nil?
      game["platforms"].each do |platform|
        new_game.platforms << Platform.find_by!(platform)
      end
    end

    unless game["genres"].nil?
      game["genres"].each do |genre|
        new_game.genres << Genre.find_by!(name: genre)
      end
    end

    # Persist new game
    new_game.save!

    unless game["involved_companies"].nil?
      game["involved_companies"].each do |involved_company|
        company = Company.find_by!(name: involved_company["name"])
        data = {
          company: company,
          developer: involved_company["developer"],
          publisher: involved_company["publisher"],
        }
        new_game.involved_companies.create!(data)
      end
    end
  end
end

load_companies
load_genres
load_platforms
load_games
