# encoding: UTF-8
module ApplicationHelper

  def title(title='')
    @title ||= title if title.present?
    @title
  end

  def show
    size = @stack.size
    if size <= 1
     game_over_path
    elsif size >= Settings.needed_for_win
      victory_path
    else
      show_path(stack: @stack.map(&:id))
    end
  end

  def compare(type)
    compare_path(stack: @stack.map(&:id), me: @me, you: @you, type: type)
  end

  def numbers(muni)
    muni.numbers.map do |number|
      { name: number.id, value: number.formatted_value }
    end
  end

  def can_play_stack?
    @stack.size <= Settings.single_card_limit
  end

  def google_map(muni)
    image_tag(Maps::GoogleStatic.new.url(muni))
  end

  def types
    Type.pretty_names
  end

  def format_number(number)
    case number.type.unit
    when /percent/ then number_to_percentage(number.value, precision: 2)
    when /chf/ then  [number.value, 'CHF'].join(' ')
    end
  end

  # use => because we already poped stack when we are viewing this
  def stack_circles
    classes = Settings.needed_for_win.times.map { |index| @stack.size >= index ? :me : :you }
    content = classes.map { |css_class| content_tag(:div, "", class: "circle #{css_class}") }
    content_tag(:div, safe_join(content), class: 'circles')
  end


end
