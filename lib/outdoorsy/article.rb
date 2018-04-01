require 'pry'
class Outdoorsy::Article
  attr_accessor :title, :url, :workouts, :duration
  # @@all = []

  def self.all
    article_1 = self.new
    article_2 = self.new

    article_1.title = "Time Crunched? Try This 15-Minute Chest Circuit"
    article_1.duration = "3 min read"
    article_1.url = "https://www.bodybuilding.com/content/time-crunched-try-this-15-minute-chest-circuit.html"
    article_1.workouts = ["workout_1", "workout_2", "workout_3"]

    article_2.title = "Beasts-Only Arm Workout"
    article_2.duration = "5 min read"
    article_2.url = "https://www.bodybuilding.com/content/beasts-only-arm-workout.html"
    article_2.workouts = ["workout_1", "workout_2", "workout_3"]

    [article_1, article_2]

  end

  def find_by_number
  end
end
