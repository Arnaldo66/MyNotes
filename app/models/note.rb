class Note < ApplicationRecord
	paginates_per 3

	belongs_to :user

	validates_presence_of :title, :content

	def self.search(keyword)
		where("lower(title) like :keyword OR lower(content) like :keyword", keyword: "%#{keyword.downcase}%")
	end

end