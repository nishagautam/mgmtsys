class ItemsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Items", :items_path

  def new
    @item =Item.new
    @item.build_stock
  end
  def create
    @item = Item.new(item_param)
    if@item.save
      @log = Log.create(description: "Edited new item"+ " "+ @item.name, user: current_user)

      redirect_to @item
    else
      render 'new'
    end
    end

  def show
    @items = Item.find(params[:id])
  end

  def index
    @item = Item.paginate(:page => params[:page], :per_page => 3)

  end

  def edit
    @item = Item.find(params[:id])
    @log = Log.create(description: "Edited new item " + " " +  @item.name, user: current_user)

  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_param)
    redirect_to @item
  end

  def destroy
    @item = Item.destroy(params[:id])
    @log = Log.create(description: "deleted new item  "+ ""+ @item.name, user: current_user)
    redirect_to @item
  end

  private
  def item_param
    params.require(:item).permit( :name, :unit_id, :item_code, :item_group_id, :description, stock_attributes: [ :quantity, :unit_price, :est_sell_price])
  end
end

