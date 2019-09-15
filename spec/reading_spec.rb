require_relative '../lib/reading'
require_relative '../lib/book'

describe Reading do
  before(:each) do
    @goodread = Reading.new
  end
  it 'initializes with an empty reading list' do
    expect(@goodread.reading_list).to be_empty
  end

  it 'can add more books to the reading list' do
    new_book = Book.new(title: 'Sapiens', author: 'Yuval Noah Harari', publisher: 'Harper Publishing')
    @goodread.add(new_book)
    expect(@goodread.reading_list.count).to eq(1)
    expect(@goodread.reading_list[0]).to eq(new_book)
  end
end
