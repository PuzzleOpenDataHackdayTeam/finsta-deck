module FixtureHelper

  def munis_id(*args)
    if args.size > 1
      munis(*args).map(&:id)
    else
      munis(args.first).id
    end
  end

  def types_id(*args)
    if types.size > 1
      types(*args).map(&:id)
    else
      types(args.first).id
    end
  end

end
