class Client < ApplicationRecord
	has_many :publications, dependent: :destroy

	def pub_count
		self.publications.count
	end
end
