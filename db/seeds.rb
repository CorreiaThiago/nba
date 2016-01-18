# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


unless Division.exists?(name: "Atlantic")
  Division.create(name: "Atlantic", conference: "Eastern")
end

unless Division.exists?(name: "Central")
  Division.create(name: "Central", conference: "Eastern")
end

unless Division.exists?(name: "Southeast")
  Division.create(name: "Southeast", conference: "Eastern")
end

unless Deivision.exists?(name: "Northwest")
  Division.create(name: "Northwest", conference: "Western")
end

unless Division.exists?(name: "Pacific")
  Division.create(name: "Pacific", conference: "Western")
end

unless Division.exists?(name: "Southwest")
  Division.create(name: "Southwest", conference: "Western")
end

divisions = {atlantic: Division.find_by(name: "Atlantic").id
            , central: Division.find_by(name: "Central").id
            , southeast: Division.find_by(name: "Southeast").id
            , pacific: Division.find_by(name: "Pacific").id 
            , southwest: Division.find_by(name: "Southeast").id 
            , northwest: Division.find_by(name: "Northwest").id
}


atlantic = [
  {city: "Philadelphia" , nickname: "Seventy-Sixers" , abbreviation: "PHI", nbacomid: 1610612755}.
  {city: "Toronto" , nickname: "Raptors" , abbreviation: "TOR", nbacomid: 1610612761},
  {city: "Brooklyn" , nickname: "Nets" , abbreviation: "BKN", nbacomid: 1610612751},
  {city: "New York" , nickname: "Knicks" , abbreviation: "NYK", nbacomid: 1610612752},
  {city: "Boston" , nickname: "Celtics" , abbreviation: "BOS", nbacomid: 1610612738}
]

central = [ 
  {city: "Chicago" , nickname: "Bulls" , abbreviation: "CHI", nbacomid: 1610612741},
  {city: "Indiana" , nickname: "Pacers" , abbreviation: "IND", nbacomid: 1610612754},
  {city: "Detroit" , nickname: "Pistons" , abbreviation: "DET", nbacomid: 1610612765},
  {city: "Milwaukee" , nickname: "Bucks" , abbreviation: "MIL", nbacomid: 1610612749},
  {city: "Cleveland" , nickname: "Cavaliers" , abbreviation: "CLE", nbacomid: 1610612739}
]
{city: "Washington" , nickname: "Wizards" , abbreviation: "WAS", nbacomid: 1610612764},
{city: "Orlando" , nickname: "Magic" , abbreviation: "ORL", nbacomid: 1610612753 },
{city: "Atlanta" , nickname: "Hawks" , abbreviation: "ATL", nbacomid: 1610612737 },
{city: "Miami" , nickname: "Heat" , abbreviation: "MIA", nbacomid: 1610612748},
{city: "Charlotte" , nickname: "Hornets" , abbreviation: "CHA", nbacomid: 1610612766}

{city: "Utah" , nickname: "Jazz" , abbreviation: "UTA", nbacomid: 1610612762},
{city: "Denver" , nickname: "Nuggets" , abbreviation: "DEN", nbacomid: 1610612743},
{city: "Oklahoma City" , nickname: "Thunder" , abbreviation: "OKC", nbacomid: 1610612760},
{city: "Portland" , nickname: "Trailblazers" , abbreviation: "POR", nbacomid: 1610612757},
{city: "Minnesota" , nickname: "Timberwolves" , abbreviation: "MIN", nbacomid: 1610612750}

{city: "Los Angeles" , nickname: "Lakers" , abbreviation: "LAL", nbacomid: 1610612747 },
{city: "Phoenix" , nickname: "Suns" , abbreviation: "PHX", nbacomid: 1610612756},
{city: "Los Angeles" , nickname: "Clippers" , abbreviation: "LAC", nbacomid: 1610612746},
{city: "Sacramento" , nickname: "Kings" , abbreviation: "SAC", nbacomid: 1610612758},
{city: "Golden State" , nickname: "Warriors" , abbreviation: "GSW", nbacomid: 1610612744}

{city: "San Antonio" , nickname: "Spurs" , abbreviation: "SAS", nbacomid: 1610612759},
{city: "Memphis" , nickname: "Grizzlies" , abbreviation: "MEM", nbacomid: 1610612763},
{city: "New Orleans" , nickname: "Pelicans" , abbreviation: "NOP", nbacomid: 1610612740},
{city: "Houston" , nickname: "Rockets" , abbreviation: "HOU", nbacomid: 1610612745 },
{city: "Dallas" , nickname: "Mavericks" , abbreviation: "DAL", nbacomid: 1610612742}

















