LLU::Application.routes.draw do
  resource :session, :only => [:create, :destroy, :new]
  get 'users/current', to: 'users#current_user_show'
  resources :students
  resources :student_klasses, :only => [:create, :destroy]
  resources :student_assignments, :only => [:create, :destroy, :update]
  resources :klasses do
    resources :assignments
  end
  root :to => "root#root"
end
