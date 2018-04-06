#CLI Controller
require 'colorize'

class SwoleNews::CLI

  def call
    makes_articles
    puts "Welcome!"
    # puts <<~HEREDOC
    #                 ||                      ||
    #               ||||||                  ||||||
    #     =========||||||||================||||||||=========
    #               ||||||                  ||||||
    #                 ||                      ||
    # HEREDOC
    # sleep(1)
    # puts "Tired of your old workout routine? Need some guidance or something new?"
    # sleep(1.5)
    # puts "Look no further."
    # sleep(1.5)
    # puts "SwoleMate has got your back!"
    # sleep(1.5)
    # puts"We provide you with a list of latest in workouts that you can include in your routine to attain your dream body."
    # sleep (1.5)
    # puts <<~HEREDOC
    #     +++++++++++++++++++++++++++++++++++++++++++++++++++
    #     +                                                 +
    #     +              Let’s get swole!                   +
    #     +                                                 +
    #     +++++++++++++++++++++++++++++++++++++++++++++++++++
    # HEREDOC

    sleep(1.5)
    main_menu
    sleep(1.5)
    action
  end

  def makes_articles
    scraped_articles = SwoleNews::Scraper.scrape_page
    SwoleNews::Article.create_from_collection(scraped_articles)
    SwoleNews::Article.all
  end

  def main_menu
    puts "Here is the list of articles on the latest in workout."
        makes_articles.each.with_index(1) do |article, i|
          puts "#{i}. #{article.title}".colorize(:red) + " * #{article.read_time} *"
          puts "#{article.description}".colorize(:yellow)
          puts "To read more go to:".colorize(:yellow) + " #{article.url}".colorize(:blue)
          puts "----------------------------------------------------------------------------------------------------------".colorize(:green)
        end
  end

  def action
    #asks for input
    #calls Article.find_by_number(input) to return the article by number
    #calls Scraper.scrape_workouts(artile_url) to return the list of workouts
    # puts "Please enter a number from the list to view the workouts listed inside or enter 'exit' to exit"

    puts "Please enter a number from the list to view the workouts listed inside or enter 'exit' to exit"
    input = gets.strip.downcase
      if input.to_i.between?(1, SwoleNews::Article.all.size)
        article = SwoleNews::Article.find_by_number(input)
        puts "#{article.title}".colorize(:red) + " * #{article.read_time} *"
        puts "Would you like to view the workouts listed inside the article?"
        puts "If yes, please type 'workout' or 'menu' to go back to the main menu or 'exit' to exit"
        input = gets.strip.downcase
          if input == "workout"
            list_workouts
            puts "Please type 'menu' to go back to the main menu or 'exit' to exit"
              entry = nil
              until entry == "menu" && entry == "exit"
                i = gets.strip.downcase
                  if entry == "menu"
                    main_menu
                  elsif entry == "exit"
                    goodbye
                  else
                    puts "Not sure what you entered. Please type 'menu' to go back to the main menu or 'exit' to exit"
                  end
                end
            elsif input == "menu"
              main_menu
            elsif input == "exit"
              goodbye
            else
              puts "Not sure what you entered. Please type 'workout' or 'menu' to go back to the main menu or 'exit' to exit"
            end
      elsif input == "exit"
        goodbye
      else
        puts "Invalid. Please make sure you are either typing the article number or 'exit'."
        action
      end
  end

  def list_workouts
    #This will pull from Swolenews::Workout class
    puts "Workout_1"
    puts "Workout_2"
  end

  def goodbye
    puts "Keep up the good work and stay swole! See you soon!"
  end
end
