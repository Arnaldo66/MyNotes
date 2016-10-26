class NoteController < ApplicationController

	def index
		@notes = Note.all
	end

	def show
		@note = Note.find(params[:id])
	end

	def search
		@keyword = params[:keyword]
		@notes = Note.search(@keyword)
		render "index"
	end

	def new
		@note = Note.new
	end

	def user_params
		params.require(:note).permit(:title,:content)
	end

	def create
		@note = Note.create(user_params)
		redirect_to root_path
	end

	def edit
		@note = Note.find(params[:id])
	end

	def update
		@note = Note.find(params[:id])
		@note.update(user_params)
		redirect_to root_path
	end

end
