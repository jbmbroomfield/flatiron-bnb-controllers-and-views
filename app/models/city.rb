class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods
  has_many :reservations, :through => :listings

  validates :name, presence: true

  include Reservable

  def to_s
    self.name
  end

  def city_openings(start_date, end_date)
    openings(start_date, end_date)
  end
end