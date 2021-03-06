class MemesController < ApplicationController
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    def show
      @meme = Meme.find(params[:id])
      @comments = @meme.comments.all
      @comment = @meme.comments.build
    end

    def new
      @meme = Meme.new
    end

    def create
      @meme = current_user.memes.create(meme_params)

      if @meme.save
        flash[:notice] = "Meme successfully created"
        redirect_to root_path
      else
        flash[:alert] = "Something bad happened"
        redirect_to new_meme_path
      end
    end

    def edit
      @meme = Meme.find(params[:id])
    end

    def update
      @meme = Meme.find(params[:id])

      if @meme.save
        flash[:notice] = "Meme successfully created"
        redirect_to root_path
      else
        flash[:alert] = "Something bad happened"
        redirect_to new_meme_path
      end
    end

    def destroy
      @meme = Meme.find(params[:id])
      if @meme.destroy
        flash[:notice] = "Meme successfully destroyed"
        redirect_to root_path
      else
        flash[:alert] = "Something bad happend in destroying meme"
        redirect_to root_path
      end
    end

    private
    def meme_params
      params.require(:meme).permit(:title, :body, :meme_type, :picture)
    end
end
