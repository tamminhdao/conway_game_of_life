require 'spec_helper'

describe Validation do
  before(:each) do
    @validator = Validation.new
    @menu = {
      '1' => 'Search for books',
      '2' => 'View my reading list',
      '3' => 'Quit the program'
    }
  end

  context '#validate' do
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

  context '#validate_book_selection' do
    it 'returns true if the user enters 1' do
      result = @validator.validate_book_selection('1')
      expect(result).to be_truthy
    end

    it 'returns true if the user enters 10' do
      result = @validator.validate_book_selection('10')
      expect(result).to be_truthy
    end

    it 'returns true if the user enters a number between 1 and 10' do
      result = @validator.validate_book_selection('7')
      expect(result).to be_truthy
    end

    it 'returns false if the user enters 0' do
      result = @validator.validate_book_selection('0')
      expect(result).to be_falsey
    end

    it 'returns false if the user enters a negative number' do
      result = @validator.validate_book_selection('-10')
      expect(result).to be_falsey
    end

    it 'returns false if the user enters not a number' do
      result = @validator.validate_book_selection('ten')
      expect(result).to be_falsey
    end
  end
end
