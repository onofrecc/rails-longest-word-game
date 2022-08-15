require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10).join.upcase
  end

  def score
    # raise
    url = "https://wagon-dictionary.herokuapp.com/#{params[:guess]}"
    serialized_json = URI.open(url)
    @word_included = JSON.parse(serialized_json.read)

    if @word_included["found"]
      @score = "The word is valid"
    elsif @world_included["found"] == false
      @score = "Disaster"
    end
  end
end


# The word can’t be built out of the original grid
# The word is valid according to the grid, but is not a valid English word
# The word is valid according to the grid and is an English word
# {"found"=>true, "word"=>"management", "length"=>10}


if params[:guess]
