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
      end
      scraped_articles
  end

  def self.scrape_workouts(article_url)
  #scrapes the articles to list out an array of workouts which might have hashes of supersets
    workout_hash = {}
    doc = Nokogiri::HTML(open(article_url))
    doc.search(".cms-article-list__content--wrapper").each do |workout|
      workout = {
        :title => doc.search(".cms-article-workout__exercise--title").text,
        :definition => doc.search(".cms-article-workout__sets--definition").text.strip
        }
      end
      workout_hash
    end
  end

end
