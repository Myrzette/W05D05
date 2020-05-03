class Listing < ApplicationRecord
  belongs_to :admin, class_name: "User"
  belongs_to :city

  has_many :reservations

  validates :available_beds,
    presence: true,
    numericality: { greater_than_or_equal_to: 0 }

  validates :price,
    presence: true,
    numericality: { greater_than_or_equal_to: 0 }

  validates :description,
    presence: true,
    length: { minimum: 140 }

  validates :welcome_message,
    presence: true
end
