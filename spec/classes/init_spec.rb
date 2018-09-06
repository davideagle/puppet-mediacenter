require 'spec_helper'
describe 'wowza' do

  context 'with defaults for all parameters' do
    it { should contain_class('wowza') }
  end
end
