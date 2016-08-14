# NBA Statistics Project

### Goal:

The goal of this project is to take game data from NBA.com and populate tables to look out and evaluate game data by team, and player, in new and interesting ways.  

### Accomplished

* Models built, code written (and re-written) to get game data from NBA.com, on a day by day basis.  Model population has been tested via RSpec/Capybara combination.  This included having to re-write code to get data from NBA.com as original JSON requests had ceased working properly.
* Seed data written to populate 'more static' tables, for teams and divisions, along with a basic script for populating seasons (regular season data only) through currently existing code. 

### Needs Doing

* ActiveModel Queries - now that raw data is retrieved, it must be analyzed, simple and complex queries are required to do this
* Views that present desired data in easy to follow and read ways
* Exporting access for users? 
* Protection (via login access) of sensitive methods and information

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
