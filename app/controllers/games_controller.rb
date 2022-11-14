# this is a comment
class GamesController < ApplicationController
  def new
    @letters = generate_grid(10)
  end

  def score
    @letters
  end

  private

  def generate_grid(grid_size)
    # TODO: generate random grid of letters
    Array.new(grid_size) { ('A'..'Z').to_a.sample }
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end
end
