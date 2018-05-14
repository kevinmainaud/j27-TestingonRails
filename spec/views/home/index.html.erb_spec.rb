require 'rails_helper'


RSpec.describe "home/index.html.erb", type: :view do

  context 'user is not connected' do

    it 'shows login link' do

      visit(root_path)
      expect(page).to have_link(href: new_user_session_path,class:'nav-link')
     

    end

    it 'shows signup link' do
      visit(root_path)
      expect(page).to have_link(href: new_user_registration_path,class:'nav-link')

    end

    it 'does not show users list link' do
      visit(root_path)
      expect(page).to have_no_link(href: users_path, class:'nav-link')
    end

    it 'does not show logout link' do
      
      visit(root_path)
      expect(page).to have_no_link(href: destroy_user_session_path, class:'nav-link')
    end

  end


  context 'user is connected' do

    it 'does not show login link' do
     
      user1=create(:user)
      visit(new_user_session_path)
      fill_in 'user_email', with: user1.email
      fill_in 'user_password', with: user1.password
      click_button "Log in"
      visit(root_path)
      expect(page).to have_no_link(href: new_user_session_path,class:'nav-link')
  
    end

    it 'does not show signup link' do

      pending ("à faire")
    end

    it 'shows users list link' do
      pending ("à faire")
    end

    it 'shows logout link' do
      pending ("à faire")
    end

  end

end
