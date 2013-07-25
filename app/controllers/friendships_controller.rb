class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new(follower_id: current_user.id,
                                   friend_id: params[:user_id])
    @friendship.save

    render json: @friendship
  end

  def destroy
    @friendships = Friendship.where(follower_id: current_user.id,
                                      friend_id: params[:user][:friend_id])

    @friendships.destroy_all

    render json: current_user.friends
  end

end
