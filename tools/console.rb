require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# For Airbnb testing
l1 = Listing.new("Orlando")
l2 = Listing.new("Chicago")
l3 = Listing.new("New York City")
l4 = Listing.new("New York City")

g1 = Guest.new("Karen")
g2 = Guest.new("Alex")
g3 = Guest.new("Ollie")
g4 = Guest.new("Alex")

t1 = Trip.new(l1, g1)
t2 = Trip.new(l2, g1)
t3 = Trip.new(l3, g2)
t4 = Trip.new(l3, g3)
t5 = Trip.new(l4, g3)
t6 = Trip.new(l1, g3)

binding.pry
0