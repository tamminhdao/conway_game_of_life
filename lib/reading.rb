class Reading
  attr_reader :reading_list

  def initialize(reading_list = [])
    @reading_list = reading_list
  end

  def add(book)
    reading_list << book
  end
end
