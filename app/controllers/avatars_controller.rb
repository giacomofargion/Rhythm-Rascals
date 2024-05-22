class AvatarsController < ApplicationController
  def show
    @avatar = Avatar.find(params[:id])
  end

  def index
    @avatars = Avatar.all
    respond_to do |format|
      format.json do
        return render json: {
          avatars: (render_to_string partial: 'avatars/avatars', formats: [:html], locals: { avatars: @avatars, opacity: true })
        }
      end
    end
  end
end
