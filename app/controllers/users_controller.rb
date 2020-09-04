class UsersController < ApplicationController
  before_action :move_to_root, except: [:show, :destroy]

  def index
  end

  def show
  end

  def edit
  end

  def sold_lists
  end
  def display_lists
  end

  def confirm_deletion
  end

  def confirm_edit
  end

  private
  def move_to_root  #ログインしていなければ、トップ画面に遷移
    redirect_to root_path unless user_signed_in?
  end
end
