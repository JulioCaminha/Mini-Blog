class Post < ActiveRecord::Base

	validates :author, :text, presence: true
	validates :text, length: { maximum: 500 }

end
