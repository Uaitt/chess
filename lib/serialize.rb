# frozen_string_literal: true

# set of methods used to save the chess game
module Serialize
  def to_marshal
    Marshal.dump(to_h)
  end

  def from_marshal(string)
    variables_hash = Marshal.load(string)
    variables_hash.each_key { |key| instance_variable_set(key, variables_hash[key]) }
  end

  private

  def to_h
    variables_hash = {}
    instance_variables.map { |variable| variables_hash[variable] = instance_variable_get(variable) }
    variables_hash
  end

  def input_path
    loop do
      file_name = "saved_games/#{gets.chomp}.txt"
      return file_name if File.exist?(file_name)

      non_existing_saved_game_warning
    end
  end

  def file_name
    save_game_instructions
    loop do
      name = "saved_games/#{gets.chomp}_#{Date.today.strftime('%d_%b_%Y').downcase}.txt"
      return name unless File.exist?(name)

      same_name_saved_game_warning
    end
  end

  def delete(file_path)
    File.delete(file_path)
    Dir.delete('saved_games') if Dir.children('saved_games').length.zero?
  end
end
