# frozen_string_literal: true

# this class represents a non existing movement in chess
class NilMovement
  class << self
    def handles?(_)
      true
    end
  end

  def initialize(_, _, _); end

  def valid?
    false
  end
end
