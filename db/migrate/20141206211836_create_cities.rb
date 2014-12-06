class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
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
    
  end
end
