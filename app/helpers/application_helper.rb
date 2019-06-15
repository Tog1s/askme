module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end
  
  def profile_color(user)
    if user.profile_color.present?
      user.profile_color
    else
      return '#005a55'
    end
  end
  
  def author(question)
    if question.author.present?
      link_to question.author.username, user_path(question.author)
    else
      return 'Анонимный пользователь'
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
  
  def sklonenie(number, one, few, many)
    if(number == nil || !number.is_a?(Numeric))
      number = 0
    end

    return many if (number % 100).between?(11, 14)
    return one if (number % 10) == 1
    return few if (number % 10).between?(2, 4)
  
    return many
  end
end
