require 'rails_helper'

describe 'stories' do
  context 'no stories have been added' do
    it 'should display a prompt to add a story' do
      visit '/stories'
      expect(page).to have_content 'No stories'
      expect(page).to have_link 'Add a story'
    end
  end
end
