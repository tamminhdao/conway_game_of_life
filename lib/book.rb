class Book
  attr_reader :title, :author, :publisher

  def initialize(args)
    @title = args[:title] || 'N/A'
    @author = args[:author] || 'N/A'
    @publisher = args[:publisher] || 'N/A'
  end
end
