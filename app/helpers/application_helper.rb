module ApplicationHelper
  def alert(message, kind)
    tag.div(class: 'col-md-12') do
      tag.div(message, class:"alert alert-#{kind}")
    end
  end
end
