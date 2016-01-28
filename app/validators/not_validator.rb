class NotValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
      record.errors[attribute] << "can't be #{options[:with]} "+value if value == options[:with]
  end
end