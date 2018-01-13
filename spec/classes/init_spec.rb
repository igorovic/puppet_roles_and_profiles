require 'spec_helper'
describe 'roles_and_profiles' do
  context 'with default values for all parameters' do
    it { should contain_class('roles_and_profiles') }
  end
end
