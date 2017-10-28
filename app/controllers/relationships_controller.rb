class RelationshipsController < ApplicationController
  def connect_user
    @user = User.find_by! user_name: params[:user_name]
    if current_user.connect @user.id
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js
      end
    end
  end

  def disconnect_user
    @user = User.find_by! user_name: params[:user_name]
    if current_user.disconnect @user.id
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js
      end
    end
  end
end
