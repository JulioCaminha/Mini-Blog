require "rails_helper"

describe "Post creation" do
	post = FactoryGirl.create(:post)
  	it "allow a user to create a post" do
  		visit new_post_path
  		fill_in 'post_author', :with => post.author
  		fill_in 'post_text', :with => post.text
  		click_button 'Create Post'
  		expect(page).to have_content("Post was successfully created.")
  	end
end