class Shop < ApplicationRecord
  # validates :name, :city, :order_ahead, :employee_count, presence: true
  has_many :pies
end