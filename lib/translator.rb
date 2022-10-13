# frozen_string_literal: true

# this class represents a translator for chess coordinates and array indexes
class Translator
  def translate(coordinate)
    [convert_number(coordinate[1]), convert_letter(coordinate[0])]
  end

  private

  def convert_number(number)
    8 - number.to_i
  end

  def convert_letter(letter)
    letter.ord - 97
  end
end
