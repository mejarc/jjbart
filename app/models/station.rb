class Station < ActiveRecord::Base
  alias_attribute :short_name, :abbr
  alias_attribute :latitude, :gtfs_latitude
  alias_attribute :longitude, :gtfs_longitude
end