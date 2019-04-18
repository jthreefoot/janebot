require 'discordrb'
require 'json'

cfg_filename = "config.json"
cfg_file = open(cfg_filename).read
config = JSON.parse(cfg_file)

bot = Discordrb::Commands::CommandBot.new token: config["token"], client_id: config["client_id"], prefix: '!'

bot.message(with_text: 'Ping!') do |event|
	event.respond 'Pong!'
end

bot.command(:cheer) do |event|
	event.channel.send_file File.open('images/cheerleader_crab.gif', 'r')
end

bot.run
