class Note < ApplicationRecord
	paginates_per 3

	validates_presence_of :title, :content

	def self.search(keyword)
		where("lower(title) like :keyword OR lower(content) like :keyword", keyword: "%#{keyword.downcase}%")
	end

end