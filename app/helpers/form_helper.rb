# frozen_string_literal: true

module FormHelper
  def errors_for(_form, _field)
    if resource.errors.any?

      I18n.t('errors.messages.not_saved',
             count: resource.errors.count,
             resource: resource.class.model_name.human.downcase)

      resource.errors.full_messages.each do |message|
        message
      end
    end
  end
end
