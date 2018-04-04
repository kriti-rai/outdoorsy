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
    3. Article_3_Title
    4. Article_4_Title
    5. Article_5_Title
    6. Article_6_Title
    7. Article_7_Title
    8. Article_8_Title
    9. Article_9_Title
    10. Article_10_Title

  3. Asks the user to type 'more' to view more articles. (shows 10 more if available, or all if less than 10, says 'no more' if 0 remaining) or...

  4. Asks user to type the number (string) of an article if they would like to see the workouts listed on it.

    Format
    1. Workout_1_Title (maybe colorize)
      <description: sets and reps>
      <duration>

## Article Class
  1. has a title
  2. has a URL
  3. has a short description
  4. has a read-time
  5. has workouts

## Workout Class
   1. has a title
   2. has short description (with reps and sets)

## Scraper Class
  Scrapes the website to list out the articles and further scrapes each article to provide a list of workouts inside.
  1. has a 'scrape_page' class method
    This gives an array of article (objects with the above listed properties)
  2. has a 'scrape_workouts' class method
    This gives an array of workouts (objects with the above listed properties) inside an article
