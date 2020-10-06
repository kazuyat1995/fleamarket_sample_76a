# トップページ(ルート)
crumb :root do
  link "トップページ", root_path
end

# 商品詳細ページ
crumb :show do
  link "商品詳細ページ", item_path
end

# 商品購入ページ
crumb :confirm do
  link "商品購入ページ", confirm_item_path
  parent :show
end

# 会員情報入力ページ
crumb :users_new do
  link "会員情報入力", new_user_registration_path
  parent :root
end

# ログイン
crumb :login do
  link "ログイン", new_user_session_path
  parent :root
end

# マイページ
crumb :mypage do
  link "マイページ", user_path(current_user)
end

# 商品出品一覧
crumb :user_display_lists do
  link "商品出品一覧", display_lists_user_path
  parent :mypage
end

# 商品購入履歴
crumb :user_sold_lists do
  link "商品購入履歴", sold_lists_user_path
  parent :mypage
end

# 商品削除確認ページ
crumb :confirm_deletion do
  link "商品削除確認ページ", confirm_deletion_user_path
  parent :mypage
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