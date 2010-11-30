module RMeetup
  module Fetcher
    class OpenEvents < Base
      def initialize
        @type = :open_events
        @version = 2
      end
      
      # Turn the result hash into a OpenEvent Class
      def format_result(result)
        RMeetup::Type::OpenEvent.new(result)
      end
    end
  end
end