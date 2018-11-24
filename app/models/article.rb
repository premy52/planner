class Article < ApplicationRecord
  belongs_to :publication
  belongs_to :topic

  before_validation :initialize_link

  validates :pub_year, :pub_month, :publication_id, :topic_id, presence: true

  scope :ordered,                 -> { includes(topic: :super_topic, publication: :client).order('super_topics.caption', 'topics.caption', 'clients.client_name', 'publications.pub_name', pub_year: :desc, pub_month: :desc)}
  
  scope :intra_topic_ordered,     -> { includes(publication: :client).order('pub_year DESC', 'pub_month DESC', 'clients.client_name', 'publications.pub_name' )}
  
  scope :intra_publication_ordered,   -> { includes(topic: :super_topic).order('pub_year DESC', 'pub_month DESC', 'super_topics.caption', 'topics.caption' )}

  MONTH_NAME = {
                1 => "January",
                2 => "February",
                3 => "March",
                4 => "April",
                5 => "May",
                6 => "June",
                7 => "July",
                8 => "August",
                9 => "September",
                10 => "October",
                11 => "November",
                12 => "December"
                }

  def deslug(link_text)
  	# link_text.downcase
  	# strip right .htm 
  	# strip right / 
  	# grab right of last / 
  	# replace single hyphen with space
  	# replace triple hyphen with ' - ' 
  	# replace double hyphen with em dash
  	# capitalize all words
  	# lowercase some words
  	
  	link_text
  end

  def initialize_link
    # so the link is never null
  	self.link = '' unless link
  end

  def self.minimum_year
     # Article.pluck(:pub_year).min
     2012
  end

  def self.earliest_article_date
     pluckarray = Article.distinct.pluck(:pub_year, :pub_month)
     earliest_year_mo = pluckarray.min
     MONTH_NAME[ earliest_year_mo[1] ] + " " + earliest_year_mo[0].to_s
  end

  def self.latest_article_date
     pluckarray = Article.distinct.pluck(:pub_year, :pub_month)
     earliest_year_mo = pluckarray.max
     MONTH_NAME[ earliest_year_mo[1] ] + " " + earliest_year_mo[0].to_s
  end

  def self.next_year
    Date.today.year + 1
  end

  def linkcaption
    self.pub_year.to_s + "/" + self.pub_month.to_s
  end

  def year_month
    self.pub_year.to_s + self.pub_month.to_s
  end

end