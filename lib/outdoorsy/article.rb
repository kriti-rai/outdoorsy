class Outdoorsy::Article
  attr_accessor :title, :url, :workouts
  @@all = []

  def initialize
    # puts <<~HEREDOC
    #     article_1 = What Makes Dropsets So Good, But So Nasty?
    #     article_2 = 4 Tips For Staying Fit While Traveling
    #     article_3 = This Is Full-Body Training Done Right!
    #     article_4 = Your Guide to Building Next-Level Legs
    # HEREDOC
    @title = "4 Tips For Staying Fit While Traveling"
    @url = "https://www.bodybuilding.com/content/4-tips-for-staying-fit-while-traveling.html"
    @workouts = workouts
    @@all << self
    # @@all = [article_1, article_2, article_3, article_4]
  end

  def self.all
    @@all
  end
  def find_by_number
  end
end
