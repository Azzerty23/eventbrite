class Event < ApplicationRecord
  belongs_to :administrator, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances

  has_one_attached :image

  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past, on: [:create, :update]
  validates :duration, presence: true
  validate :duration_must_be_multiple_of_5
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1000 }
  validates :location, presence: true
  validates :image, attached: true

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Time.now
     errors.add(:start_date, "can't be in the past")
    end
  end

  def duration_must_be_multiple_of_5
    unless duration.present? && duration > 0 && duration % 5 == 0
     errors.add(:duration, "must be muliple of 5")
    end
  end

  def end_date
    start_date + duration.minutes
  end

end
