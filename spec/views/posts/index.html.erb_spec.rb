require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(author: "John Doe", text:"description"),
      Post.create!(author: "John Doe", text:"description")
    ])
  end

  it "renders a list of posts" do
    render
  end
end
