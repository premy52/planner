class Client < ApplicationRecord
	has_many :publications, dependent: :destroy
end
