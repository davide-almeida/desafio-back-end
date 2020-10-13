class Panel::StoresController < PanelController
  before_action :set_store, only: [:destroy]
  def index
    @stores = Store.all
  end

  def destroy
    stores_name = @store.name
    if @store.destroy
      redirect_to panel_stores_path, notice: "O cadastro #{stores_name} foi excluído com sucesso!"
    else
      render :index
    end
  end

  private
    def set_store
      @store = Store.find(params[:id])
    end
end
