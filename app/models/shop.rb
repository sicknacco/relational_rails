class Shop < ApplicationRecord
  validates :name, :city, presence: true
  validates :employee_count, presence: true, numericality: true
  validates :order_ahead, inclusion: [true, false]

  has_many :pies, dependent: :destroy
  
  def self.shops_by_timestamp
    Shop.all.order(created_at: :desc)
  end

  def pies_count
    pies.count
  end
end