Rails.application.routes.draw do
  devise_for :users
  root 'memos#index'
  get   'memos'      =>  'memos#index'     #ツイート一覧画面
  get   'memos/new'  =>  'memos#new'
  post  'memos'      =>  'memos#create'
  delete  'memos/:id'  => 'memos#destroy'
  get   'memos/:id/edit'  => 'memos#edit'
  patch   'memos/:id'  => 'memos#update'
  get 'memos/:id' => 'memos#show'
end
