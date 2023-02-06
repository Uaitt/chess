# frozen_string_literal: true

require_relative '../rook/rook'
require_relative '../bishop/bishop'

# set of methods common to all queens in chess
module Queen
  include Rook
  include Bishop

  def basic_moves
    Rook.instance_method(:basic_moves).bind_call(self) +
      Bishop.instance_method(:basic_moves).bind_call(self)
  end
end
