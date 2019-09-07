require_relative './book'

class SearchEngine
  def search(keyword)
    api_result = GoogleBooksApiWrapper.search(keyword)
    api_result.items.map do |item|
      data = item.volume_info
      Book.new(data.title, data.authors[0], data.publisher)
    end
  end
end
