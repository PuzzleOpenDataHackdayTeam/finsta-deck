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
    content_tag(:iframe, '', width: '100%', height: '200', frameborder: 0, scrolling: 'no', marginheight: 0, marginwidth: 0, src: "#{muni.map}&z=12&output=embed")
  end


  def types
    { 1 => "Selbstfinanzierungsgrad",
      5 => "Bruttoverschuldungsanteil",
      34 => "Fremdkapital / Einwohner",
      38 => "Ausgaben pro Schüler" }
  end
end
