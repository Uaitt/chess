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
end
