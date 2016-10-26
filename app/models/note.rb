class Note < ApplicationRecord
	
	def self.search(keyword)
		where("lower(title) like :keyword OR lower(content) like :keyword", keyword: "%#{keyword.downcase}%")
	end

end