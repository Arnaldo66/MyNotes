class NotesController < ApplicationController
	skip_before_action :authenticate_user!, :only => [:index, :show, :search]

	def index
		@notes = Note.page(params[:page])
	end

	def show
		@note = Note.find(params[:id])
	end

	def search
		@keyword = params[:keyword]
		@notes = Note.search(@keyword).page(params[:page])
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
		@note.user = current_user
		if @note.save
			flash[:notice] = "You've create a new note"
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
			flash[:notice] = "You've update a note"
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@note = Note.find(params[:id])
		@note.destroy
		redirect_to root_path
	end
end
