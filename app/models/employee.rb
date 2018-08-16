class Employee < ApplicationRecord
  belongs_to :company

  validates :name, presence: true, length: {minimum: 6}
  validates :title, presence: true
  validates :company_id, presence: true
end
