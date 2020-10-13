class Panel::DashboardController < PanelController
  def index
    @users_count = User.count
    @stores_count = Store.count
  end
end
