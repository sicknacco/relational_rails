class Pie < ApplicationRecord
  # validates :name, :type, :wholesale, :bake_time, presence: true
  belongs_to :shop
end