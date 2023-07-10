# frozen_string_literal: true

source 'https://rubygems.org'

require 'yaml'
config = YAML.load_file('_config.yml')
config['plugins'].each do |plugin|
  gem plugin
end
