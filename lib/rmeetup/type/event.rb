module RMeetup
  module Type
    
    # == RMeetup::Type::Event
    #
    # Data wraper for a Event fethcing response
    # Used to access result attributes as well
    # as progammatically fetch relative data types
    # based on this event.
    class Event
      attr_accessor :id, :name, :updated, :time, :photo_url, :lat, :lon, :event_url,
                    :rsvpcount, :fee, :feecurrency, :feedesc, :description, :rsvp
      
      def initialize(event = {})
        self.id           = event['id'].to_i
        self.name         = event['name']
        self.description  = event['description']
        self.updated      = DateTime.parse(event['updated'])
        self.time         = DateTime.parse(event['time'])
        self.photo_url    = event['photo_url']
        self.lat          = event['lat'].to_f
        self.lon          = event['lon'].to_f
        self.event_url    = event['event_url']
        self.rsvpcount    = event['rsvpcount'].to_i
        self.fee          = event['fee']
        self.feecurrency  = event['feecurrency']
        self.feedesc      = event['feedesc']

        rsvp_i            = event['utc_rsvp_open_time'].to_i / 1000
        self.rsvp         = rsvp_i != 0 ? DateTime.parse(Time.at(rsvp_i).to_s) : nil
      end
    end
  end
end