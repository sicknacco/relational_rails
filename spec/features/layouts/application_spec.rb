require 'rails_helper'

RSpec.describe "application layout file" do
  before(:each) do
    test_data
  end

  describe "Header Index Links" do
    it "has a link to the pies index page on every page" do
      visit '/shops'

      within 'nav' do
        expect(page).to have_link("Pies Index")
      end

      visit "/shops/#{@dub.id}"

      within 'nav' do
        expect(page).to have_link("Pies Index")
      end

      visit "/pies"

      within 'nav' do
        expect(page).to have_link("Pies Index")
      end

      visit "/shops/#{@dub.id}/pies"

      within 'nav' do
        expect(page).to have_link("Pies Index")
      end
    end
  end
end