# frozen_string_literal: true

class Validator
  def valid_input?(coordinate)
    valid_length?(coordinate) && valid_values?(coordinate)
  end

  private

  def valid_length?(coordinate)
    coordinate.length == 2
  end

  def valid_values?(coordinate)
    coordinate[0] >= 'a' && coordinate[0] <= 'h' &&
      coordinate[1] >= '1' && coordinate[1] <= '8'
  end
end
