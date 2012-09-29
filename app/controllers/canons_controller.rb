class CanonsController < ApplicationController
  # GET /canons
  # GET /canons.json
  def index
    @canons = Canon.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @canons }
    end
  end


  def random
    @canon = Canon.where(archived: false).order('RANDOM()').first
    if @canon.nil?
      redirect_to new_canon_path
    else
      respond_to do |format|
        format.html { render action: 'show' }
        format.json { render json: @canon }
      end
    end
  end

  # GET /canons/1
  # GET /canons/1.json
  def show
    @canon = Canon.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @canon }
    end
  end

  # GET /canons/new
  # GET /canons/new.json
  def new
    @canon = Canon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @canon }
    end
  end

  # GET /canons/1/edit
  def edit
    @canon = Canon.find(params[:id])
  end

  # POST /canons
  # POST /canons.json
  def create
    @canon = Canon.new(params[:canon])

    respond_to do |format|
      if @canon.save
        format.html { redirect_to @canon, notice: 'Canon was successfully created.' }
        format.json { render json: @canon, status: :created, location: @canon }
      else
        format.html { render action: "new" }
        format.json { render json: @canon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /canons/1
  # PUT /canons/1.json
  def update
    @canon = Canon.find(params[:id])
    # body = params[:canon][:body]
    # category_id = params[:canon][:category]

    respond_to do |format|
      # @canon.body = body
      # if category_id.nil?
      #   @canon.category = nil
      # else
      #   @canon.category = Category.find(category_id)
      # end

      # if @canon.save
      if @canon.update_attributes(params[:canon])
        format.html { redirect_to @canon, notice: 'Canon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @canon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canons/1
  # DELETE /canons/1.json
  def destroy
    @canon = Canon.find(params[:id])
    @canon.destroy

    respond_to do |format|
      format.html { redirect_to canons_url }
      format.json { head :no_content }
    end
  end

  def archive
    id = params[:id]
    canon = Canon.find(id)
    canon.archived = true
    canon.save

    redirect_to random_path
  end

  def unarchive
    id = params[:id]
    canon = Canon.find(id)
    canon.archived = false
    canon.save

    redirect_to canons_path
  end
end
