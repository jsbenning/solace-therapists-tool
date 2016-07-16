class TherapistsController < ApplicationController

  post '/therapists/new' do
    @therapist = Therapist.create(username: params["username"], 
    password: params["password"], first_name: params["first_name"], 
    last_name: params["last_name"], license_type: params["license_type"],
    license_number: params["license_number"])
    if @therapist.save || logged_in?
      session[:therapist_id] = @therapist.id
      @clients = @therapist.clients
      erb :'therapists/show_therapist'
    else
      redirect to '/register'
    end
  end

  get '/therapists/:id/edit' do
    if logged_in?
      @therapist = current_user
      @clients = @therapist.clients
      erb :'therapists/edit_therapist'
    else
      erb :'error'
    end
  end

  get '/therapists/:id' do
    if logged_in?
      @therapist = current_user
      @clients = @therapist.clients
      erb :'therapists/show_therapist'
    else
      erb :'error'
    end
  end

  patch '/therapists/:id/edit' do
    if logged_in?
      @therapist = current_user
      @therapist.update(params["therapist"])
      redirect to "/therapists/#{@therapist.id}"
    else
      erb :'index'
    end
  end
end

=begin
  <p>To change this client's therapist, select from the following:</p>
  <%@therapists.each do |therapist|%>
   <input type="radio"  name="client[therapist]"  id="<%= therapist.id%>" value="<%=therapist.id%>"><%=therapist.first_name%> <%=therapist.last_name%>, <%=therapist.license_type%> 
   <%end%>
  
=end