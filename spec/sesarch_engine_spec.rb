require_relative '../lib/search_engine'
require_relative '../lib/google_api_wrapper'

describe SearchEngine do
  it 'returns a list of book objects' do
    searcher = SearchEngine.new
    allow(searcher).to receive(:search).and_return([Book.new('a', 'b', 'c')])
    result = searcher.search('abc')

    expect(result.length).to eq(1)
    expect(result.first.title).to eq('a')
    expect(result.first.author).to eq('b')
    expect(result.first.publisher).to eq('c')
  end
end
