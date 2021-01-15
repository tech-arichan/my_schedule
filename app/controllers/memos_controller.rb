class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new
  end

  def create
    Memo.create(memo_parameter)
    redirect_to memos_path
  end


  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    redirect_to memos_path
  end

  private

  def memo_parameter
    params.require(:memo).permit(:memo)
  end

end
