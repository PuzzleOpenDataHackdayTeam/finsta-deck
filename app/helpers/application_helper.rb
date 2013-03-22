# encoding: UTF-8
module ApplicationHelper

  def title(title='')
    @title ||= title if title.present?
    @title
  end

  def show
    if @stack
      show_path(stack: @stack.map(&:id))
    else
      show_path
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


end
