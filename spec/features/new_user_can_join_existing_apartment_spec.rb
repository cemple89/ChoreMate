require 'rails_helper'

descripe 'User can' do

  let (:user_2) { create(:user, apartment_id: nil) }
  let (:apartment_2) { create(:apartment), zip_code: '12345' }
  let (:apartment_3) { create(:apartment) }
  let (:apartment_4) { create(:apartment) }

  feature 'join a pre-existing apartment' do

    scenario 'join a pre-existing apartment successfully' do
      visit '/'

      click_button 'Find Your Apartment'

      fill_in 'zip_code', with: '12345'
      click_button 'Submit'

      expect(page).to have_content 'Select Your Apartment'
      click_link "#{apartment_2.name}"

      fill_in 'Apartment Secret', with: 'samplesecret'
      click_button 'Submit'

      expect(page).to have_link('Create a New Chore')
      expect(page).to have_content "#{user_2.name}"
    end
  end
end 
