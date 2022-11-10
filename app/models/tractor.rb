class Tractor < ApplicationRecord
  has_many :rents, dependent: :destroy
  
end
