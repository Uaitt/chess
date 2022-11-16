# frozen_string_literal: true

# ...
module Serialize
  def to_yaml
    YAML.dump(to_h)
  end

  def from_yaml(string)
    variables_hash = YAML.safe_load(string)
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

  def file_name
    puts 'Enter a name that will help recognize this save: '
    loop do
      name = "#{gets.chomp}.\nSaved on#{Date.today.strftime('%d_%b_%Y').downcase}"
      return name unless File.exist?(name)

      puts 'A saved game with the same name already exists, please enter a different one'
    end
  end
end
