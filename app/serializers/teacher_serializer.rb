class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :email, :phone, :subject, :img
  has_many :periods


  def fullname
  self.object.fullname.capitalize
  end

end
