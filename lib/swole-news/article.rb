class Article
  attr_accessor :title, :url, :workouts, :read_time, :description

  @@all = []

  def initialize(article_hash)
    article_hash.each {|k,v| self.send("#{k}=", v)}
    @@all << self
  end

  def self.create_from_collection(article_array)
    article_array.map{|article_hash|self.new(article_hash)}

    @@all.map do |article|
      scraped_workouts = Scraper.scrape_workouts(article.url)
      article.workouts = Workout.create_from_collection(scraped_workouts)
      article.workouts.each {|workout| workout.article = article}
    end
  end

  def self.all
    @@all
  end

end
