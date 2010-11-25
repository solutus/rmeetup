require 'rmeetup'

RMeetup::Client.api_key = "4e4b157f153d385e6741333b2d51938"
groups = RMeetup::Client.fetch(:groups, :city => 'Chicago', :zip => '60602', :state => 'Illinois', :country => "USA", :text_format => 'plain')
ids = groups.map(&:id)
needed = groups.detect{|x| x.name = "Vision to Wealth Workshop - Chicago"}
#puts needed.id
#puts ids.join(" ")
#puts ids.size
#puts


#events = RMeetup::Client.fetch(:events, :group_urlname => %w[Vision-to-Wealth-Workshop-Chicago],  :text_format => 'plain')
#events += RMeetup::Client.fetch(:events, :group_urlname => %w[chicagomastermindladies],  :text_format => 'plain')
#events += RMeetup::Client.fetch(:events, :group_urlname => %w[BNChicago],  :text_format => 'plain')

#events = RMeetup::Client.fetch(:events, :group_id=>groups_ids.join(" "), :text_format => 'plain')
events = RMeetup::Client.fetch(:events, :city => 'Chicago', :state => 'IL', :country => "US", :text_format => 'plain')
event = events.detect{|e| !e.rsvp.nil?}
puts event.rsvp
puts event.time



