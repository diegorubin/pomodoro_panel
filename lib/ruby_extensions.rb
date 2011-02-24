class Fixnum
  def pretty_left_time
    if self > 0
      "#{self/60}:#{self%60}"
    else
      "Inativo"
    end
  end
  def left_time_in_minutes
    if self > 0
      (self/60).to_s + " minutos"
    else
      "Inativo"
    end
  end
end

