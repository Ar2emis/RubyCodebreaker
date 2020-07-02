# frozen_string_literal: true

RSpec.describe Codebreaker::Validator do
  subject(:validator) { class_with_validation.new }

  let(:class_with_validation) { Class.new { include Codebreaker::Validator } }

  describe '#validate_class' do
    it 'can validate instance class' do
      expect { validator.validate_class(String, 'abc') }.not_to raise_error
    end

    it 'can fail validation' do
      expect { validator.validate_class(String, 1) }.to raise_error(Codebreaker::UnexpectedClassError)
    end
  end

  describe '#validate_class_or_nil' do
    it 'can validate instance class' do
      expect { validator.validate_class_or_nil(String, '123') }.not_to raise_error
    end

    it 'can validate NilClass' do
      expect { validator.validate_class_or_nil(String, nil) }.not_to raise_error
    end

    it 'can fail validation' do
      expect { validator.validate_class_or_nil(String, 1.64) }.to raise_error(Codebreaker::UnexpectedClassError)
    end
  end

  describe '#validate_non_empty_string' do
    it 'can validate non empty string' do
      expect { validator.validate_non_empty_string('abc') }.not_to raise_error
    end

    it 'can fail validation' do
      expect { validator.validate_non_empty_string('') }.to raise_error(Codebreaker::EmptyStringError)
    end
  end

  describe '#validate_positive_integer' do
    it 'can validate positive integer' do
      expect { validator.validate_positive_integer(1) }.not_to raise_error
    end

    it 'can fail validation' do
      expect { validator.validate_positive_integer(0) }.to raise_error(Codebreaker::NonPositiveIntegerError)
    end
  end

  describe '#validate_non_negative_integer' do
    it 'can validate non negative integer' do
      expect { validator.validate_non_negative_integer(0) }.not_to raise_error
    end

    it 'can fail validation' do
      expect { validator.validate_non_negative_integer(-1) }.to raise_error(Codebreaker::NegativeIntegerError)
    end
  end

  describe '#validate_string_length' do
    it 'can validate string minimal length' do
      expect { validator.validate_string_length(string: 'aaa', min_length: 2) }.not_to raise_error
    end

    it 'can validate string minimal and maximal length' do
      expect { validator.validate_string_length(string: 'aaa', min_length: 1, max_length: 3) }.not_to raise_error
    end

    it 'can fail minimal length validation' do
      expect do
        validator.validate_string_length(string: 'aaa', min_length: 5)
      end.to raise_error(Codebreaker::InvalidStringLengthError)
    end

    it 'can fail minimal and maximal length validation by minimal length' do
      expect do
        validator.validate_string_length(string: 'aaa', min_length: 5, max_length: 10)
      end.to raise_error(Codebreaker::InvalidStringLengthError)
    end

    it 'can fail minimal and maximal length validation by maximal length' do
      expect do
        validator.validate_string_length(string: 'aaaaaaaaaa', min_length: 2, max_length: 3)
      end.to raise_error(Codebreaker::InvalidStringLengthError)
    end
  end

  describe '#validate_only_numeric_string' do
    it 'can validate only numeric string' do
      expect { validator.validate_only_numeric_string('1234') }.not_to raise_error
    end

    it 'can fail validation' do
      expect { validator.validate_only_numeric_string('a2da.') }.to raise_error(Codebreaker::NonNumericStringError)
    end
  end
end
