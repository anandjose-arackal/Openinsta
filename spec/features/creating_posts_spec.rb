require 'rails_helper.rb'

feature 'Creating Image post' do
  scenario 'can create a Image post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/test_resources/images/betta_fish.jpg")
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content('Your post created')
    #expect(page).to have_content('#coffeetime')
   # expect(page).to have_css("img[src*='betta_fish.jpg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "No picture"
    click_button 'Create Post'
    expect(page).to have_content('You need an image to post here!')
  end
end