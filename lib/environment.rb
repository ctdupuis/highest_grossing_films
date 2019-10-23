require_relative 'films/cli'
require_relative 'films/movies'
require_relative 'films/api'
require_relative 'films/version'

require 'pry'
require 'nokogiri'
require 'open-uri'
require 'httparty'

module Films
  class Error < StandardError; end
end