class GamesController < ApplicationController
  def new
    @letters = []
    # breaks down options of letters shown as to ensure a real word is likely included
    3.times do
      @letters << ('A'..'Z').to_a.sample
    end
    4.times do
      @letters << %w(B C D F G H J K L M N P Q R S T V W X Y Z).to_a.sample
    end
    3.times do
      @letters << %w(A E I O U).sample
    end
    @letters
  end

  def score
    @letters = params[:letters].split
    @input = (params[:input] || "").upcase
    @included = included?(@input, @letters)
    @english_word = english_word?(@input)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
