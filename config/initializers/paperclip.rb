Paperclip.interpolates :description do |attachment, style|
  # it would be nil in case of created_at is nil
  attachment.instance.description
end