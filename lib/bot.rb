require 'telegram/bot'
require_relative 'joke.rb'

class Bot
    def initialize
        token = '1746243344:AAHfoHmw3_i-H5S3aKzLHEcVB02-ILlSieY'
        Telegram::Bot::Client.run(token) do |bot|
            bot.listen do |message|
                case message.text
                   when '/start'
                    bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name}, Welcome to Motivational quotes and Funny jokes created my ONU HENRY.The chat bot will keep you motivated and fun_filled. Use  /start to start the bot,  /stop to end the bot, /motivate to get a different motivational quotes  or /joke to get a joke everytime you request for any of the options" )
                    when '/stop'
                    bot.api.send_message(chat_id: message.chat.id, text: "Bye #{message.from.first_name},""Hope you had fun and was motivated,do visit another time.", date: message.date)
                    when '/joke'
                      item = JokeLib.new
                        value = item.inquire_a_request
                        bot.api.send_message(chat_id: message.chat.id, text: "#{value['joke']}", date: message.date)
                    else
                        bot.api.send_message(chat_id: message.chat.id, text:"Invalid inputs...  #{message.from.first_name} type a valid input, either of /joke or /motivation or /start or /stop ")
                end
            end
        end
    end
end