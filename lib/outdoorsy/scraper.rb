class Outdoorsy::Scraper

  def self.scrape_page
    scraped_articles = []
    doc = Nokogiri::HTML(open('https://www.bodybuilding.com/category/workouts'))
    #title = doc.search("h3.title").text
    #url = doc.search("h3.title").css("a").map{|attr|attr['href']}
    #(need to pop the first item in the title which is not an article)
    #read_time = doc.search(".bb-read-time__time").text


    #scrapes the URL and gives an array of articles in scraped_articles
  end
end
