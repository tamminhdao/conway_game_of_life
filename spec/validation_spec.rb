require_relative '../lib/validation'

describe Validation do
  before(:each) do
    @validator = Validation.new
    @menu = {
      '1' => 'Search for books',
      '2' => 'View my reading list',
      '3' => 'Quit the program'
    }
  end

  it 'returns true when given correct user input' do
    result = @validator.validate(@menu, '1')
    expect(result).to be_truthy
  end

  it 'returns false when given incorrect user input' do
    result = @validator.validate(@menu, '5')
    expect(result).to be_falsey
  end

  it 'returns false when given no user input' do
    result = @validator.validate(@menu, nil)
    expect(result).to be_falsey
  end

  it 'returns false when given a new line as user input' do
    result = @validator.validate(@menu, "\n")
    expect(result).to be_falsey
  end
end
