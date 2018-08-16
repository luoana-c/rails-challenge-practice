class Company < ApplicationRecord
  has_many :offices
  has_many :buildings, through: :offices
  has_many :employees
  accepts_nested_attributes_for :employees

  validates :name, presence: true, uniqueness: true

  def total_rent
    rents_array = self.offices.map {|office| office.building.rent_per_floor}
    rents_array.inject(0){|sum,x| sum + x}
  end

  def employees_attributes=(employee_attributes)
    employee_attributes.values.each do |employee_attribute|
      employee = Employee.find_or_create_by(employee_attribute)
      self.employees << employee
    end
  end
end
