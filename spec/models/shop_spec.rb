require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe 'relationships' do
    it { should have_many :pies }
  end
end