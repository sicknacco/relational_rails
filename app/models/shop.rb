class Shop < ApplicationRecord
  # validates :name, :city, :order_ahead, :employee_count, presence: true
  has_many :pies
  
  def self.shops_by_timestamp
    Shop.all.order(created_at: :desc)
  end

  def pies_count
    pies.count
  end
end