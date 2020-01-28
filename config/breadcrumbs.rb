# Root crumb
crumb :root do
  link "トップページ", root_path
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

# カテゴリー一覧
crumb :categories do
  link "カテゴリー一覧", categories_path
end

# カテゴリー検索
crumb :category do
  @category = Category.find(params[:id])
  link "#{@category.name}", category_path(@category)
  parent :categories
end

  # crumb :パンくず名 do
  #   link "パンくずに表示される文字", パス
  #   parent :必要に応じて、親ページのパンくず名を記述
  # end

  # - breadcrumb :パンくず名    <- 表示したいページの上部(ヘッダーより上)に記述