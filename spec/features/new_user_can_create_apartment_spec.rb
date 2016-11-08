require 'rails_helper'

descripe 'User can' do

  let (:user_2) { create(:user, apartment_id: nil) }
  let (:apartment_2) { create(:apartment) }

  feature 'add apartment' do

    scenario 'New user can create a new apartment' do

      visit '/'
      click_button('Create Apartment')
      fill_in 'Name', with: "#{apartment_2.name}"
      fill_in 'Zip Code', with: "#{apartment_2.zip_code}"
      fill_in 'Secret', with: "#{apartment_2.secret}"

      click_button('Create Apartment')

      expect(page).to have_content 'Welcome to your Apartment Chore Page'
      expect(page).to have_link('Create a New Chore')
    end
  end
end
