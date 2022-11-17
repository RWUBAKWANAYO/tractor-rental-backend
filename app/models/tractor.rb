class Tractor < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy

  validates :name, :photo, :description, presence: true
  validates :price, :completion, presence: true, numericality: { greater_than: 0 }

end
