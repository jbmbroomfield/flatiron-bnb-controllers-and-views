class Neighborhood < ActiveRecord::Base
  belongs_to :city

  has_many :listings
  has_many :reservations, through: :listings

  validates :name, presence: :true
  validates :city, presence: :true

  include Reservable

  def to_s
    self.name
  end

  def neighborhood_openings(start_date, end_date)
    openings(start_date, end_date)
  end
end
