class ApiLink

    def self.get_data(beer)
        url = 'http://api.brewerydb.com/v2/search?key=50883b154f39032a3ae35a12432c50cc&type=beer&q=ale?'
        res = RestClient.get(url)
        data = res.body
        json_converted = JSON.parse(data)
        byebug
        # json_converted.map do |beer|
        #     Beer.create
        # end
    end

end