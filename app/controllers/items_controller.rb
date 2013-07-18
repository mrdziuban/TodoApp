class ItemsController < ApplicationController
  def index
    @items = Item.find_all_by_project_id(params[:project_id])
  end

  def new
    @item = Item.new
    @projects = Project.all
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to project_url(@item.project)
    else
      flash[:notices] = "Could not create item"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @projects = Project.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to project_url(@item.project)
    else
      flash[:notices] = "Could not update item"
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to :back
  end
end