class MemosController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @memos = Memo.includes(:user).page(params[:page]).per(5).order("id DESC")
  end

  def new
    @memo = Memo.new
  end

  def create
    Memo.create(text: memo_params[:text], user_id: current_user.id)
  end

  def destroy
    memo = Memo.find(params[:id])
    if memo.user_id == current_user.id
      memo.destroy
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    memo = Memo.find(params[:id])
    if memo.user_id == current_user.id
      memo.update(memo_params)
    end
  end

  private
  def memo_params
    params.require(:memo).permit(:text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end