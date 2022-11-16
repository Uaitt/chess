# frozen_string_literal: true

# ...
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

    end
  end

  def file_name

    loop do
      name = "saved_games/#{gets.chomp} #{Date.today.strftime('%d_%b_%Y').downcase}.txt"
      return name unless File.exist?(name)

      same_name_saved_game_warning
    end
  end
end
