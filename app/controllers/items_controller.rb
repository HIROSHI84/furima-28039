class ItemsController < ApplicationController
  def index
  end

  def item_params
  params.require(:item).permit(:content, :image)
  end
end
