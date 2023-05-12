class Pie < ApplicationRecord
  validates :name, :category, presence: true
  validates :bake_time, presence: true, numericality: true
  validates :wholesale, inclusion: [true, false]
  
  belongs_to :shop

  def self.wholesale_pies
    self.where("wholesale = true")
  end
end