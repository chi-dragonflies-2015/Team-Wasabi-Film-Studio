require 'rails_helper'

RSpec.describe Film, type: :model do
  
  before(:all) do
    DatabaseCleaner.strategy = :transaction
  end

  before(:each) do
    DatabaseCleaner.start
    @film = FactoryGirl.create(:film)
    @review = @film.reviews.build(FactoryGirl.create(:review))
  end

  after(:each) do
    DatabaseCleaner.clean
  end


end