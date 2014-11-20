require 'rails_helper'

describe 'stories' do
  context 'no stories have been added' do

    before do
      visit '/'
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

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

    before do
      visit '/'
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

  it 'prompts user to fill out a form, then displays the new story' do
    visit '/stories'
    click_link 'Add a story'
    fill_in 'Title', with: 'Story-1'
    fill_in 'Story', with: 'This is one epicly short story'
    click_button 'Create Story'
    expect(page).to have_content 'Story-1'
    expect(current_path).to eq '/stories'
  end

  it 'prompts the user to fill out the location' do
    visit '/stories'
    click_link 'Add a story'
    fill_in 'Title', with: 'Story-1'
    fill_in 'Story', with: 'This is one epicly short story'
    fill_in 'Location', with: 'London'
    click_button 'Create Story'
    click_link 'Story-1'
    expect(page).to have_content 'London'
  end



end

context 'viewing stories' do

  before do
    @article = Story.create(title: 'Story-1', image_file_name: '/public/iamges/medium/test.jpg')
  end

  it 'should see the most recent photos posted' do
    visit '/stories'
    expect(page).to have_css('img')
  end

  it 'clicking on a photo should take a user to the story' do
    visit '/stories'
    click_link 'Test'
    expect(current_path).to eq "/stories/#{@article.id}"
  end

end

context 'editing stories' do

  before do
    @article = Story.create(title: 'Story-1', image_file_name: '/public/images/medium/test.jpg')
  end

  it 'lets a user edit a story' do
    visit '/stories'
    click_link 'Edit Story-1'
    fill_in 'Title', with: 'Epic Story'
    click_button 'Update Story'
    expect(page).to have_content 'Epic Story'
    expect(current_path).to eq '/stories'
  end
end

context 'deleting stories' do

  before do
    @article = Story.create(title: 'Story-1', image_file_name: '/public/images/medium/test.jpg')
  end

  it 'lets a user deleted a story' do
    visit '/stories'
    click_link 'Delete Story-1'
    expect(page).not_to have_content 'Story-1'
    expect(page).to have_content 'Story has been deleted successfully'
  end

end
