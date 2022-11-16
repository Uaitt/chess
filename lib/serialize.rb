# frozen_string_literal: true

# set of methods used to save the chess game
module Serialize
  def to_yaml
    YAML.dump(to_h)
  end

  def from_yaml(string)
    variables_hash = YAML.unsafe_load(string)
    variables_hash.each_key do |key|
      instance_variable_set(key, variables_hash[key])
    end
  end

  private

  def to_h
    variables_hash = {}
    instance_variables.map do |variable|
      variables_hash[variable] = instance_variable_get(variable)
    end
    variables_hash
  end

  def input_path
    loop do
      name = "saved_games/#{gets.chomp}"
      return name if File.exist?(name)

      invalid_saved_game_warning
    end
  end

  def file_name
    file_name_instructions
    loop do
      name = "saved_games/#{gets.chomp} #{Date.today.strftime('%d_%b_%Y').downcase}.txt"
      return name unless File.exist?(name)

      same_name_saved_game_warning
    end
  end

  def delete_file(file_path)
    File.delete(file_path)
    Dir.delete('saved_games') if Dir.children('saved_games').length.zero?
  end
end
