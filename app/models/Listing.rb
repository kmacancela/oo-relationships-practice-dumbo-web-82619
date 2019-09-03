class Listing

    attr_reader :city
    @@all = []

    def initialize(city)
        @city = city
        @@all << self
    end

    def self.all
        @@all
    end

    # Returns all the Trip instances of this Listing instance
    def trips
        Trip.all.select do |trip|
            trip.listing == self
        end
    end

    # Returns an array of all guests who have stayed at a listing
    def guests
        self.trips.map do |trip|
            trip.guest
        end
    end

    # Returns the number of trips that have been taken to that listing
    def trip_count
        self.trips.count
    end

    # Takes an argument of a city name (as a string) and returns all the listings for that city
    def self.find_all_by_city(city)
        self.all.select do |listing|
            listing.city == city
        end
    end

    # Returns an array of all Listing instances sorted by the Listing with the most Trip instances to the Listing with the least Trip instances
    # Array of hashes {Listing instance => Trip.count}
    def self.trips_count_sort
        listing_trips_count = Listing.all.map do |listing|
            {listing => listing.trips.count}
        end
        sorted_listing_trips_count = listing_trips_count.sort_by do |listing|
            listing.values[0]
        end
        sorted_listing_trips_count.reverse
    end

    # Finds the listing that has had the most trips
    def self.most_popular
        self.trips_count_sort[0].keys
    end

end