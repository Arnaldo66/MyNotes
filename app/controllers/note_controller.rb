class NoteController < ApplicationController

	def index
		@notes = Note.page(params[:page])
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
		@note = Note.new(user_params)
		if @note.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@note = Note.find(params[:id])
	end

	def update
		@note = Note.find(params[:id])
		if @note.update(user_params)
			redirect_to root_path
		else
			render :edit
		end
	end

end
