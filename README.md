# NBA Statistics Project

### Goal:

The goal of this project is to take game data from NBA.com and populate tables to look out and evaluate game data by team, and player, in new and interesting ways.  

### Getting Started

	* Fork repositry and clone fork
	* Bundle Gems
	* CREATEDB nba_test and nba_development (developed in postgres)
	* Run rspec to see if everything is working, as of today (1/6/17), there are 89 passing tests and a lot of loaded test data to run tests.
	* Seed File has commented out code you can use to load seasons into your development database if you want.  Running a whole season is not quick, if you want to play with data, might I suggest commenting out one of the season seeds and altering the end date to be about a month.  I find a month has enough data

### Accomplished

* Models built, code written (and re-written) to get game data from NBA.com, on a day by day basis.  Model population has been tested via RSpec/Capybara combination.  This included having to re-write code to get data from NBA.com as original JSON requests had ceased working properly.
* Seed data written to populate 'more static' tables, for teams and divisions, along with a basic script for populating seasons (regular season data only) through currently existing code. 

### Needs Doing

* ActiveModel Queries - now that raw data is retrieved, it must be analyzed, simple and complex queries are required to do this
	* Get Team Recods
	* Get Play Stats
	* Be able to break down statistics in a variety of ways
		* home/away
		* division/conference opponents
* Is there a way to create a simple 'averages' query that you can feed in Team data or player data and ask for a specific outcome.
	* Can such a thing be done on a method in a model (i.e. Points is a model calculation)
* Views that present desired data in easy to follow and read ways
* Exporting access for users? 
* Protection (via login access) of sensitive methods and information
* Dealing with all star game and playoff series should be written
* I do have know where to find play by play data AND shot by shot data but each has its complications and perhaps is 'v2' after I can get to some MVP
* Tweak the DFS thing if Fan Duel and Draft Kings are merging? 


### Gems Introduced During Development

* should-mathcers
* database_cleaner
* curb
* pg (first use of postgres instead of SQLite in development environment )

### New Skills Learned 

* Breaking down and parsing complicated JSON data (from NBA.com)
* Testing models 
* Stubbing out methods that either can't be run or aren't needed when running a specific test
* The basics of curl, needed to use the curb gem properly
