Class SpCall < ActiveRecord::Base
    def self.fetch_val_from_sp(proc_name_with_parameters)
        connection.select_value(proc_name_with_parameters)
    end
end

Class Util
   def self.get_date
    Time.now.strftime(‘%F’)
   end
end