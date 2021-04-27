require 'telegram/bot'
require 'Json'
require 'net/http'
require_relative 'bot'

class Motivation
  def initialize
    @motive = make_motive_request
  end

  def random_quote
    @motive = @motive.sample
    @motive
  end

  def make_motive_request
    urp = URI('https://type.fit/api/quotes')
    JSON.parse(Net::HTTP.get(urp))
  end
end
