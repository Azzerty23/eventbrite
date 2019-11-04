class User < ApplicationRecord
  after_create :welcome_send

  has_many :administrator_events, foreign_key: 'administrator_id', class_name: "Event", dependent: :destroy
  has_many :attendances, dependent: :destroy

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
