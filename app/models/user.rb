class User < ApplicationRecord
  has_many :administrator_events, foreign_key: 'administrator_id', class_name: "Event"
  has_many :attendances
end
