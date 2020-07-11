class Beer < ApplicationRecord

    has_many :flights
    has_many :beers_flavors
    has_many :likes
    has_many :flavors, through: :beers_flavors
    has_many :orders, through: :flights
    has_many :users, through: :likes

    def all_beer_styles
        styles = Beer.all.map {|beer| beer.beer_style }.uniq
    end

    def self.find_beers(flavor)
        @flavor  = Flavor.where('descriptor LIKE ?', "%#{flavor}%")
        @beer = @flavor[0].beers.sample
    end

    def self.dedupe
        grouped = all.group_by{|beer| [beer.beer_name, beer.brewery, beer.beer_description] }
        grouped.values.each do |duplicates|
          first_one = duplicates.shift
          duplicates.each{|double| double.destroy}
        end
    end

end
