class StoragesController < ApplicationController

  def index
    @storages = Storage.all
  end

  def new
    @storage = Storage.new
  end

  def create
    storage = Storage.create(storage_parameter)
    if storage.save
      redirect_to storages_path
    else
      redirect_to new_storage_path
    end
  end


  # def destroy
  #   storage = Storage.find(params[:id])
  #   storage.destroy
  #   redirect_to storages_path
  # end

  private

  def storage_parameter
    params.require(:storage).permit(:title, :detail).merge(user_id: current_user.id )
  end

end
