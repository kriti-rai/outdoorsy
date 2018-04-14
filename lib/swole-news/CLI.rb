class CLI

  def call
    puts"            ||                             ||".colorize(:red)
    puts"          ||||||                         ||||||".colorize(:red)
    puts"=========||||||||=======".colorize(:red)+"SWOLENEWS".colorize(:color => :black, :background => :light_blue).underline+"=======||||||||=========".colorize(:red)
    puts"          ||||||                         ||||||".colorize(:red)
    puts"            ||                             ||".colorize(:red)
    puts ""
    puts "Tired of your old workout routine? Need some guidance or something new? Look no further!".colorize(:green)
    sleep(1.5)
    puts "SwoleNews has got your back!".colorize(:green)
    sleep(1.5)
    puts ""
    puts "Here is what's latest in workout.".colorize(:color => :blue).underline
    puts ""
    make_articles
    list_articles
    sleep(1)
    action
    sleep(1)
    goodbye
  end

  def make_articles
    scraped_articles = Scraper.scrape_page
    Article.create_from_collection(scraped_articles)
    @articles = Article.all
    @articles
  end

  def list_articles
    @articles.each.with_index(1) do |article, i|
      puts "#{i}.".colorize(:blue)+ " #{article.title}".colorize(:red) + " * #{article.read_time} *"
      puts "--------------------------------------------------------------------------------------------------------".colorize(:green)
    end
  end

  def view_articles(input)
    puts ""
    sleep(1)
    puts "Viewing article no.#{input}".colorize(:blue)
    puts ""
    puts "== == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =="
    sleep(1.5)
    puts "#{@article.title}".colorize(:red) + " * #{@article.read_time} *"
    puts "#{@article.description}...".colorize(:yellow)
    puts "To read more go to:".colorize(:green) + " #{@article.url}".colorize(:blue)
    puts "== == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =="
    puts ""
    sleep(1)
  end

  def list_workouts
    sleep(1)
    puts "Now listing the workouts...".colorize(:blue)
    puts "---------------------------".colorize (:yellow)
    sleep(1.5)
    @article.workouts.each.with_index(1) do |workout, i|
      puts "#{i}. #{workout.title}".upcase.colorize(:blue)
      puts "**#{workout.definition}**".colorize(:yellow)
    end
  end

  def view_workouts
    input = nil
      while input != "exit"
        puts "Would you like to view the workouts listed inside the article?".colorize(:green)
        puts "If yes, please type 'yes' or 'menu' to go back to the main menu or 'exit' to exit.".colorize(:green)
        input = gets.strip.downcase
          if input == "yes"
            list_workouts
            repeat
            break
          elsif input == "menu"
            list_articles
            action
            break
          elsif input == "exit"
            break
          else
            puts "Not sure what you typed.".colorize(:red)
          end
      end
  end

  def repeat
    input = nil
      while input != "exit"
        puts "Please type 'menu' to go back to the main menu or 'exit' to exit".colorize(:green)
        input = gets.strip.downcase
          if input == "menu"
            list_articles
            action
            break
          elsif input == "exit"
            break
          end
      end
   end

  def action
    input = nil
      while input != "exit"
        puts "Please enter a number from the list to view the workouts listed inside or enter 'exit' to exit".colorize(:green)
        input = gets.strip.downcase
          if input =~ /^-?[0-9]+$/ && input.to_i.between?(1, @articles.size)
            @article = @articles[input.to_i - 1]
            view_articles(input)
            view_workouts
            break
          elsif input == "exit"
            break
          else
            puts "Either the number you entered is out of range or is not recognized by the system.".colorize(:red)
          end
      end
  end

  def goodbye
    puts "Keep up the good work and stay swole! See you soon!".colorize(:yellow)
  end

end
