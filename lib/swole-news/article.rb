class Article
  attr_accessor :title, :url, :workouts, :read_time, :description
  @@all = []

  def initialize(article_hash)
    #takes hash of each article and assigns the respective key and hash to the article
    #also saves every new article created to @@all
    article_hash.each {|k,v| self.send("#{k}=", v)}
    @@all << self
  end

  def self.create_from_collection(article_array)
    #iterate over the array of array of scraped articles to create articles and add workouts
    article_array.map do |article_hash|
      self.new(article_hash)
    end

    @@all.map do |article|
      scraped_workouts = Scraper.scrape_workouts(article.url)
      article.workouts = Workout.create_from_collection(scraped_workouts)
      article.workouts.each {|workout| workout.article = article}
    end
  end

  def self.all
    @@all
  end

  def self.find_by_number(input)
    input = input.to_i
    self.all.detect.with_index(1){|article,i| i == input}
  end

end
