require_relative '../lib/io_adapter'

describe IOadapter do
  before(:each) do
    @input = StringIO.new("Hello World\r\n")
    @output = StringIO.new
    @io_adapter = IOadapter.new(@input, @output)
  end

  it 'collects user input' do
    expect(@io_adapter.user_input).to eq('Hello World')
  end

  it 'presents console output' do
    @io_adapter.console_output 'Google Books API'
    expect(@output.string).to include('Google Books API')
  end
end
