require 'telegram/bot'
require_relative 'joke'
require_relative 'motivation'
require_relative '../lib/hide_token'

class Bot
  def initialize
    validate
  end

  private

  def validate
    token = TOKEN
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text.downcase
        when '/start', 'hello'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hello #{message.from.first_name},
    Welcome to quotes/jokes created by HENRY.
    Use /start to start the bot, /joke for jokes,
    /motivate for quotes, /stop to stop the bot")

        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text:
          "Bye #{message.from.first_name},Hope you had fun and was motivated.")

        when '/joke'
          value = JokeLib.new.inquire_a_request
          bot.api.send_message(chat_id: message.chat.id, text: (value['joke']).to_s, date: message.date)

        when '/motivate'
          motivator = Motivation.new.random_quote
          bot.api.send_message(chat_id: message.chat.id, text: (motivator['text']).to_s, date: message.date)
        else
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Invalid inputs,#{message.from.first_name} Use /joke or /motivate or /stop ")
        end
      end
    end
  end
end
