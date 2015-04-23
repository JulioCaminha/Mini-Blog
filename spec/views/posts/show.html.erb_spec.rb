require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(author: "John Doe", text:"description"))
  end

  it "renders attributes in <p>" do
    render
  end
end
