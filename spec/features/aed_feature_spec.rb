require 'rails_helper'

feature 'AEDs' do 

  context 'no AEDs have been added' do 
    scenario 'should display a prompt to add an AED' do
      visit '/aeds'
      expect(page).to have_content 'No AEDs have been added'
      expect(page).to have_link 'Add an AED location'
    end
  end

  context 'AEDs have been added' do 

    before do 
      AED.create(location_name: "UBC Pool")
    end

    scenario 'display AEDs' do 
      visit '/aeds'
      expect(page).to have_content('UBC Pool')
      expect(page).not_to have_content('No AEDs have been added')
    end
  end

end