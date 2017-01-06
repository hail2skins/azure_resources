class Nsgrule < ApplicationRecord
	belongs_to :nsg, counter_cache: true
end
