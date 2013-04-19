module Option
  include Option::Enumerable

  def match(&block)
    Match.new.tap { |m| block.call(m) }.evaluate(self)
  end

  protected

  def and_option(option)
    none? ? self : Some[*[option.value, value].flatten]
  end

  private

  def from_array(values)
    values.empty? ? None : Some[values.first]
  end

  def from_value(value)
    value.nil? ? None : Some[value]
  end

end
