class Topic < ApplicationRecord
  belongs_to :super_topic
  has_many :articles

  validates :caption, presence: true
  
  def topic_articles
  	Article.where(topic_id: self.id)  	
  end

  def topic_articles_count
  	topic_articles.count
  end

end
