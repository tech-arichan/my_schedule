class MemosController < ApplicationController
  def index
    @memos = Memo.includes(:user)
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_parameter)
    if @memo.save
      redirect_to memos_path
    else
      redirect_to new_memo_path
    end
  end


  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    redirect_to memos_path
  end

  private

  def memo_parameter
    params.require(:memo).permit(:memo).merge(user_id: current_user.id )
  end

end
