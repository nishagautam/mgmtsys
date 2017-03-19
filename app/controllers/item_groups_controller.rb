class ItemGroupsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "ItemGroups", :item_groups_path
  def new
    @item_group =ItemGroup.new
    #@item_groups = ItemGroup.new
  end


  def create
    @item_group = ItemGroup.new(item_group_param)
    if@item_group.save
      @log = Log.create(description: "Added new item group" + @item_group.name, user: current_user)
    redirect_to @item_group
    else
      render 'new'
  end
end
  def show
    @item_groups = ItemGroup.find(params[:id])
  end

  def index
    @item_group = ItemGroup.paginate(:page => params[:page], :per_page => 3)

  end

  def edit
    @item_group = ItemGroup.find(params[:id])
    if@item_group.save
    @log = Log.create(description: "Edited new item group "+ " "+ @item_group.name, user: current_user)
      redirect_to @item_group
    else
      render 'new'
    end
    end

  def update
    @item_group = ItemGroup.find(params[:id])
    @item_group.update(item_group_param)
    redirect_to @item_group
  end

  def destroy
    @item_group = ItemsGroup.destroy(params[:id])
    @log = Log.create(description: "Edited new item group" +" "+ @item_group.name, user: current_user)
    redirect_to @item_group
  end

  private
  def item_group_param
    params.require(:item_group).permit( :name, :parent_id, :description)
  end
end


