require 'spec_helper'
describe 'OmniAuth::Strategies::Napster' do
  subject do
    OmniAuth::Strategies::Napster.new({})
  end

  context "client options" do
    it 'should have correct name' do
      expect(subject.options.name).to eq("napster")
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://api.napster.com')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('/oauth/access_token')
    end

  end
end
