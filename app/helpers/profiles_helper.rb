module ProfilesHelper
  def current_user_is_connecting(current_user_id, connected_user_id)
    relationship = Connect.find_by(connector_id: current_user_id, connecting_id: connected_user_id)
    return true if relationship

  end
end
