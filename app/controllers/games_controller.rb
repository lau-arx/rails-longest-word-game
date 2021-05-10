require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    alphabet = ("A".."Z").to_a
    @letters = 10.times.map { alphabet.sample }
  end

  def score
    @word = params[:word]
    @grid = params[:token].split('')
    @array_of_letters = @word.split('')

    @url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @serialized_word = URI.open(@url).read
    @nice_word = JSON.parse(@serialized_word)
    
    @can_be_built = @array_of_letters.all? { |letter| @array_of_letters.count(letter) <= @grid.count(letter) }
  end
end
