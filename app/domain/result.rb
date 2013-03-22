class Result
  attr_reader :hash
  delegate :winner, :percent, :values, to: :hash

  def initialize(game, type)
    hash = { winner: :you }
    me, you = game.me.value(type), game.you.value(type)

    if me.value > you.value
      hash[:winner] = :me
    end
    hash[:percent] = calculate_percent(me.value, you.value)
    hash[:values] = OpenStruct.new(me: me, you: you, type: Type.find(type))
    @hash = OpenStruct.new(hash)
  end

  def calculate_percent(me, you)
    total = me + you
    my_percent = (me / total * 100).ceil
    your_percent = 100 - my_percent
    OpenStruct.new(me: my_percent, you: your_percent)
  end
end
