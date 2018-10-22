json.array! @notifications do |notification|
  json.id notification.id
  # json.recipient notification.recipient
  json.actor notification.actor
  json.action notification.action
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end #notification notifiable
  json.url admin_leaves_path(notification.notifiable.leave_type, anchor:
                                          dom_id(notification.notifiable))
end
