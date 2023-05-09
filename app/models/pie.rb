class Pie < ApplicationRecord
  # validates :name, :category, :wholesale, :bake_time, presence: true
  belongs_to :shop
end