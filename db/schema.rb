# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141206211836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "cities", force: true do |t|
    t.string  "city_name",  limit: 30
    t.string  "fips_cntry", limit: 2
    t.string  "cntry_name", limit: 30
    t.float   "pop"
    t.float   "pop_rank"
    t.float   "pop_est"
    t.decimal "data_1961"
    t.decimal "data_1962"
    t.decimal "data_1963"
    t.decimal "data_1964"
    t.decimal "data_1965"
    t.decimal "data_1966"
    t.decimal "data_1967"
    t.decimal "data_1968"
    t.decimal "data_1969"
    t.decimal "data_1970"
    t.decimal "data_1971"
    t.decimal "data_1972"
    t.decimal "data_1973"
    t.decimal "data_1974"
    t.decimal "data_1975"
    t.decimal "data_1976"
    t.decimal "data_1977"
    t.decimal "data_1978"
    t.decimal "data_1979"
    t.decimal "data_1980"
    t.decimal "data_1981"
    t.decimal "data_1982"
    t.decimal "data_1983"
    t.decimal "data_1984"
    t.decimal "data_1985"
    t.decimal "data_1986"
    t.decimal "data_1987"
    t.decimal "data_1988"
    t.decimal "data_1989"
    t.decimal "data_1990"
    t.decimal "data_1991"
    t.decimal "data_1992"
    t.decimal "data_1993"
    t.decimal "data_1994"
    t.decimal "data_1995"
    t.decimal "data_1996"
    t.decimal "data_1997"
    t.decimal "data_1998"
    t.decimal "data_1999"
    t.decimal "data_2000"
    t.decimal "data_2001"
    t.decimal "data_2002"
    t.decimal "data_2003"
    t.decimal "data_2004"
    t.decimal "data_2005"
    t.decimal "data_2006"
    t.decimal "data_2007"
    t.decimal "data_2008"
    t.decimal "data_2009"
    t.decimal "data_2010"
    t.string  "ccode",      limit: 5
    t.float   "annualtemp"
    t.spatial "geom",       limit: {:srid=>4326, :type=>"point"}
  end

  add_index "cities", ["geom"], :name => "cities_geom_idx", :spatial => true

  create_table "countries", force: true do |t|
    t.string  "name",       limit: 36
    t.float   "pop_est"
    t.decimal "data_1961"
    t.decimal "data_1962"
    t.decimal "data_1963"
    t.decimal "data_1964"
    t.decimal "data_1965"
    t.decimal "data_1966"
    t.decimal "data_1967"
    t.decimal "data_1968"
    t.decimal "data_1969"
    t.decimal "data_1970"
    t.decimal "data_1971"
    t.decimal "data_1972"
    t.decimal "data_1973"
    t.decimal "data_1974"
    t.decimal "data_1975"
    t.decimal "data_1976"
    t.decimal "data_1977"
    t.decimal "data_1978"
    t.decimal "data_1979"
    t.decimal "data_1980"
    t.decimal "data_1981"
    t.decimal "data_1982"
    t.decimal "data_1983"
    t.decimal "data_1984"
    t.decimal "data_1985"
    t.decimal "data_1986"
    t.decimal "data_1987"
    t.decimal "data_1988"
    t.decimal "data_1989"
    t.decimal "data_1990"
    t.decimal "data_1991"
    t.decimal "data_1992"
    t.decimal "data_1993"
    t.decimal "data_1994"
    t.decimal "data_1995"
    t.decimal "data_1996"
    t.decimal "data_1997"
    t.decimal "data_1998"
    t.decimal "data_1999"
    t.decimal "data_2000"
    t.decimal "data_2001"
    t.decimal "data_2002"
    t.decimal "data_2003"
    t.decimal "data_2004"
    t.decimal "data_2005"
    t.decimal "data_2006"
    t.decimal "data_2007"
    t.decimal "data_2008"
    t.decimal "data_2009"
    t.decimal "data_2010"
    t.decimal "sheet1_ann"
    t.string  "ccode",      limit: 5
    t.spatial "geom",       limit: {:srid=>4326, :type=>"multi_polygon"}
  end

  add_index "countries", ["geom"], :name => "countries_geom_idx", :spatial => true

  create_table "winds", force: true do |t|
    t.spatial "geom", limit: {:srid=>4326, :type=>"multi_line_string"}
  end

end
