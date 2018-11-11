class Publication < ApplicationRecord
  belongs_to :client
  has_many :articles, dependent: :destroy

  validates :client_id, presence: true

  scope :ordered, -> { includes(:client).order('clients.client_name', 'publications.pub_name')}

end
