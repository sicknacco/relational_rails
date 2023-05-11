require 'rails_helper'

RSpec.describe Pie, type: :model do
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
end