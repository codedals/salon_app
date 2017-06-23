class Notification
  attr_accessor :to, :registration_ids, :condition, :collapse_key, :dry_run, :priority, :data, :notification, :title, :body, :icon, :click_action, :notifier

  @@notifier ||= FCM.new(Rails.application.secrets.firebase["messaging"]["server_key"])

  class << self
    def send_to_user(device_id:, title:, body:)
      response = @@notifier.send([device_id], {data: {title: title, body: body}})
    end
  end
end
