crumb :root do
  link "エフマケ", root_path
end

crumb :user do
  link "マイページ", user_path(:id)
end

crumb :cards do
  link "クレジットカード", cards_path
  parent :user
end

crumb :new_card do
  link "クレジットカード情報入力", new_card_path
  parent :cards
end

crumb :item do
  link "出品商品画面", item_path
  parent :user
end

crumb :logout_user do
  link "ログアウト", logout_user_url
  parent :user
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).