require 'discordrb'
require 'nokogiri'
require 'open-uri'
require 'dotenv'
Dotenv.load '.env.token'
Dotenv.load '.env.client'

bot = Discordrb::Commands::CommandBot.new token: ENV['token'],
                                          client_id: ENV['client_id'],
                                          prefix: '/'

bot.command :eriones_search, description: "'ERIONES で検索ができるよ。/eriones_search [アイテム名]と入力してみよう。'" do |event, word|

  break if event.channel.name != 'finalfantasy14'

  url = 'https://eriones.com/search?i=' + word.to_s
  event.respond(url)
end

bot.run
