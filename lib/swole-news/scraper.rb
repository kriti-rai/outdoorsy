class Scraper

  def self.scrape_page
    article_array = []

    doc = Nokogiri::HTML(open('https://www.bodybuilding.com/category/workouts'))

    doc.css(".cms-article-list--article.col.col-1").map do |article|
      article = {
        :title => article.search("h3.title").text,
        :url => article.search("a").attribute('href').to_s,
        :read_time => article.search(".bb-read-time__time").text,
        :description => article.search("span.description").text
        }
        article_array << article
      end
    article_array
  end

  def self.scrape_workouts(article_url)
    workout_array = []

    article = Nokogiri::HTML(open(article_url))
    wrapper = article.search(".cms-article-list__content--wrapper")

    wrapper.search(".cms-article-list__content--container .cms-article-list__content").each do |container|
        workout_hash = {
          :title => container.search(".cms-article-workout__exercise--title").text,
          :definition => container.search(".cms-article-workout__sets--definition span").text.strip
          }
        workout_array << workout_hash
      end
    workout_array
  end

end
