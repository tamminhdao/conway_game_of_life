require 'google/apis/books_v1'

class GoogleBooksApiWrapper
  def self.search(keyword)
    gbook = Google::Apis::BooksV1::BooksService.new
    gbook.key = ENV['GOOGLE_API_KEY']
    gbook.list_volumes(keyword)
  end
end
