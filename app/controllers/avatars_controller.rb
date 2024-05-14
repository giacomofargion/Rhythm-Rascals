class AvatarsController < ApplicationController
  def show
    @avatars = Avatar.all # This fetches all avatars if you have an Avatar model
  end
end
