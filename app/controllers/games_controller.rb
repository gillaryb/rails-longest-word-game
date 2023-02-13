require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10).join
  end

  def score
    @letters = params[:letters].split
    @word = params[:word]
    @included = @words.chars.all? do |letter|
      @letters.include?(letter)
    end

    # @answer =
    # if check_word == true
    #    "Greaaaaattttttttt"
    # else
    #  "try again!!"
    # end
  end

  def check_word
    file = URI.open("https://wagon-dictionary.herokuapp.com/#{params[:letters]}")
    data = JSON.parse(file.read)
    data['found']
  end
end
