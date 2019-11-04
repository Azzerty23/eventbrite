class Event < ApplicationRecord
  belongs_to :administrator, class_name: "User"
end
