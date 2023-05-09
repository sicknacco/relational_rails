require 'rails_helper'

RSpec.describe "Pies Index Page", type: :feature do
  before(:each) do
    test_data
  end

  describe "When I visit the Pie index page I see every pie and the following:" do
    it 'shows all pies and their attributes' do
      visit '/pies'
    end
  end
end