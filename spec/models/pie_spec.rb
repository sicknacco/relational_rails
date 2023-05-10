require 'rails_helper'

RSpec.describe Pie, type: :model do
  describe 'relationships' do
    it { should belong_to :shop }
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:category)}
    it { should validate_presence_of(:wholesale)}
    it { should validate_presence_of(:bake_time)}
  end
end