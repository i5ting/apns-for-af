require 'APNS'
class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new
    @projects = Project.all
    @pems = Pem.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # 
  def sendsss
    @messages = Message.all
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end


  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    
    @message.project=Project.find(params[:pid])
    @message.project.pem=Pem.find(params[:pemids])

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
  
  def apns
    @message = Message.find(params[:id])
    logger.info "--------------------------------------------------------"    
    logger.info @message
    logger.info "--------------------------------------------------------"
    
    @message.project.token.each do |t|
      logger.info t
      
      
      #APNS.host = 'gateway.push.apple.com' 
      APNS.host = 'gateway.sandbox.push.apple.com' 
      #gateway.sandbox.push.apple.com is default

      APNS.pem  = '/Users/sang/push/my.pem'
      # this is the file you just created

      APNS.port = 2195 
      # this is also the default. Shouldn't ever have to set this, but just in case Apple goes crazy, you can.

      device_token = '1c47f5a74714b28a00014684a64f02c7f60426e6c9a6ee6b068efddb57c9d6a9'
      #device_token = 'f96a71d53bbe3a5d077755f120002db9705289081d4d6b4fa8724441b4f331c2'

      #APNS.send_notification(device_token, 'Hello iPhone!' )
      #APNS.send_notification(device_token, :alert => 'Hello iPhone!', :badge => 1, :sound => 'default')

      APNS.send_notification(device_token, :alert => 'bahangye', :badge => 1, :sound => 'default', :other => {:hash => 'zlrltPL'})

APNS.send_notification(device_token, :alert => 'renrenle', :badge => 1, :sound => 'default', :other => {:symbol => 'sz002336',:type => 2 })

    end
 
    #    APNS.send_notification(device_token, :alert => 'renrenle', :badge => 1, :sound => 'default', :other => {:symbol => 'sz002336',:type => 2 })
   
    # loop do
    # # puts `ifconfig `
    #   sleep 3
    #   p '-' * 10
    # end
    #
      # respond_to do |format|
        # if true
        #          format.html { redirect_to @message, notice: 'Message was successfully created.' }
        #          format.json { render json: @message, status: :created, location: @message }
        #        else
        #          format.html { render action: "new" }
        #          format.json { render json: @message.errors, status: :unprocessable_entity }
        #        end
      # end
       
  end
end
