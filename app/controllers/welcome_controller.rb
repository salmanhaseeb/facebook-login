class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def posts
    @graph = Koala::Facebook::API.new(current_user.facebook_access_token)

    @profile = @graph.get_object("me")
    @user_posts = @graph.get_connections('me', 'posts')
  end
end
