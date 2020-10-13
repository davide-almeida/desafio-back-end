class Panel::DropsController < PanelController
  before_action :set_drop, only: [:destroy]
  def index
    @drops = Drop.all
  end

  def new
    @drop = Drop.new
  end

  def create
    @drop = Drop.new(params_drop)
    @drop.user_id = current_user.id

    @file_path = ActiveStorage::Blob.service.send(:path_for, @drop.file.key)
    @transaction_rules = TransactionRule.all
    File.open(@file_path) do |lines|
      lines.each do |line|

        #Store save data
        @store_name = nil
        @store_owner = nil
        @store_name = line.slice(62..80).chomp
        @store_owner = line.slice(48..61).chomp
        if Store.find_by_name(@store_name).present? == false
          @store = Store.new(name: @store_name, owner: @store_owner)
          @store.save
        end

        # Transation save data
        @rule = nil
        @rule = @transaction_rules.find_by_kind(line.slice(0).chomp)
        @store = Store.find_by_name(@store_name)

        @transaction_kind = @rule.id
        @transaction_value = (line.slice(9..18).to_f)/100.00
        @transaction_cpf = line.slice(19..29).chomp.insert(3, '.').insert(7, '.').insert(11, '-')
        @transaction_card = line.slice(30..41).chomp
        @transaction_date = line.slice(1..8).chomp.insert(4, '/').insert(7, '/')
        @transaction_time = line.slice(42..47).chomp.insert(2, ':').insert(5, ':')
        @transaction_datetime = "#{@transaction_date} #{@transaction_time} #{Time.now.strftime("%z")}"
        @occurrence_time = @transaction_datetime.to_datetime
        @transaction = Transaction.new(transaction_rule_id: @transaction_kind, store_id: @store.id, value_cents: @transaction_value, cpf_number: @transaction_cpf, card_number: @transaction_card, occurrence_time: @occurrence_time)
        @transaction.save
      end
    end
    
    if @drop.save
      redirect_to panel_drops_path, notice: "O cadastro #{@drop.title} foi realizado com sucesso!"
    else
      render :new
    end
  end

  def destroy
    drop_title = @drop.title
    if @drop.destroy
      redirect_to panel_drops_path, notice: "O cadastro #{drop_title} foi excluído com sucesso!"
    else
      render :index
    end
  end

  private
    def set_drop
      @drop = Drop.find(params[:id])
    end

    def params_drop
      params.require(:drop).permit(:title, :file)
    end

end
