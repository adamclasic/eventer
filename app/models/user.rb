class User < ApplicationRecord
    validates_uniqueness_of :username

    has_many :createdevents, foreign_key: 'user_id', class_name: 'Event'

    has_many :going, class_name: 'Attendee', foreign_key: 'event_id' 
    has_many :goingevents, through: :going, source: 'event'
                   
end
