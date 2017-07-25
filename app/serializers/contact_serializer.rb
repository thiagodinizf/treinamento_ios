class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :nickname, :birth_date, :email, :phone_number, :nickname, :image_url, :user_id
end
