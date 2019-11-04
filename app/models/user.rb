class User < ApplicationRecord
  has_many :administrator_events, foreign_key: 'administrator_id', class_name: "Event", dependent: :destroy
  has_many :attendances
end
