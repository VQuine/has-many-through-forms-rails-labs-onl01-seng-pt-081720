class Post < ActiveRecord::Base
  has_many :comments
  has_many :users, through: :comments
  
  has_many :post_categories
  has_many :categories, through: :post_categories
  accepts_nested_attributes_for :categories
  
    

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|

      if !category_attribute[:name].blank? # #BLANK - ActiveRecord|RAILS ACTIVESUPPORT EXTENSION: Method to check for nil or empty string
        
        category = Category.find_or_create_by(category_attribute)
        self.categories << category

      end

    end
  end

end
