# frozen_string_literal: true

# this class represents a pair of coordinates in the chess board
class Coordinates
  def initialize(input)
    @letter = input[0]
    @number = input[1]
  end

  def convert
    [8 - @number.to_i, @letter.ord - 97]
  end
end
