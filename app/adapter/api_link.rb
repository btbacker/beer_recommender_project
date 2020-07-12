class ApiLink

    def self.get_data(beer)
        url = 'https://api.untappd.com/v4/search/beer?q=lager&limit=50&client_id=9DED174D29B0B92A010B93987C3A5EA7F138FF87&client_secret=B67ADF09F15D30AD3E14C9006B7C1FA49C0E52C1'
        res = RestClient.get(url)
        data = res.body
        json_converted = JSON.parse(data)
        # byebug
        json_converted["response"]["beers"]["items"].map do |beer|
            Beer.create(beer_name: beer["beer"]["beer_name"], brewery: beer["brewery"]["brewery_name"], beer_style: beer["beer"]["beer_style"], beer_description: beer["beer"]["beer_description"], country: beer["brewery"]["country_name"], abv: beer["beer"]["beer_abv"], ibu: beer["beer"]["beer_ibu"], beer_image: beer["beer"]["beer_label"], brewery_city: beer["brewery"]["location"]["brewery_city"], brewery_region: beer["brewery"]["location"]["brewery_state"], brewery_active: beer["brewery"]["brewery_active"], brewery_latitude: beer["brewery"]["location"]["lat"], brewery_longitude: beer["brewery"]["location"]["lng"])
        end
    end

end