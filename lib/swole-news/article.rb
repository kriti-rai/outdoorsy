require 'pry'
class SwoleNews::Article
  attr_accessor :title, :url, :workouts, :read_time, :description
  @@all = []

  def initialize(article_hash)
    #takes hash of each article and assigns the respective key and hash to the article
    #also saves every new article created to @@all
    article_hash.each {|k,v| self.send("#{k}=", v)}
    @@all << self
  end

  def self.create_from_page(scrape_page)
    #iterate over the array of articles provided by SwoleNews::Scraper.scrape_page method to create articles
    # scrape_page = SwoleNews::Scraper.scrape_page
    scrape_page.each {|article_hash| self.new(article_hash)}
  end

  def self.all
    @@all
  end

  def find_by_number
  end
end
