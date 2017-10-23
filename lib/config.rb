require 'yaml'

def config
  YAML.load_file("./config.yml")
end
