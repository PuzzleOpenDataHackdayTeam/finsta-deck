class Service
  extend Forwardable
  attr_accessor :stack, :me, :you, :type

  def initialize(hash={})
    hash.each {|key, value| self.send("#{key}=", value) }
  end

  def compare
    result = { winner: :you, stack: stack.dup }

    if me.value(type).value > you.value(type).value
      result[:stack] = stack.dup.unshift(me, you)
      result[:winner] = :me
    end

    result[:percent] = percent(me.value(type).value, you.value(type).value)
    result[:values] = OpenStruct.new(me: me.value(type), you: you.value(type), type: Type.find(type))

    OpenStruct.new(result)
  end

  def percent(me, you)
    one_percent = [me,you].max / 80
    OpenStruct.new(me: me / one_percent, you: you / one_percent)
  end

end

