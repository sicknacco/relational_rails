require 'rails_helper'

RSpec.describe "Pies Edit Form", type: :feature do
  before(:each) do
    test_data
  end

  describe "'/pies/:id/edit' page" do
    it 'can update a pie record and click a button to submit' do
      visit "/pies/#{@steak.id}/edit"

      fill_in(:name, with: 'Steak and Ale UPDATE')
      fill_in(:category, with: 'Meat UPDATE')
      fill_in(:bake_time, with: 40)
      check(:wholesale)
      click_button("Update Pie")

      expect(current_path).to eq("/pies/#{@steak.id}")
      
      expect(page).to have_content('Steak and Ale UPDATE')
      expect(page).to have_content('Meat UPDATE')
    end
  end
end