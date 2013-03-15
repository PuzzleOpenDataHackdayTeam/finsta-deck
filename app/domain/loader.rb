class Loader
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def you
    params[:you] ? find(:you) : (Muni.all - stack).sample
  end

  def me
    params[:me] ? find(:me) : stack.pop
  end

  def stack
    @stack ||= params[:stack] ? Muni.load(Array(params[:stack])) : []
  end


  def new_stack
    Muni.all.sample(Settings.start_count)
  end


  def find(key)
    Muni.find(params[key])
  end


end
