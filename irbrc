class Object
  def pbcopy
    %x{ echo #{to_s} | pbcopy }
    self
  end
end
