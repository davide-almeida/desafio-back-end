class Panel::TransactionsController < PanelController
  before_action :set_transaction, only: [:destroy]
  def index
    @transactions = Transaction.where(store_id: params[:store_id])
    @store = Store.find(params[:store_id])
    
    # Balance methods
    def sum(a, b)
      a.to_i + b.to_i
    end
    def sub(a, b)
      a.to_i - b.to_i
    end
    
    # Balance
    @balance = 0
    @input = 0
    @output = 0
    @transactions.each do |transaction|
      if transaction.transaction_rule.operator == "+"
        @balance = sum(@balance, transaction.value_cents)
        @input = sum(@input, transaction.value_cents)
      elsif transaction.transaction_rule.operator == "-"
        @balance = sub(@balance, transaction.value_cents)
        @output = sum(@output, transaction.value_cents)
      end
    end
  end

  def destroy
    if @transaction.destroy
      redirect_to panel_store_transactions_path, notice: "A transação foi excluída com sucesso!"
    else
      render :index
    end
  end

  private
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

end
