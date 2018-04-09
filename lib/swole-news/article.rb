class Article
  attr_accessor :title, :url, :workouts, :read_time, :description
  @@all = []

  def initialize(article_hash)
    #takes hash of each article and assigns the respective key and hash to the article
    #also saves every new article created to @@all
    article_hash.each {|k,v| self.send("#{k}=", v)}
    @workouts = nil
    @@all << self
  end

  def add_workouts
    @@all.map do |article|
      scraped_workouts = SwoleNews::Scraper.scrape_workouts(article.url)
      article.workouts = SwoleNews::Workout.create_from_collection(scraped_workouts)
    end
  end

  def self.create_from_collection(article_array)
    #iterate over the array of articles provided by SwoleNews::Scraper.scrape_page method to create articles
    # scrape_page = SwoleNews::Scraper.scrape_page
    article_array.map do |article_hash|
      article = self.new(article_hash)
      article.add_workouts
      article
    end

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
