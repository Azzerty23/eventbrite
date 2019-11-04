class Event < ApplicationRecord
  belongs_to :administrator, class_name: "User"
  has_many :attendances
end
