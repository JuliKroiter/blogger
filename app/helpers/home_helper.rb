module HomeHelper

  def pluralize_article count
    Russian.p(count, 'статья', 'статьи', 'статей')
  end

end
