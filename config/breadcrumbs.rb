# Root crumb
crumb :root do
  link "メルカリ", root_path
end

# マイページ list
crumb :mypage do
  link "マイページ", mypage_path
end

# ログアウト
crumb :logout do
  link "ログアウト", logout_path
  parent :mypage
end

# プロフィール
crumb :profile do
  link "プロフィール", mypage_profile_path
  parent :mypage
end

# カテゴリーとブランドの詳細ページを作成次第パンクズを以下に作成