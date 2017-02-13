class System < ApplicationRecord
  
  def self.to_csv
    attributes = %w{name 
                    resource_group 
                    availability_set 
                    location
                    operating_system 
                    vm_size 
                    operating_system_version
                    storage
                    subnet
                    ip
                    nsg
                    nsg_resource_group}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      
      all.each do |system|
        csv << system.attributes.values_at(*attributes)
        #csv << attributes.map { |attr| system.send(attr) }
      end
    end
  end
end
