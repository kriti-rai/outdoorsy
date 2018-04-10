class Scraper

  def self.scrape_page
    #scrapes the URL and gives an array of articles in scraped_articles
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
  #scrapes the articles to list out an array of workouts which might have hashes of supersets
    workout_array = []

    article = Nokogiri::HTML(open(article_url))

    container = article.search(".cms-article-list__content--container")
    group = container.search(".cms-article-list__content--group")
    # binding.pry
    container.each do |workout|
      workout_hash = {
        :title => workout.search(".cms-article-workout__exercise--title").text,
        :definition => workout.search(".cms-article-workout__sets--definition span").text.strip
       }
       workout_array << workout_hash
    end
   workout_array

      #WITH GROUP WORKOUTS LIKE SUPER/GIANT SETS
        # group_workouts =[]
        # group.each do |subgroup|
        #     group_hash = {
        #       :group_title => group.search(".cms-article-list__content--group-title").text,
        #       :group_description => group.search(".cms-article-list__content--group-description").text,
        #       :workouts => [{
        #         :subworkouts => subgroup.search(".cms-article-workout__exercise--title").text,
        #         :definition =>subgroup.search(".cms-article-workout__sets--definition span").text.strip
        #         }]
        #       }
        #     group_workouts << group_hash
        #     binding.pry
        #   end
      #WITHOUT ANY GROUP WORKOUTS

    #  binding.pry
   end

end
