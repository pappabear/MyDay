class Todo < ActiveRecord::Base

  def is_late?
    o = false

    if self.due_date.nil?
      return
    end

    if self.due_date < Date.today()
      if !self.is_complete?
        o = true
      end
    end

    return o
  end


  def description
    s = ""
    s += "Late. " if self.is_late?
    s += "Due " + self.due_date.to_s + ". "
    s += "Doesn't recur." if self.recurrence==0
    s += "Recurs daily." if self.recurrence==1
    s += "Recurs weekly." if self.recurrence==2
    s += "Recurs every 2 weeks." if self.recurrence==3
    return s
  end


end
