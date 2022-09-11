class GamesController < ApplicationController
  def new
    @letters = []
    7.times do
      @letters << ('A'..'Z').to_a.sample
    end
    2.times do
      @letters << %w(A E I O U).sample
    end
    @letters.shuffle
  end

  def score
  end
end
