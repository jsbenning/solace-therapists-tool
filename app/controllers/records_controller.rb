class RecordsController < ApplicationController

  get '/clients/:id/records/:record_name/edit' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])  
      @record_name = params[:record_name]
      @record = @client.record
      erb :"records/#{@record_name}/edit"
    else
      redirect to '/error'
    end
  end

  get '/clients/:id/records/:record_name' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      @record_name = params[:record_name]
      @record = @client.record
      erb :"records/#{@record_name}/show"
    else
      redirect to '/error'
    end
  end

  patch '/clients/:id/records/:record_name' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      @record = @client.record
      if params[:record]
        (params[:record]).each do |param_key, param_value| #this method prevents empty fields from clearing values
          @record.attributes.each do |key, value|
            if key == param_key && param_value != "" && param_value != value
              @record.update((param_key.to_sym) => param_value)
            end
          end
        end
      end
      @record_name = (params[:record_name])
      redirect to "/clients/#{@client.id}/records/#{@record_name}"
    else
      erb :'error'
    end
  end
end