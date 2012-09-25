class Blog
  include Mongoid::Document
  field :name, type: String
  field :content, type: String
  field :tag, type: String
end



