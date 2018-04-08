#CLI Controller
require 'colorize'
require 'pry'

class SwoleNews::CLI

  def call
    makes_articles
    # make_workouts
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
    # SwoleNews::Article.all.each do |article|
    #   workout_array = SwoleNews::Scraper.scrape_workouts(article.url)
    #   SwoleNews::Workout.create_from_collection(workout_array)
    #   article.workouts = SwoleNews::Workout.all
    # end
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

  def view_articles(article, input)
    # article = SwoleNews::Article.find_by_number(input)
    sleep(1)
    puts "Viewing article no.#{input}".colorize(:blue)
    sleep(1.5)
    puts "#{article.title}".colorize(:red) + " * #{article.read_time} *"
    puts "- - - - - - - - - - - - - - - -".colorize(:green)
    sleep(0.5)
  end

  def action
    #asks for input
    #calls Article.find_by_number(input) to return the article by number
    #calls Scraper.scrape_workouts(artile_url) to return the list of workouts
    # puts "Please enter a number from the list to view the workouts listed inside or enter 'exit' to exit"

    puts "Please enter a number from the list to view the workouts listed inside or enter 'exit' to exit"
    input_1 = gets.strip.downcase
      if input_1.to_i.between?(1, SwoleNews::Article.all.size)
        article = SwoleNews::Article.find_by_number(input_1)
        view_articles(article, input_1)
          puts "Would you like to view the workouts listed inside the article?"
          puts "If yes, please type 'yes' or 'menu' to go back to the main menu or 'exit' to exit"
          input_2 = nil
          while input_2 != "exit"
            input_2 = gets.strip.downcase
              if input_2 == "yes"
                list_workouts(article)
                puts "Please type 'menu' to go back to the main menu or 'exit' to exit"
                  input_3 = nil
                  while input_3 != "exit"
                    input_3 = gets.strip.downcase
                      if input_3 == "menu"
                        main_menu
                        action
                      elsif input_3 == "exit"
                        goodbye
                        break
                      else
                        puts "Not sure what you entered. Please type 'menu' to go back to the main menu or 'exit' to exit"
                      end
                  end
              elsif input_2 == "menu"
                main_menu
                action
              elsif input_2 == "exit"
                goodbye
                break
              else
                puts "Not sure what you entered. Please type 'yes' or 'menu' to go back to the main menu or 'exit' to exit"
              end
            end
        elsif input_1 == "exit"
          goodbye
        else
          puts "Invalid. Please make sure you are either typing the article number or 'exit'."
          action
        end
  end

  def list_workouts(article)
    sleep(1)
    puts "Now listing the workouts...".colorize(:blue)
    sleep(1.5)
    article.workouts.each.with_index(1) do |workout, i|
      puts "#{i}. #{workout.title}"
      puts "**#{workout.definition}**"
    end
  end

  def goodbye
    sleep(1)
    puts "Keep up the good work and stay swole! See you soon!".colorize(:yellow)
  end
end
