class Outdoorsy::Scraper

  def self.scrape_page
    #scrapes the URL and gives an array of articles in scraped_articles
    scraped_articles = []
    doc = Nokogiri::HTML(open('https://www.bodybuilding.com/category/workouts'))
    #title = doc.search(".cms-article-list--article.col.col-1 h3.title").text
    #url = doc.css(".cms-article-list--article.col.col-1 a").attribute('href').to_s
    #read_time = doc.search(".bb-read-time__time").text
    #description = doc.search("span.description").text

    # doc.map do |



  end
end
