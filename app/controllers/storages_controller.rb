class StoragesController < ApplicationController
  before_action :set_storage, only: [:edit, :show]

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


  def destroy
    storage = Storage.find(params[:id])
    storage.destroy
    redirect_to storages_path
  end


  def edit
  end

  def update
    storage = Storage.find(params[:id])
    storage.update(storage_parameter)
    redirect_to storages_path
  end

  def show
  end

  private

  def storage_parameter
    params.require(:storage).permit(:title, :detail, :image).merge(user_id: current_user.id )
  end

  def set_storage
    @storage = Storage.find(params[:id])
  end

end
