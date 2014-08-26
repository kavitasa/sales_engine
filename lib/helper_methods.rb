module HelperMethods

  def random
    all.sample
  end

    def inspect
    "#<#{self.class} #{@all.size} rows>"
  end

end
