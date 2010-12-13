module RMeetup
  module Type
    
    # == RMeetup::Type::Event
    #
    # Data wraper for a Event fethcing response
    # Used to access result attributes as well
    # as progammatically fetch relative data types
    # based on this event.
    class Event
      attr_accessor :id, :name, :updated, :time, :utc_time, :photo_url, :lat, :lon, :event_url,
                    :rsvpcount, :fee, :feecurrency, :feedesc, :description, :rsvp,
                    :venue_state, :venue_city, :venue_address1, :venue_address2, :venue_zip
      
      def initialize(event = {})
        self.id           = event['id'].to_i
        self.name         = event['name']
        self.description  = event['description']
        self.updated      = Time.parse(event['updated'])
        self.time         = Time.parse(event['time'])
        self.utc_time     = event['utc_time']
        self.photo_url    = event['photo_url']
        self.lat          = event['lat'].to_f
        self.lon          = event['lon'].to_f
        self.event_url    = event['event_url']
        self.rsvpcount    = event['rsvpcount'].to_i
        self.fee          = event['fee']
        self.feecurrency  = event['feecurrency']
        self.feedesc      = event['feedesc']
        # address
        self.venue_state  = event['venue_state']
        self.venue_city   = event['venue_city']
        self.venue_address1 = event['venue_address1']
        self.venue_address2 = event['venue_address2']
        self.venue_zip      = event['venue_zip']
        rsvp_i            = event['utc_rsvp_cutoff'].to_i / 1000
        self.rsvp         = rsvp_i != 0 ? DateTime.parse(Time.at(rsvp_i).to_s) : nil
      end
    end
  end
end