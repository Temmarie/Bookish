class HomeController < ApplicationController
  after_action :set_status
  def index
  end

  def chats
  end

  private 

  def set_status
    current_user.update!(status: User.statuses[:offline]) if current_user
  end
end
