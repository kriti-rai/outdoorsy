class SwoleNews::Scraper

  def self.scrape_page
    #scrapes the URL and gives an array of articles in scraped_articles
    article_array = []
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
      }
        article_array << article
      end
      article_array
  end

  def self.scrape_workouts(article_url)
  #scrapes the articles to list out an array of workouts which might have hashes of supersets
      workout_array = []
        doc = Nokogiri::HTML(open(article_url))
          doc.search(".cms-article-list__content--container").each do |content|
            workout = {
              :title => content.search(".cms-article-workout__exercise--title").text,
              :definition => content.search(".cms-article-workout__sets--definition span").text.strip
              }
              workout_array << workout
            end
        workout_array
  end

end
