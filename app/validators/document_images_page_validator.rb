class DocumentImagesPageValidator < ActiveModel::EachValidator

  def validate_each(model, attr, value)
    size = Array(value).size
    return if size == 0
    model.errors.add(attr, 'missing_page') if size < model.context.min_page
    model.errors.add(attr, 'too_many_pages') if size > model.context.max_page
  end
end
