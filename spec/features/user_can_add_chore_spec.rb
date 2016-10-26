require 'rails_helper'

describe 'User can' do

  let!(:apartment_1) { FactoryGirl.create(:apartment) }
  let!(:user_1) { FactoryGirl.create(:user, id: 3, apartment_id: apartment_1.id) }


  feature 'add a new chore' do

    scenario 'user adds a new chore successfully' do
      visit apartment_path(apartment_1.id)

      click_link 'Create a New Chore'

      expect(page).to have_content "Create Chore for #{apartment_1.address} "

      fill_in 'Name', with: 'Swiffer the Kitchen'
      fill_in 'Days Between Completion', with: '7'
      choose 'medium chore'


      click_button 'Add Chore'

      expect(page).to have_content 'Chore added successfully'
      expect(page).to have_content 'Swiffer the Kitchen'
      expect(page).to have_content 'Worth 2 points'
      expect(page).to have_content "Last Completed By #{user_1.name} on " + Time.now.localtime.strftime('%b %e, %l:%M %p')
    end

    scenario 'user does not provide proper information for a chore' do
      visit new_chore_path
      click_button 'Add Chore'
      expect(page).to have_content 'Name can\'t be blank'
      expect(page).to have_content 'Completion interval can\'t be blank'
      expect(page).to have_content 'Completion interval is not a number'
      expect(page).to have_content 'Points can\'t be blank'
    end
  end
end
