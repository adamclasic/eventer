class Event < ApplicationRecord
    validates_uniqueness_of :title, scope: :user_id
    validates_length_of :title, :minimum => 3, :allow_nil => false
    validates_length_of :description, :minimum => 3, :allow_nil => false
    validates :date, presence: true
    belongs_to :creator, class_name: 'User', foreign_key: :user_id
end
