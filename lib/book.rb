class Book
  attr_reader :title, :author, :publisher

  def initialize(title, author, publisher)
    @title = title
    @author = author
    @publisher = publisher
  end
end
