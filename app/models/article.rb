class Article
    include Mongoid::Document
    attr_accessible :content, :name, :tag_list
    acts_as_taggable
  end