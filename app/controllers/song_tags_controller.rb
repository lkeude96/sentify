class SongTagsController < ApplicationController
  before_action :set_song_tag, only: [:show, :edit, :update, :destroy]

  # GET /song_tags
  # GET /song_tags.json
  def index
    @song_tags = SongTag.all
  end

  # GET /song_tags/1
  # GET /song_tags/1.json
  def show
  end

  # GET /song_tags/new
  def new
    @song_tag = SongTag.new
  end

  # GET /song_tags/1/edit
  def edit
  end

  # POST /song_tags
  # POST /song_tags.json
  def create
    @song_tag = SongTag.new(song_tag_params)

    respond_to do |format|
      if @song_tag.save
        format.html { redirect_to @song_tag, notice: 'Song tag was successfully created.' }
        format.json { render :show, status: :created, location: @song_tag }
      else
        format.html { render :new }
        format.json { render json: @song_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /song_tags/1
  # PATCH/PUT /song_tags/1.json
  def update
    respond_to do |format|
      if @song_tag.update(song_tag_params)
        format.html { redirect_to @song_tag, notice: 'Song tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @song_tag }
      else
        format.html { render :edit }
        format.json { render json: @song_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_tags/1
  # DELETE /song_tags/1.json
  def destroy
    @song_tag.destroy
    respond_to do |format|
      format.html { redirect_to song_tags_url, notice: 'Song tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song_tag
      @song_tag = SongTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_tag_params
      params.require(:song_tag).permit(:song_id, :tag_name)
    end
end
