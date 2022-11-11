class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :tractor

  validates :total_costs, presence: true, numericality: { greater_than: 0 }

  after_save :update_demand

  def update_demand
    tractor.update(demand: tractor.demand + 1)
  end
end
