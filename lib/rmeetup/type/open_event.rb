module RMeetup
  module Type
    
    # == RMeetup::Type::OpenEvent
    #
    # Data wraper for a OpenEvent fethcing response
    # Used to access result attributes as well
    # as programmatically fetch relative data types
    # based on this event.
    class OpenEvent
      attr_accessor :id, :name, :time, :status, :description, :event_url,
        :photo_url, :yes_rsvp_count, :maybe_rsvp_count, :distance,
        :trending_rank, :venue_visibility, :group, :venue


      def initialize(event = {})
        self.class.instance_methods(false).select{|m| m =~/.*=/}.each{|m| self.send(m, event[m[0..-2]])}
        self.group = RMeetup::Type::OpenEvent::Group.new(self.group)
        self.venue = RMeetup::Type::OpenEvent::Venue.new(self.venue)
        self.time =  DateTime.parse(Time.at(self.time/1000).to_s)
      end

      class Group
        attr_accessor :id, :name, :urlname, :join_mode
        def initialize(event = {})
          return if event.nil?
          self.class.instance_methods(false).select{|m| m =~/.*=/}.each{|m| self.send(m, event[m[0..-2]])}
        end
      end

      class Venue
        attr_accessor :id, :name, :lat, :lon, :address_1, :address_2, :address_3, :city, :country, :zip, :phone
        def initialize(event = {})
          return if event.nil?
          self.class.instance_methods(false).select{|m| m =~/.*=/}.each{|m| self.send(m, event[m[0..-2]])}
          #          puts "venue city:" + self.city
        end
      end
    end
  end

end

#
#        self.id           = event['id'].to_i
#        self.name         = event['name']
#        self.description  = event['description']
#        self.updated      = DateTime.parse(event['updated'])
#        self.time         = DateTime.parse(event['time'])
#        self.photo_url    = event['photo_url']
#        self.lat          = event['lat'].to_f
#        self.lon          = event['lon'].to_f
#        self.event_url    = event['event_url']
#        self.rsvpcount    = event['rsvpcount'].to_i
#        self.fee          = event['fee']
#        self.feecurrency  = event['feecurrency']
#        self.feedesc      = event['feedesc']
#        # address
#        self.venue_state  = event['venue_state']
#        self.venue_city   = event['venue_city']
#        self.venue_address1 = event['venue_address1']
#        self.venue_address2 = event['venue_address2']
#        self.venue_zip      = event['venue_zip']
#        rsvp_i            = event['utc_rsvp_cutoff'].to_i / 1000
#        self.rsvp         = rsvp_i != 0 ? DateTime.parse(Time.at(rsvp_i).to_s) : nil