class Shop

  attr_reader :name, :id, :image_url, :url, :rating, :latitude, :longitude

  def initialize(name, id, image_url, url, rating, latitude, longitude, **args)
    raise ArgumentError if name.nil? || name == "" || id.nil? || id == ""
    @name = name
    @id = id
    @image_url = image_url
    @url = url
    @rating = rating
    @coords = {latitude: latitude, longitude: longitude}
    @display_phone = args[:display_phone] ||= nil
    @review_count = args[:review_count]
    @photos = args[:photos]
    @address = args[:address]
    @hours = args[:hours]
    @favorited = false
  end

  def favorited!
    @favorited = true
  end

end
