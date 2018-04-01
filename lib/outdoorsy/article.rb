require 'pry'
class Outdoorsy::Article
  attr_accessor :title, :url, :workouts
  @@all = []

  def all
    # puts <<~HEREDOC
    #     article_1 = What Makes Dropsets So Good, But So Nasty?
    #     article_2 = 4 Tips For Staying Fit While Traveling
    #     article_3 = This Is Full-Body Training Done Right!
    #     article_4 = Your Guide to Building Next-Level Legs
    # HEREDOC
    article_1 = self.new
    article_2 = self.new

    article_1.title = "Time Crunched? Try This 15-Minute Chest Circuit"
    article_1.duration = "3 min read"
    article_1.url = "https://www.bodybuilding.com/content/time-crunched-try-this-15-minute-chest-circuit.html"
    article_1.workouts = [workout_1, workout_2, workout_3]

    article_2.title = "Beasts-Only Arm Workout"
    article_2.duration = "5 min read"
    article_2.url = "https://www.bodybuilding.com/content/beasts-only-arm-workout.html"
    article_2.workouts = [workout_1, workout_2, workout_3]

    @@all << article_1
    @@all << article_2
    # @@all = [article_1, article_2, article_3, article_4]
    binding.pry
  end
  # binding.pry
  def self.all
    @@all
  end
  def find_by_number
  end
end
