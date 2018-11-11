class SuperTopic < ApplicationRecord
	has_many :topics, dependent: :destroy
end
