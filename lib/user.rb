require 'sqlite3'

class User
  attr_accessor :id, :name, :login, :active, :time

  def initialize(args={})
    args.each {|key,value| send("#{key}=", value) }
  end

  def activated?
    active == 1
  end
  
  def update(attr,value)
    connect
    send("#{attr}=",value)
    value = "'#{value}'" if value.is_a?(String)
    @con.execute "UPDATE users SET #{attr} = #{value} WHERE login = '#{@login}'"
  end

  def self.load(login)
    @con = SQLite3::Database.new(DATABASE)
    
    user = User.new
    columns, *rows = @con.execute2 "SELECT * FROM users WHERE login = '#{login}' LIMIT 1;"
    rows[0].each_with_index{|attr,i| user.send("#{columns[i]}=",attr)}
    user
  end

  def self.all
    @con = SQLite3::Database.new(DATABASE)
    columns, *rows = @con.execute2 "SELECT * FROM users ORDER BY name;"
    users = []
    rows.each do |row|
      attrs = {}
      row.each_with_index{|attr,i| attrs[columns[i]] = attr}
      users << User.new(attrs)
    end
    users
  end

  def left_time
    if !self.time.is_a? NilClass
      date = Time.parse self.time
      result = Time.now - date
      (25*60 - result.to_i).to_i
    else
      0
    end
  end

  private
  def connect
    @con = SQLite3::Database.new(DATABASE)
  end
end
