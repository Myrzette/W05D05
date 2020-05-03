class Reservation < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :listing

  validates :start_date,
  presence: true

  validates :end_date,
  presence: true

  validate :overlaping_reservation?

  def duration
   end_date - start_date
  end

  def period
    start_date..end_date
  end

  def overlaping_reservation?
    other_reservations = Reservation.all
    is_overlapping = other_reservations.any? do |other_booking|
      period.overlaps?(other_booking.period)
    end
    errors.add(:overlaps_with_other) if is_overlapping
  end
end
