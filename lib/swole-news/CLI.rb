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
    list_workouts
    sleep (1)
    goodbye
  end

  def makes_articles
    scraped_articles = SwoleNews::Scraper.scrape_page
    SwoleNews::Article.create_from_page(scraped_articles)
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

  def list_workouts
    #asks for input
    #gets and converts the input to integer
    #calls Article.find_by_number(input) to return the article by number
    #calls Scraper.scrape_workouts(artile_url) to return the list of workouts


    puts "Please enter a number from the list to view the workouts listed inside or enter 'exit' to exit"

    input = gets.strip.downcase
    # while input != "exit"
      if input.between?(1,SwoleNews::Article.all.size)
        SwoleNews::Article.find_by_number(input)
      else
        puts "Invalid. Please make sure you are either typing the article number or 'exit'."
        list_workouts
      end
    end
    #lists specific workouts in the article and gives users to get instructions on each workout
    # input = nil
    # while input != "exit"
    #   puts "Please enter the number for the workout you are interested in or enter 'menu' to go back to the main menu. Enter 'exit' to exit"
    #   input = gets.strip.downcase
    #   case input
    #   when "1"
    #     puts "Showing the workout #{input}..."
    #   when "2"
    #     puts "Showing the workout #{input}..."
    #   when "menu"
    #     main_menu
    #   else
    #     puts "Invalid. Please make sure you are either typing the workout number, menu or exit."
    #   end
    # end
  end

  def goodbye
    puts "Keep up the good work and stay swole! See you soon!"
  end
end
