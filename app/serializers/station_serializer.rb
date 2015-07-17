class StationSerializer < ActiveModel::Serializer
  attributes :name, :short_name,
             :latitude, :longitude,
             :address, :city,
             :state, :zipcode,
             :county
end
