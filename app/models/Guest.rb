class Guest

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    # Returns an array of all listings a guest has stayed at
    def listings
        Listing.all.select do |listing|
            listing.guests.any?(self)
        end
    end

    # Returns an array of all trips a guest has made
    def trips
        Trip.all.select do |trip|
            trip.guest == self
        end
    end

    # Returns the number of trips a guest has taken
    def trip_count
        self.trips.count
    end

    # Returns an array of hashes {Guest => trip_count} for all Guest instances sorted from most trip count to least trip count
    def self.trip_count_sort
        all_guest_trips_count = self.all.map do |guest|
            {guest => guest.trip_count}
        end
        sorted_all_guest_trips_count = all_guest_trips_count.sort_by do |guest|
            guest.values[0]
        end
        sorted_all_guest_trips_count.reverse
    end

    # Returns an array of all guests who have made over 1 trip
    def self.pro_traveller
        travellers = self.trip_count_sort.select do |guest|
            guest.values[0] > 1
        end
        travellers.map do |guest|
            guest.keys[0]
        end
    end

    # Takes an argument of a name (as a string), returns the all guests with that name
    def self.find_all_by_name(name)
        self.all.select do |guest|
            guest.name == name
        end
    end

end