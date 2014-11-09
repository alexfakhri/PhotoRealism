require 'rails_helper'

describe 'user not signed in and on the homepage' do

  it 'should see a sign in link and a sign up link' do
    visit '/'
    expect(page).to have_link('Tell a Story')
  end

  it "should see 'sign up' and 'sign out' links" do
    visit '/'
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end

    it 'should not see the sign out link' do
      visit '/'
      expect(page).not_to have_link('Sign out')
    end
end

context "User signed in on the home page" do

    before do
      visit '/'
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see the 'Sign out' link" do
      visit '/'
      expect(page).to have_link("Sign out")
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit '/'
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end


end
