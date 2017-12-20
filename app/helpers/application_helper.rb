module ApplicationHelper
  def category_select
    [["All Categories", "All"]] + Category.all.pluck(:name, :id)
  end

  def author_select
    [["All Authors", "All"]] + Author.all.pluck(:name, :id)
  end
end
