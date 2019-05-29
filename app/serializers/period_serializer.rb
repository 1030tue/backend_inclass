class PeriodSerializer < ActiveModel::Serializer
  attributes :id, :classname, :duration, :period_num, :teacher, :students

  def classname
  self.object.classname.capitalize
  end


  def teacher
    {:teacher_id => self.object.teacher.id,
      :name => self.object.teacher.fullname,
      :email => self.object.teacher.email,
      :grade => self.object.teacher.phone,
      :subject => self.object.teacher.subject}
  end


  def students
    self.object.students.map do |student|
    {:id => student.id,
      :firstname => student.firstname,
      :lastname => student.lastname,
      :email => student.email,
      :gender => student.gender,
      :grade => student.grade,
      :guardians_name => student.guardians_name,
      :relationship_to_student => student.relationship_to_student,
      :guardians_email => student.guardians_email,
      :guardians_phone => student.guardians_phone,
      :inclass => student.inclass,
      :demerits => student.demerits,
      :trips => student.trips
    }
    end
  end

end
