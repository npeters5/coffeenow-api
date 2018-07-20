class Shop

  attr_reader :name, :id, :image_url, :url, :rating, :latitude, :longitude

  def initialize(name, id, image_url, url, rating, latitude, longitude )
    raise ArgumentError if name.nil? || name == "" || id.nil? || id == ""
    @name = name
    @id = id
    @image_url = image_url
    @url = url
    @rating = rating
    @coords = {latitude: latitude, longitude: longitude}
  end

end
