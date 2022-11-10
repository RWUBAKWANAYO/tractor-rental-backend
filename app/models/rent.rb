class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :tractor

  validates :total_costs, presence: true, numericality: { greater_than: 0 }
end
