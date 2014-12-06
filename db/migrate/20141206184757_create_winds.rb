class CreateWinds < ActiveRecord::Migration
  def change
    create_table :winds do |t|
      t.multi_line_string :geom, :srid => 4326
    end
  end
end
