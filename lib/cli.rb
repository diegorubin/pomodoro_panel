module Cli
  extend self
  def execute(command)
    unless command
      puts "Usage: command [arg1, arg2, ...]"
    end
    case command
    when 'start', 'stop'
      simple_command(command)
    when 'statuses'
      simple_anonymous_command(command)
    end
  end

  private
  def simple_command(command)
    REQ.post("/#{command}/#{LOGIN}",'')
  end

  def simple_anonymous_command(command)
    REQ.post("/#{command}",'')
  end
end
