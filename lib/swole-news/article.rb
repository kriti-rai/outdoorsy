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

  def self.create_from_collection(article_array)
    #iterate over the array of articles provided by SwoleNews::Scraper.scrape_page method to create articles
    # scrape_page = SwoleNews::Scraper.scrape_page
    article_array.each {|article_hash| self.new(article_hash)}
  end

  def self.all
    @@all
  end

  def self.find_by_number(input)
    #if input==index+1 return the respective article
    #else puts an "invalid" message and asks for input again
    input = input.to_i
    self.all.detect.with_index(1){|article,i| i == input}
  end

end
