class Pie < ApplicationRecord
  # validates :name, :type, :wholesale, :stock, presence: true
  belongs_to :shop
end