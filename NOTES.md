# Outline

 This CLI gem scrapes off data from https://www.bodybuilding.com/category/training to provide the latest articles in workouts. The user can then further look into the article to see the workouts listed.

## CLI

  1. User types swolemate (working title)
  2. Shows a list of the articles. (10 at a time)

    Format
    1. Article_1_Title (maybe colorize)
      <short description>
      <Read time>
      <URL for the whole read>
    2. Article_2_Title
    (*Future feature: Asks the user to type 'more' to view more articles. (shows 10 more if available, or all if less than 10, says 'no more' if 0 remaining) or...*)

  3. Asks user to type the number (string) of an article if they would like to see the workouts listed on it.

    Format
    1. Workout_1_Title (maybe colorize)
      <definition: sets and reps>

      Methods:
      1. makes_articles <<<< NEEDS RE-WRITING. workouts not populating by article. ATM all workouts are showing.
      2. view_articles
      3. main_menu
      4. action
      5. list_workouts
      6. goodbye

## Article Class
  1. has a title
  2. has a URL
  3. has a short description
  4. has a read-time
  5. has workouts
  6. each article has 1 or more workouts

## Workout Class
   Scrapes each article.url to list out workouts inside

   1. has a title
   2. has short description (with reps and sets)
   3. belongs to an article

## Scraper Class
  Scrapes the website to list out the articles and further scrapes each article to provide a list of workouts inside.
  1. has a 'scrape_page' class method
    This gives an array of article (objects with the above listed properties)
  2. has a 'scrape_workouts' class method
    This gives an array of workouts (objects with the above listed properties) inside an article
