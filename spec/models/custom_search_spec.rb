# custom_search_spec.rb

require 'spec_helper'

describe CustomSearch do 

  it {should validate_presence_of(:user) }
  it { should validate_presence_of(:date) }


end