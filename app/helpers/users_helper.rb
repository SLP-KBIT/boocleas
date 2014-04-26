module UsersHelper
  def check_or_ban_icon(flag)
    icon = flag ? 'checkmark green' : 'ban circle red'
    raw "<i class='ui icon #{icon}'></i>"
  end
end
