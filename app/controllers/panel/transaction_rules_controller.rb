class Panel::TransactionRulesController < PanelController
  def index
    @transaction_rules = TransactionRule.all
  end
end
