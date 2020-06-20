# frozen_string_literal: true

RSpec.describe Codebreaker::Validator do
  let(:class_with_validation) { Class.new { include Codebreaker::Validator } }
  subject(:validator) { class_with_validation.new }

  context '#validate_class' do
    it 'can validate instance class' do
      expect { validator.validate_class(String, String) }.not_to raise_error
    end

    it 'can fail validation' do
      expect { validator.validate_class(String, Integer) }.to raise_error(Codebreaker::CodebreakerArgumentError)
    end
  end

  context '#validate_class_or_nil' do
    it 'can validate instance class' do
      expect { validator.validate_class_or_nil(String, String) }.not_to raise_error
    end

    it 'can validate NilClass' do
      expect { validator.validate_class_or_nil(String, nil.class) }.not_to raise_error
    end

    it 'can fail validation' do
      expect { validator.validate_class_or_nil(String, Integer) }.to raise_error(Codebreaker::CodebreakerArgumentError)
    end
  end

  context '#validate_non_empty_string' do
    it 'can validate non empty string' do
      expect { validator.validate_non_empty_string('abc') }.not_to raise_error
    end

    it 'can fail validation' do
      expect { validator.validate_non_empty_string('') }.to raise_error(Codebreaker::CodebreakerArgumentError)
    end
  end

  context '#validate_positive_integer' do
    it 'can validate positive integer' do
      expect { validator.validate_positive_integer(1) }.not_to raise_error
    end

    it 'can fail validation' do
      expect { validator.validate_positive_integer(0) }.to raise_error(Codebreaker::CodebreakerArgumentError)
    end
  end

  context '#validate_non_negative_integer' do
    it 'can validate non negative integer' do
      expect { validator.validate_non_negative_integer(0) }.not_to raise_error
    end

    it 'can fail validation' do
      expect { validator.validate_non_negative_integer(-1) }.to raise_error(Codebreaker::CodebreakerArgumentError)
    end
  end

  context '#validate_string_length' do
    it 'can validate string minimal length' do
      expect { validator.validate_string_length(string: 'aaa', min_length: 2) }.not_to raise_error
    end

    it 'can validate string minimal and maximal length' do
      expect { validator.validate_string_length(string: 'aaa', min_length: 1, max_length: 3) }.not_to raise_error
    end

    it 'can fail minimal length validation' do
      expect do
        validator.validate_string_length(string: 'aaa', min_length: 5)
      end.to raise_error(Codebreaker::CodebreakerArgumentError)
    end

    it 'can fail minimal and maximal length validation by minimal length' do
      expect do
        validator.validate_string_length(string: 'aaa', min_length: 5, max_length: 10)
      end.to raise_error(Codebreaker::CodebreakerArgumentError)
    end

    it 'can fail minimal and maximal length validation by maximal length' do
      expect do
        validator.validate_string_length(string: 'aaaaaaaaaa', min_length: 2, max_length: 3)
      end.to raise_error(Codebreaker::CodebreakerArgumentError)
    end
  end

  context '#validate_only_numeric_string' do
    it 'can validate only numeric string' do
      expect { validator.validate_only_numeric_string('1234') }.not_to raise_error
    end

    it 'can fail validation' do
      expect { validator.validate_only_numeric_string('a2da.') }.to raise_error(Codebreaker::CodebreakerArgumentError)
    end
  end

  context '#raise_error' do
    it 'can raise error with message' do
      expect { validator.raise_error(StandardError, 'Error message') }.to raise_error(StandardError)
    end
  end
end
