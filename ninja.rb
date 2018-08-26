

require 'open_weather'
require 'telegram/bot'



options_OpenWeather = { units: "metric", APPID: "access key" }
options_Bot = 'access key'


Telegram::Bot::Client.run(options_Bot) do |bot|
  
  
    bot.listen do |message|
      kb = [
            Telegram::Bot::Types::KeyboardButton.new(text: 'Show me your location', request_location: true)           
           ]
           markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb)
          
           pp weather = OpenWeather::Current.geocode(53.11, 23.36, options_OpenWeather)
      case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}!")
        when '/end'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")     
        when '/help'
          bot.api.send_message(chat_id: message.chat.id, text: "Available commands:
          /start
          /end
          /help
          /hi
          /weather
          /test")
        when '/hi' 
          bot.api.send_message(chat_id: message.chat.id, text: 'Hey!', reply_markup: markup)         
         when '/weather'
          bot.api.send_message(chat_id: message.chat.id, text: "Weather in your location: #{weather["main"]["temp"]} celcius, #{weather["main"]["pressure"]} hPa. Humidity is #{weather["main"]["humidity"]}% ")                    
        when '/test'
          bot.api.send_message(chat_id: message.chat.id, text:"I'm testing command")
        else
          bot.api.send_message(chat_id: message.chat.id, text: "I don't understand you 😕")
        end
      end
    end
    
