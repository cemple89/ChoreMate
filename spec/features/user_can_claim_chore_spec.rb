require 'rails_helper'

describe 'User can' do

  let!(:apartment_1) { FactoryGirl.create(:apartment) }
  let!(:user_1) { FactoryGirl.create(:user, id: 3, apartment_id: apartment_1.id) }
  let!(:user_2) { FactoryGirl.create(:user, id: 3, apartment_id: apartment_1.id) }

  let!(:chore_1) {FactoryGirl.create(:chore, apartment_id: apartment_1.id, user_id: user_1.id) }

  feature 'claim a chore' do

    scenario "user successfully deletes a chore" do

      visit apartment_path(apartment_1.id)

      expect(page).to have_content "#{chore_1.name}"
      expect(page).to have_content "Last Completed By #{user_1.name} on #{chore_1.last_completed.localtime.strftime('%b %e, %l:%M %p')} "  

      click_button 'Claim Chore'
      visit apartment_path(apartment_1.id)

      expect(page).to_not have_content "Last Completed By #{user_1.name} on " + Time.now.localtime.strftime('%b %e, %l:%M %p')
      expect(page).to have_content "#{chore_1.name}"
