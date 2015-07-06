desc 'Fetch BART station data'
task :fetch_stations => :environment do
  require 'nokogiri'
  require 'httparty'

  url = HTTParty.get('http://api.bart.gov/api/stn.aspx?cmd=stns&key=MW9S-E7SL-26DU-VV8V')
  doc = Nokogiri::XML(url.body)
  places = doc.xpath('//stations/station')
  places.each do |place|
    @data = Station.new(
      name: place.at('name').text,
      abbr: place.at('abbr').text,
      gtfs_latitude: place.at('gtfs_latitude').text,
      gtfs_longitude: place.at('gtfs_latitude').text,
      address: place.at('address').text,
      city: place.at('city').text,
      county: place.at('county').text,
      state: place.at('state').text,
      zipcode: place.at('zipcode').text
    )
    @data.save
    if @data.save
      puts 'Scraper has saved the station data'
    else
      puts 'Error with the scraper somewhere'
    end
  end
end
