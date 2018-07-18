

require 'open_weather'
require 'telegram/bot'



options_Open_Weather = { units: "fallows", APPID: "e27e534d44d1af80ca4fb157362d523a
" }
options_Bot = '658761373:AAHd3ga9pafA_eWHA16hA_DrcqiZ62BjLKc'





Telegram::Bot::Client.run(options_Bot) do |bot|
    bot.listen do |message|
      case message.text
        when 'Hi' 
          bot.api.send_message(chat_id: message.chat.id, text: "Hello!")
        
        when '/Weather'
            bot.api.send_message(chat_id: message.chat.id, text: "Your weather: #{OpenWeather::Current.city("Cochin, IN", options_Open_Weather)} ")           
        end
      end
    end
  