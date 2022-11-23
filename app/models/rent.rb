class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :tractor

  validates :new_farm, presence: true , allow_blank: true
  validates :rent_date, :farm_size, presence: true
  validates :total_costs,:estimated_time, presence: true, numericality: { greater_than: 0 }

  after_save :update_demand

  def update_demand
    tractor.update(demand: tractor.demand + 1)
  end
end
