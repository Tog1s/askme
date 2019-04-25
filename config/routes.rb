Rails.application.routes.draw do

  root 'users#index'

  # Ресурс пользователей (экшен destroy не поддерживается)
  resources :users, except: [:destroy]

  # Ресурс сессий (только три экшена :new, :create, :destroy)
  resources :session, only: [:new, :create, :destroy]

  # Ресурс вопросов (кроме экшенов :show, :new, :index)
  resources :questions, except: [:show, :new, :index]

  # Синонимы путей — в дополнение к созданным в ресурсах выше.
  #
  # Для любознательных: синонимы мы добавили, чтобы показать одну вещь и потом
  # их удалим.

end
