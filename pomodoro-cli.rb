require 'yaml'
require 'lib/cli'
require 'net/http'

url = "localhost"
port = "4567"

config_file = File.join(ENV["HOME"],'.pomodoro.yml')
if File.exists?(config_file)
  config = YAML::load(File.open(config_file).read)
  url = config['url'] if config['url']
  port = config['port'] if config['port']
  LOGIN = config['login'] if config['login']
end

URL = url
PORT = port

unless defined? LOGIN
  puts "Login não informado."
  puts "O arquivo #{ENV["HOME"]}/.pomodoro.yml precisa ser criado."
end

REQ = Net::HTTP.new(URL,PORT)

Cli.execute(ARGV[0])
