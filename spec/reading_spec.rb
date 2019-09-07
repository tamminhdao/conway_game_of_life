require_relative '../lib/reading'

describe Reading do
  before(:each) do
    @goodread = Reading.new
  end
  it 'initializes with an empty reading list' do
    expect(@goodread.reading_list).to be_empty
  end

  it 'can add more books to the reading list' do
    new_book = { title: 'Sapiens', author: 'Harari', publisher: 'Harper' }
    @goodread.add(new_book)
    expect(@goodread.reading_list.count).to eq(1)
    expect(@goodread.reading_list[0]).to eq(new_book)
  end

  xit 'presents a formatted reading list' do
    sapiens = { title: 'Sapiens', author: 'Harari', publisher: 'Harper' }
    poodr = { title: 'POORD', author: 'Sandi Metz', publisher: 'MIT' }
    @goodread.add(sapiens)
    @goodread.add(poodr)
    pretty_list = '1. Sapiens - Harari - Harper \n2. POORD - Sandi Metz - MIT'

    expect(@goodread.formatted_reading_list).to eq(pretty_list)
  end
end
