require 'rails_helper'

RSpec.describe Shop, type: :model do
  before(:each) do
    test_data
  end

  describe 'relationships' do
    it { should have_many :pies }
  end

  # describe 'validations' do
  #   it { should validate_presence_of(:name)}
  #   it { should validate_presence_of(:city)}
  #   it { should validate_presence_of(:order_ahead)}
  #   it { should validate_presence_of(:employee_count)}
  # end

  describe "class methods" do
    describe "#shops_by_timestamp" do
      it "orders shops by most recently created first" do
        
        expect(Shop.shops_by_timestamp).to eq([@flushing, @truck, @dub])
      end
    end
  end
end