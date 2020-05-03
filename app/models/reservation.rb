class Reservation < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :listing

  validates overlaping_reservation?

  def duration
   end_date - start_date
  end

  # wrong on so many levels.
=begin
  def overlaping_reservation?(datetime)
    if (Reservation.where("(? BETWEEN date_start AND date_end OR ? BETWEEN date_start AND date_end) AND user_id = ?", self.date_start, self.date_end, self.user_id).any?)
      errors.add(:date_end, 'it overlaps another reservation')
   end
  end
=end

end
