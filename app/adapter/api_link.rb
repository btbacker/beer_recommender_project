class ApiLink

    def self.get_data(beer)
        # url = "https://sandbox-api.brewerydb.com/v2/?key=734d5ff175c02f5cc38fe7f8142e242b"
        url = 'http://api.brewerydb.com/v2/search?key=734d5ff175c02f5cc38fe7f8142e242b&type=beer&q=Lagunitas'
        res = RestClient.get(url)
        data = res.body
        json_converted = JSON.parse(data)
        byebug
    end

end