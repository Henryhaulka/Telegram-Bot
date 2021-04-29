require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot'

class JokeLib
  def initialize
    @item = inquire_a_request
  end

  def inquire_a_request
    urp = URI('https://v2.jokeapi.dev/joke/Any?blacklistFlags=religious,sexist&type=single')
    JSON.parse(Net::HTTP.get(urp))
  end
end
