class MemosController < ApplicationController
  def index
    @memos = Memo.includes(:user)
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.save
    redirect_to memos_path
  end


  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    redirect_to memos_path
  end

  private

  def memo_params
    params.require(:memo).permit(:memo).merge(user_id: current_user.id)
  end

end
