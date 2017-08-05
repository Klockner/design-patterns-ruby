module Observer
  def initialize
    @observers = []
  end

  # Add multiple observers in same call
  def add(*observer)
    if observer.respond_to?(:each)
      @observers = observer.each
    else
      @observers << observer
    end
  end

  def notify
    @observers.map { |e| e.alert }
  end
end

class MasterRestaurant
  def alert
    puts "A restaurant was qualified."
  end
end

class Restaurant
  include Observer

  def qualify(rate)
    puts "Restaurant received #{rate}!"
    notify
  end
end

# Observers
observer1 = MasterRestaurant.new
observer2 = MasterRestaurant.new

restaurant = Restaurant.new
# Add observer
restaurant.add(observer1, observer2)

# Send event
restaurant.qualify(5)
