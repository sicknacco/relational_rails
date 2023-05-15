require 'rails_helper'

RSpec.describe Shop, type: :model do
  before(:each) do
    test_data
  end

  describe 'relationships' do
    it { should have_many :pies }
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:city)}
    it { should validate_numericality_of(:employee_count)}
    it { should allow_value(true).for(:order_ahead) }
    it { should allow_value(false).for(:order_ahead) }
    it { should_not allow_value(nil).for(:order_ahead) }
  end

  describe "class methods" do
    describe "#shops_by_timestamp" do
      it "orders shops by most recently created first" do
        
        expect(Shop.shops_by_timestamp).to eq([@flushing, @truck, @dub])
      end
    end
  end

  describe "instance methods" do
    describe "#pies_count" do
      it "can count the pie varieties at a shop" do
        expect(@dub.pies_count).to eq(3)
        expect(@truck.pies_count).to eq(4)
      end
    end
    describe "#alpha_names" do
      it "can sort all pies at a shop in alpha order" do
        shop = Shop.find_by(id: "#{@truck.id}")
        expect(shop.alpha_names("name")).to eq([@apple, @chick, @sausage, @spin])
        expect(shop.alpha_names("whatever")).to eq([@sausage, @spin, @chick, @apple])
      end
    end
  end
end