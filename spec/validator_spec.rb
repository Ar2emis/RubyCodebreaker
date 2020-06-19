# frozen_string_literal: true

RSpec.describe Codebreaker::Validator do
  let(:class_with_validation) { Class.new { include Codebreaker::Validator } }
  subject(:validator) { class_with_validation.new }

  context '#validate_class' do
    it 'can validate instance class' do
      expect { validator.validate_class(String, String) }.not_to raise_error
    end

    it 'can fail validation and raise CodebreakerArgumentError' do
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

    it 'can fail validation and raise CodebreakerArgumentError' do
      expect { validator.validate_class_or_nil(String, Integer) }.to raise_error(Codebreaker::CodebreakerArgumentError)
    end
  end

  context '#validate_non_empty_string' do
    it 'can validate non empty string' do
      expect { validator.validate_non_empty_string('abc') }.not_to raise_error
    end

    it 'can fail validation and raise CodebreakerArgumentError' do
      expect { validator.validate_non_empty_string('') }.to raise_error(Codebreaker::CodebreakerArgumentError)
    end
  end

  context '#validate_positive_integer' do
    it 'can validate positive integer' do
      expect { validator.validate_positive_integer(1) }.not_to raise_error
    end

    it 'can fail validation and raise CodebreakerArgumentError' do
      expect { validator.validate_positive_integer(0) }.to raise_error(Codebreaker::CodebreakerArgumentError)
    end
  end

  context '#raise_error' do
    it 'can raise error with message' do
      expect { validator.raise_error(StandardError, 'Error message') }.to raise_error(StandardError)
    end
  end
end
