require 'discordrb'
require 'json'

cfg_filename = "config.json"
cfg_file = open(cfg_filename).read
config = JSON.parse(cfg_file)

bot = Discordrb::Bot.new token: config["token"], client_id: config["client_id"]

bot.message(with_text: 'Ping!') do |event|
	event.respond 'Pong!'
end

bot.run
