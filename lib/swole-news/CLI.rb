require 'colorize'
require 'pry'

class CLI

  def call
    puts"            ||                             ||".colorize(:red)
    puts"          ||||||                         ||||||".colorize(:red)
    puts"=========||||||||=======".colorize(:red)+"SWOLENEWS".colorize(:blue)+"=======||||||||=========".colorize(:red)
    puts"          ||||||                         ||||||".colorize(:red)
    puts"            ||                             ||".colorize(:red)
    puts ""
    sleep(1)
    puts "Tired of your old workout routine? Need some guidance or something new? Look no further".colorize(:green)
    sleep(1.5)
    puts "SwoleMate has got your back!".colorize(:green)
    sleep(1.5)
    puts "Here is what's latest in workout.".colorize(:green)
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
      puts "----------------------------------------------------------------------------------------------------------".colorize(:green)
    end
  end

  def list_workouts(article)
    sleep(1)
    puts "Now listing the workouts...".colorize(:blue)
    puts "---------------------------".colorize (:yellow)
    sleep(1.5)
    article.workouts.each.with_index(1) do |workout, i|
      puts "#{i}. #{workout.title}".upcase.colorize(:blue)
      puts "**#{workout.definition}**".colorize(:yellow)
    end
  end

  def view_articles(article, input)
    puts ""
    sleep(1)
    puts "Viewing article no.#{input}".colorize(:blue)
    puts ""
    puts "== == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =="
    sleep(1.5)
    puts "#{article.title}".colorize(:red) + " * #{article.read_time} *"
    puts "#{article.description}...".colorize(:yellow)
    puts "To read more go to:".colorize(:green) + " #{article.url}".colorize(:blue)
    puts "== == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =="
    puts ""
    sleep(1)
  end

  def view_workouts(article)
    input = nil
      while input != "exit"
        puts "Would you like to view the workouts listed inside the article?"
        puts "If yes, please type 'yes' or 'menu' to go back to the main menu or 'exit' to exit"
        input = gets.strip.downcase
          if input == "yes"
            list_workouts(article)
            repeat
            break
          elsif input == "menu"
            main_menu
            action
            break
          elsif input == "exit"
            break
          else
            puts "Not sure what you typed."
          end
      end
  end

  def repeat
    input = nil
      while input != "exit"
        puts "Please type 'menu' to go back to the main menu or 'exit' to exit"
        input = gets.strip.downcase
          if input == "menu"
            main_menu
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
        puts "Please enter a number from the list to view the workouts listed inside or enter 'exit' to exit"
        input = gets.strip.downcase
          if input.to_i.between?(1, @articles.size)
            article = @articles[input.to_i - 1]
            view_articles(article, input)
            view_workouts(article)
            break
          else
            puts "Either the number you entered is out of range or is not recognized by the system."
          end
      end
  end

  def goodbye
    sleep(1)
    puts "Keep up the good work and stay swole! See you soon!".colorize(:yellow)
  end

end
