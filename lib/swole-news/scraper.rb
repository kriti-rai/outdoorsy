require 'pry'
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
  #for workouts in groups
  #iterate through container
  #look for a group
  #iterate over the group and find workouts inside
  #these workouts belong to the group and thus will have an attr of ':group'
  #overall scrape_workouts will do the group operation, else skip to the regular way
    workout_array = []

    article = Nokogiri::HTML(open(article_url))

    container = article.search(".cms-article-list__content--container")
    group = container.search(".cms-article-list__content--group")
    # binding.pry

      container.each do |content|
        if group
          group.each do |item|
            group_workout_array = []
            group.search(".cms-article-list__content").each do |workout|
              group_workout_hash = {
                :title => workout.search(".cms-article-workout__exercise--title").text,
                :definition => workout.search(".cms-article-workout__sets--definition span").text.strip,
                :group_title => item.search(".cms-article-list__content--group-title").text
              }
              workout_array << group_workout_hash
            end
          end
        else
          workout_hash = {
            :title => content.search(".cms-article-workout__exercise--title").text,
            :definition => content.search(".cms-article-workout__sets--definition span").text.strip
          }
          workout_array << workout_hash
        end
      end
     workout_array
     binding.pry
  end
end
