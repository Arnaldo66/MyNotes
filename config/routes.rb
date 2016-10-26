Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "note#index"
  get  "notes" ,to: "note#index", as: :notes
  get  "notes/search" ,to: "note#search", as: :note_search
  get  "notes/new" ,to: "note#new", as: :note_new
  get  "notes/:id/edit" ,to: "note#edit", as: :note_edit
  get  "notes/:id" ,to: "note#show", as: :note
  post  "notes" ,to: "note#create"
  patch  "notes/:id" ,to: "note#update", as: :note_update 
end