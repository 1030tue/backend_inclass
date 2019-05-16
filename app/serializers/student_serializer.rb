class StudentSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email, :img, :age, :grade, :gender, :guardians_name, :relationship_to_student, :guardians_email, :guardians_phone, :inclass, :demerits, :enrolledClasses

  def enrolledClasses
      self.object.enrolls.map do |enroll|
        {:id => enroll.period_id}
      end
  end


end
