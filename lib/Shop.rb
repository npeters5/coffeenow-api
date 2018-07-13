class Shop

  attr_reader :name, :id, :image_url

  def initialize(name, id, image_url, options = {} )
    raise ArgumentError if name.nil? || name == "" || id.nil? || id == ""
    @name = name
    @id = id
    @image_url = image_url

    @rating = options[:rating]
  end

end
