class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices
  accepts_nested_attributes_for :offices

  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
  validates :address, presence: true, uniqueness: true
  validates :rent_per_floor, presence: true
  validates :number_of_floors, presence: true

  def number_of_floors_available
    # Will not work until relationships and schema are corretly setup

    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

  def total_rent
    self.rent_per_floor * self.offices.length
  end


end
