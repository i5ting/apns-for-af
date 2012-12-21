
class PemsController < ApplicationController
  # GET /pems
  # GET /pems.json
  def index
    @pems = Pem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pems }
    end
  end

  # GET /pems/1
  # GET /pems/1.json
  def show
    @pem = Pem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pem }
    end
  end

  # GET /pems/new
  # GET /pems/new.json
  def new
    @pem = Pem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pem }
    end
  end

  # GET /pems/1/edit
  def edit
    @pem = Pem.find(params[:id])
  end

  # POST /pems
  # POST /pems.json
  def create
    @pem = Pem.new(params[:pem])

    respond_to do |format|
      if @pem.save
        format.html { redirect_to @pem, notice: 'Pem was successfully created.' }
        format.json { render json: @pem, status: :created, location: @pem }
      else
        format.html { render action: "new" }
        format.json { render json: @pem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pems/1
  # PUT /pems/1.json
  def update
    @pem = Pem.find(params[:id])

    respond_to do |format|
      if @pem.update_attributes(params[:pem])
        format.html { redirect_to @pem, notice: 'Pem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pems/1
  # DELETE /pems/1.json
  def destroy
    @pem = Pem.find(params[:id])
    @pem.destroy

    respond_to do |format|
      format.html { redirect_to pems_url }
      format.json { head :no_content }
    end
  end
end
