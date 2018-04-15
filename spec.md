Specifications for the CLI Assessment
Specs:

 [X] Have a CLI for interfacing with the application

 My CLI interface resides in the CLI.rb file that outlines how the user will be prompted for an input in various scenarios. It calls in various helper methods to create articles, view and list the articles and the workouts, and an exit option to quit the program.

 [X]Pull data from an external source

    My Scraper class extracts a list of articles and workouts inside from http://bodybuilding.com/category/workouts using various css selectors and returns arrays of those elements that are hashes.

 [X]Implement both list and detail views

    The users are provided with a list of articles that consists of the title of an article and read-time. After choosing an article, the viewer will get to see the same info alongside a brief description of the article and a URL. The viewer will then get an option to view the workouts listed inside the article, which then consists of a number of workouts.
