require 'infura/version'
require 'json'
require 'faraday'
require 'logger'
require 'infura/call'
require 'infura/api'

module Infura
  class << self
    attr_accessor :logger
    attr_accessor :token, :chain
  end
end