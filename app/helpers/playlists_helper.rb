module PlaylistsHelper
  def is_playlist_owner p
    user_signed_in? && ( p.user.id.equal? current_user.id )
  end
end