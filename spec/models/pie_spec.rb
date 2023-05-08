require 'rails_helper'

RSpec.describe Pie, type: :model do
  describe 'relationships' do
    it { should belong_to :shop }
  end
end