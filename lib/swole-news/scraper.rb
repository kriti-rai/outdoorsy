class SwoleNews::Scraper

  def self.scrape_page
    #scrapes the URL and gives an array of articles in scraped_articles
    scraped_articles = []
    doc = Nokogiri::HTML(open('https://www.bodybuilding.com/category/workouts'))
    #title = doc.search(".cms-article-list--article.col.col-1 h3.title").text
    #url = doc.css(".cms-article-list--article.col.col-1 a").attribute('href').to_s
    #read_time = doc.search(".bb-read-time__time").text
    #description = doc.search("span.description").text
    doc.css(".cms-article-list--article.col.col-1").map do |article|
      article = {
        :title => article.search("h3.title").text,
        :url => article.search("a").attribute('href').to_s,
        :read_time => article.search(".bb-read-time__time").text,
        :description => article.search("span.description").text,
        # :workouts =>
      }
        scraped_articles << article
        binding.pry
      end
      scraped_articles
  end

  def self.scrape_workouts
  #scrapes the articles to list out an array of workouts which might have hashes of supersets

    self.scrape_page.map do |article|
      article[:workouts] = []
      article[:workouts] << Nokogiri::HTML(open(article[:url])).search(".cms-article-workout__exercise--title")
      # binding.pry
    end

  end

end
