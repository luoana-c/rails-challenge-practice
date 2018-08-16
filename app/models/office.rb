class Office < ApplicationRecord
  belongs_to :company
  belongs_to :building

  validates :floor, presence: true, numericality: {only_integer: true, greater_than: 0} 
end
