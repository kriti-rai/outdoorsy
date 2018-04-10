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
    makes_articles
    sleep(1.5)
    main_menu
    sleep(1)
    action
    sleep(1)
    goodbye
  end

  def makes_articles
    scraped_articles = Scraper.scrape_page
    Article.create_from_collection(scraped_articles)
    Article.all
  end

  def main_menu
    Article.all.each.with_index(1) do |article, i|
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
    input_2 = nil
      while input_2 != "exit"
        puts "Would you like to view the workouts listed inside the article?"
        puts "If yes, please type 'yes' or 'menu' to go back to the main menu or 'exit' to exit"
        input_2 = gets.strip.downcase
          if input_2 == "yes"
            list_workouts(article)
            repeat
            break
          elsif input_2 == "menu"
            main_menu
            action
            break
          elsif input_2 == "exit"
            break
          end
      end
  end

  def repeat
    input_3 = nil
      while input_3 != "exit"
        puts "Please type 'menu' to go back to the main menu or 'exit' to exit"
        input_3 = gets.strip.downcase
          if input_3 == "menu"
            main_menu
            action
            break
          elsif input_3 == "exit"
            break
          end
      end
   end

  def action
    input_1 = nil
      while input_1 != "exit"
        puts "Please enter a number from the list to view the workouts listed inside or enter 'exit' to exit"
        input_1 = gets.strip.downcase
          if input_1.to_i.between?(1, Article.all.size)
            article = Article.find_by_number(input_1)
            view_articles(article, input_1)
            view_workouts(article)
            break
          end
      end
  end

  def goodbye
    sleep(1)
    puts "Keep up the good work and stay swole! See you soon!".colorize(:yellow)
  end

end
