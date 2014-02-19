module Challah::RSpec

  # Sign the given user instance in
  def signin_as(user)
    ::Challah::Session.create!(user)
  end

  # Sign the given user instance out
  def signout
    ::Challah::Session.destroy
  end

end

RSpec.configure do |config|

  config.before(:each) do
    # Reset any challah user sessions for each test.
    $challah_test_session = nil
  end

  config.include Challah::RSpec, type: :controller

end
