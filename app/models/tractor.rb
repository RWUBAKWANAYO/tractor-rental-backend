class Tractor < ApplicationRecord
  has_many :rents, dependent: :destroy

  validates :name, :photo, :description, presence: true
  validates :price,:new_farm_price, :completion, presence: true, numericality: { greater_than: 0 }

end
