

require 'telegram/bot'
Telegram::Bot::Client.run('658761373:AAHd3ga9pafA_eWHA16hA_DrcqiZ62BjLKc') do |bot|
    bot.listen do |message|
      case message.text
        when 'Hi' 
          bot.api.send_message(chat_id: message.chat.id, text: "Hello!")
        
        when 'Weather?'
            bot.api.send_message(chat_id: message.chat.id, text: "Sorry, I don't know.")
        end
      end
    end
  