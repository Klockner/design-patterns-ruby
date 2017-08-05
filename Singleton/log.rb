class Logger
  @@instance = Logger.new

  def self.instance
    return @@instance
  end

  private_class_method :new
end

puts Logger.instance
puts Logger.instance
# fail
puts Logger.new


# Using Singleton native module from Ruby
require 'singleton'

class Log
  include Singleton
end

puts Log.instance
puts Log.instance
# fail
puts Log.new
