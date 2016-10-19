require 'rails-helper'

describe 'User can' do

  let (:user_1) { FactoryGirl.create(:user)}
  let (:apartment_1) { FactoryGirl.create(:apartment)}


  feature 'add a location' do

    scenario 'user adds a new chore successfully'
      visit new_chore_path
      fill_in 'Name', with: 'Swiffer the Kitchen'
      fill_in 'Days Between Completion', with: '7'

      click_button 'Add Chore'

      expect_page.to have_content 'Chore added successfully'
      expect_page.to have_content 'Swiffer the Kitchen'
    end

    scenario 'user does not provide proper information for a chore'
      visit new_chore_path
      click_button 'Add Chore'
      expect(page).to have_content 'Name can\'t be blank'
      expect(page).to have_content 'Days Between Completion can\'t be blank'
      expect(page).to have_content 'Days Between Completion is not a number'
    end
  end
end 
