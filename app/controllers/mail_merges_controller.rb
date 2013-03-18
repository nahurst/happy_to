class MailMergesController < ApplicationController
  # GET /mail_merges
  # GET /mail_merges.json
  def index
    @mail_merges = MailMerge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mail_merges }
    end
  end

  # GET /mail_merges/1
  # GET /mail_merges/1.json
  def show
    @mail_merge = MailMerge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mail_merge }
    end
  end

  # GET /mail_merges/new
  # GET /mail_merges/new.json
  def new
    @mail_merge = MailMerge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mail_merge }
    end
  end

  # GET /mail_merges/1/edit
  def edit
    @mail_merge = MailMerge.find(params[:id])
  end

  # POST /mail_merges
  # POST /mail_merges.json
  def create
    @mail_merge = MailMerge.new(params[:mail_merge])

    respond_to do |format|
      if @mail_merge.save
        format.html { redirect_to @mail_merge, notice: 'Mail merge was successfully created.' }
        format.json { render json: @mail_merge, status: :created, location: @mail_merge }
      else
        format.html { render action: "new" }
        format.json { render json: @mail_merge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mail_merges/1
  # PUT /mail_merges/1.json
  def update
    @mail_merge = MailMerge.find(params[:id])

    respond_to do |format|
      if @mail_merge.update_attributes(params[:mail_merge])
        format.html { redirect_to @mail_merge, notice: 'Mail merge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mail_merge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_merges/1
  # DELETE /mail_merges/1.json
  def destroy
    @mail_merge = MailMerge.find(params[:id])
    @mail_merge.destroy

    respond_to do |format|
      format.html { redirect_to mail_merges_url }
      format.json { head :no_content }
    end
  end
end
