require 'rails_helper'

describe 'stories' do
  context 'no stories have been added' do
    it 'should display a prompt to add a story' do
      visit '/stories'
      expect(page).to have_content 'No stories'
      expect(page).to have_link 'Add a story'
    end
  end

  context 'stories have been added' do
    before do
      Story.create(title: 'Story-1')
    end

    it 'should display a story' do
      visit '/stories'
      expect(page).to have_content('Story-1')
      expect(page).not_to have_content('No stories yet')
    end
  end
end

describe 'creating stories' do

  it 'prompts user to fill out a form, then display the new story' do
    visit '/stories'
    click_link 'Add a story'
    fill_in 'Title', with: 'Story-1'
    save_and_open_page
    click_button 'Create Story'
    expect(page).to have_content 'Story-1'
    expect(current_path).to eq '/stories'
  end




end