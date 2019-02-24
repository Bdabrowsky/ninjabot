

require 'open_weather'
require 'telegram/bot'



options_OpenWeather = { units: "metric", APPID: "e27e534d44d1af80ca4fb157362d523a" }
options_Bot = '658761373:AAHd3ga9pafA_eWHA16hA_DrcqiZ62BjLKc'


def handle_weather_from_location(lat, lng)
  return OpenWeather::Current.geocode(lat, lng, units: "metric", APPID: "e27e534d44d1af80ca4fb157362d523a")

end

Telegram::Bot::Client.run(options_Bot) do |bot|


  bot.listen do |message|


    
  
         #pp weather = OpenWeather::Current.geocode(53.11, 23.36, options_OpenWeather)

          
        
        if message.location != nil
          weather = handle_weather_from_location(message.location.latitude, message.location.longitude)
          bot.api.send_message(chat_id: message.chat.id, text: "Weather in your location: #{weather["main"]["temp"]} celcius, #{weather["main"]["pressure"]} hPa. Humidity is #{weather["main"]["humidity"]}% ")                    
        end


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
          #bot.api.send_message(chat_id: message.chat.id, text: "Weather in your location: #{weather["main"]["temp"]} celcius, #{weather["main"]["pressure"]} hPa. Humidity is #{weather["main"]["humidity"]}% ")                
        # bot.api.send_message(chat_id: message.chat.id, text: "Weather in your location: #{weather["main"]["temp"]} celcius, #{weather["main"]["pressure"]} hPa. Humidity is #{weather["main"]["humidity"]}% ")                    
      when '/test'
        bot.api.send_message(chat_id: message.chat.id, text:"I'm testing command")
      else
       # bot.api.send_message(chat_id: message.chat.id, text: "I don't understand you 😕")
      end
    end
  end
