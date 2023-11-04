class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def creat
  end

  private

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
