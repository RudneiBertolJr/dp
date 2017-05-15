require 'spec_helper'
describe 'dataprotector' do
  context 'with default values for all parameters' do
    it { should contain_class('dataprotector') }
  end
end
