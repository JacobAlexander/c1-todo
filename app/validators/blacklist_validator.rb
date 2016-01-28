class BlacklistValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    tryme = value.split(' ').to_a
    tryme.each do |item|
      record.errors[attribute] << (" is incorrect, word '#{item}' was blacklisted")  if blacklist.include? item.downcase
    end
  end

  private

  def blacklist
    File.readlines(Rails.root.join('config', 'blacklist.txt')).map(&:strip)
  end
end