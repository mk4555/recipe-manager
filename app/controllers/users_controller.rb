class UsersController < ApplicationController
  def sign_out
    user_session.destroy
  end
end
