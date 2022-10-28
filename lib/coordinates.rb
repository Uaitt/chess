# frozen_string_literal: true

# this class represents a pair of coordinates in the chess board
class Coordinates
  def initialize(data)
    @data = data
  end

  def valid?
    valid_length? && valid_values?
  end

  def convert
    [8 - @data[1].to_i, @data[0].ord - 97]
  end

  private

  def valid_length?
    @data.length == 2
  end

  def valid_values?
    @data[0] >= 'a' && @data[0] <= 'h' &&
      @data[1] >= '1' && @data[1] <= '8'
  end
end
