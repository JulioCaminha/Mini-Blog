require 'rails_helper'
require "post"

describe Post do
	
 	it "requires an author" do
 		post = Post.create(author: nil, text:"descrition")
 		expect(post.errors.full_messages[0]).to eq("Author can't be blank") 		
 	end

 	it "requires a text" do
 		post = Post.create(author: "John Doe", text:nil)
 		expect(post.errors.full_messages[0]).to eq("Text can't be blank")
 	end

	it "has less than 500 characters" do
 		post = Post.create(author: "John Doe", text:"description"*500)
 		expect(post.errors.full_messages[0]).to eq("Text is too long (maximum is 500 characters)")
 	end
end
