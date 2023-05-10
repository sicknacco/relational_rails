require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe 'relationships' do
    it { should have_many :pies }
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:order_ahead)}
    it { should validate_presence_of(:employee_count)}
  end
end