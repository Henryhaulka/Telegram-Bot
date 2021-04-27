require 'telegram/bot'
require 'json'
require 'net/http'
require_relative 'bot'

class Motivation
  attr_accessor :motive

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
