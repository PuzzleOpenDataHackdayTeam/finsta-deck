class Game
  attr_reader :params, :stack, :me, :you, :options

  def initialize(request_params, game_params={})
    @params = request_params
    @options = initialize_options(game_params)

    initialize_stack
    initialize_you
    initialize_me
  end

  def compare
    if me.value(type).value > you.value(type).value
      @stack = stack.dup.unshift(me, you)
    elsif me.value(type).value == you.value(type).value
      @stack = stack.dup.unshift(me)
    end
    @result = Result.new(self, type)
  end

  private

  def initialize_options(game_params)
    @options = OpenStruct.new(Settings.to_hash.merge(game_params))
  end

  def initialize_stack
    @stack = params[:stack] ? Muni.load(Array(params[:stack])) : Muni.all.sample(options.start_count)
  end

  def initialize_you
    @you = params[:you] ? Muni.includes(numbers: [:type]).find(params[:you]) : (Muni.all - stack).sample
  end

  def initialize_me
    @me = params[:me] ? Muni.includes(numbers: [:type]).find(params[:me]) : stack.pop
  end

  def type
    params[:type]
  end

end
