require 'rails_helper'

describe 'User can' do

  let!(:apartment_1) { FactoryGirl.create(:apartment) }
  let!(:user_1) { FactoryGirl.create(:user, id: 3, apartment_id: apartment_1.id) }
  let!(:chore_1) {FactoryGirl.create(:chore, apartment_id: apartment_1.id, user_id: user_1.id) }

  feature 'delete a chore' do

    scenario "user successfully deletes a chore" do

      visit apartment_path(apartment_1.id)

      expect(page).to have_content "#{chore_1.name}"

      click_button 'Delete Chore'

      expect(page).to_not have_content "#{chore_1.name}"
    end
  end
end
