


<%=@client.medical_record_id%> 
<br></br>
<%=@client.last_name%>, <%=@client.first_name%>
<form method="POST" action="/clients/<%= @client.id %>/edit">
<input id="hidden" type="hidden" name="_method" value="patch">






<h2>Edit Client Record</h2>
<form action="/clients/edit/id" method="POST">
  <input type="integer" name="medical_record_id" placeholder="Medical Record Number">
  <br></br>
  <input type="text" name="first_name" placeholder="First Name">
  <br></br>
  <input type="text" name="last_name" placeholder="Last Name">
  <br></br>
  <input type="text" name="date_of_birth" placeholder="Date of Birth (mm/dd/yyyy)">
  <br></br>
  <textarea rows="5" cols="50" name="address" placeholder="Address"></textarea>
    <br></br>
  <input type="text" name="phone" placeholder="Phone : xxx-xxx-xxxx">
  <br></br>
  <input type="submit" value="Create Client">
</form>



