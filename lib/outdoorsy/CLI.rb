#CLI Controller
class Outdoorsy::CLI

  def call
    puts <<~HEREDOC
                    ||                      ||
                  ||||||                  ||||||
        =========||||||||================||||||||=========
                  ||||||                  ||||||
                    ||                      ||
    HEREDOC
    sleep(1)
    puts "Tired of your old workout routine? Need some guidance or something new?"
    sleep(1.5)
    puts "Look no further."
    sleep(1.5)
    puts "SwoleMate has got your back!"
    sleep(1.5)
    puts"We provide you with a list of latest in workouts that you can include in your routine to attain your dream body."
    sleep (1.5)
    puts <<~HEREDOC
        +++++++++++++++++++++++++++++++++++++++++++++++++++
        +                                                 +
        +              Let’s get swole!                   +
        +                                                 +
        +++++++++++++++++++++++++++++++++++++++++++++++++++
    HEREDOC
    sleep (1.5)
    puts "Type “list” to check out the latest in workout."
    sleep(1.5)
    list_articles
    sleep(1.5)
    article
    sleep (1)
    workouts
    sleep (1)
    exit
  end

  def list_articles
    puts <<~HEREDOC
        1. What Makes Dropsets So Good, But So Nasty?
        2. 4 Tips For Staying Fit While Traveling
        3. This Is Full-Body Training Done Right!
        10. Your Guide to Building Next-Level Legs

        Type "more" to see more. (Shows 10 at a time and puts "that is the end of menu if no more articles to load")
    HEREDOC
  end

  def article
    puts "Enter the number for the article you are interested in"
    #gets input
    #shows the article content
  end

  def content
    #gives users the URL to view the content


  end

  def workouts
    #lists specific workouts in the article and gives users to get instructions on each workout
    puts "Please enter the number for the workout you are interested in or enter 'exit' to exit"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Showing the workout #{input}..."
      when input == "2"
        "Showing the workout #2.."
      end
    end
  end

  def exit
    puts "Goodbye. Keep up the good work and stay swole! See you soon!"
  end


end
