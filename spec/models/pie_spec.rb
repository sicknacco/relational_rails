require 'rails_helper'

RSpec.describe Pie, type: :model do
  before(:each) do
    test_data
  end

  describe 'relationships' do
    it { should belong_to :shop }
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:category)}
    it { should validate_numericality_of(:bake_time)}
    it { should allow_value(true).for(:wholesale) }
    it { should allow_value(false).for(:wholesale) }
    it { should_not allow_value(nil).for(:wholesale) }
  end

  describe 'Class methods' do
    describe "#wholesale_pies" do
      it 'returns pies with a wholesale value of true' do
        expect(Pie.wholesale_pies).to eq([@mince, @mush, @spin, @m_c, @cherry, @steak])
      end
    end
  end
end