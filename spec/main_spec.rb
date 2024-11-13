require_relative '../main'
require_relative '../io_purchase'
require_relative '../sample_purchase'

RSpec.describe 'Main file' do
  describe '#get_user_choice' do
    it "returns 'interactive' when user enters 'interactive'" do
      allow_any_instance_of(Object).to receive(:gets).and_return("interactive\n")
      expect(get_user_choice).to eq('interactive')
    end

    it "returns 'sample' when user enters 'sample'" do
      allow_any_instance_of(Object).to receive(:gets).and_return("sample\n")
      expect(get_user_choice).to eq('sample')
    end

    it "prompts until valid input is given" do
      allow_any_instance_of(Object).to receive(:gets).and_return("invalid\n", "sample\n")
      expect(get_user_choice).to eq('sample')
    end
  end
end
