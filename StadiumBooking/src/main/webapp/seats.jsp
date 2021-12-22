<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.stadiumbooking.daoimpl.MatchDaoImpl" %>
    <%@page import="java.sql.ResultSet" %>
    
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>

         
* {
  box-sizing: border-box;
}

body {
  background-color: white;
  color: black;
  display: flex;
  flex-direction: column;
  align-items: center;

  height: 100vh;
  font-family: 'Lato', sans-serif;
 
}


.stadium-container select {
  background-color: white;
  border: 0;
  color: black;
  border:2px solid black;
  border-radius: 5px;
  font-size: 14px;
  margin-left: 10px;
  padding: 5px 15px 5px 15px;
 
}

.container {
  perspective: 1000px;
  margin-bottom: 30px;
}

.seat {
  background-color: #444451;
  height: 12px;
  width: 15px;
  margin: 3px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.seat.selected {
  background-color: #6feaf6;
}

.seat.occupied {
  background-color: red;
}


.seat:not(.occupied):hover {
  cursor: pointer;
  transform: scale(1.2);
}

.showcase .seat:not(.occupied):hover {
  cursor: default;
  transform: scale(1);
}

.showcase {
  background: rgba(0, 0, 0, 0.1);
  padding: 5px 10px;
  border-radius: 5px;
  color: #777;
  list-style-type: none;
  display: flex;
  
}

.showcase li {
  display: flex;
  align-items: center;

  margin: 0 10px;
}

.showcase li small {
  margin-left: 2px;
}

.row {
  display: flex;
}
img{
width:50px;
height:50px;
}
#teamA{
position:relative;

}
#teamB{
position:relative;
left:70px;
}
b{
text-align: center;
}
button {
position:relative;
left:250px;
width:100px;
}
</style>

</head>


<body>
      <%
    MatchDaoImpl matchDao=new MatchDaoImpl();
      int matchId=Integer.parseInt(request.getParameter("matchId")) ;
    ResultSet rs=matchDao.getMatchByMatchId(matchId);
    %>
    <%if(rs.next()){ %>
    
    <div>
    <div>
     <img src="<%=rs.getString(7) %>"> &nbsp; &nbsp;<b>Vs</b>  &nbsp;  <img src="<%=rs.getString(8) %>">
    <br>
    <br>
    <strong id="teamA"><%=rs.getString(5) %></strong>  
    
     
    <strong id="teamB"><%=rs.getString(6) %></strong>
    <br>
    </div>
    <br>
    <div>
    <b><%=rs.getString(2) %></b>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <b><%=rs.getString(1) %></b>
    <br>
   
    <br> <%=rs.getString(3) %> &nbsp; &nbsp; <%=rs.getString(4) %>
    <br>
    </div>
    </div>
     <br> <br>
     <label><b>Available Seats:</b><%=rs.getInt(12) %></label>
    <div class="stadium-container">
        <form action="booking">
        <br>
        <input type="text" id="matchId" value="<%=request.getParameter("matchId")%>" name="matchIds" style="visibility:hidden;"> 
       <label> </label>
        <label><b>Pick a Seats Category:</b></label>
       
        <select id="stadium" name="seatsCategory">
       
          <option value="<%=rs.getInt(9) %>">FirstClass (Rs.<%=rs.getInt(9) %>)</option>
          <option value="<%=rs.getInt(10) %>">Second Class(Rs.<%=rs.getInt(10) %>)</option>
        </select>
        
        <input type="text" id="category" name="category" style="visibility:hidden;">


        <br>
        <br>
        
        
        <label > <b>Number Of Tickets:</b></label>
        <input type="text" id="count" name="seatCounts"> &nbsp;&nbsp;&nbsp; <label ><b>Total Price:</b></label>
        <input type="text" id="total" name="totalprice">
        <br><br>
        <button type="submit" onmouseover="check()" >Pay</button>

    </form>
      </div>
<%} %>  


      <ul class="showcase">
        <li>
          <div class="seat"></div>
          <small>N/A</small>
        </li>
        <li>
          <div class="seat selected"></div>
          <small>Selected</small>
        </li>
        <li>
          <div class="seat occupied"></div>
          <small>Occupied</small>
        </li>
      </ul>
  
      <div class="container">
    
  
        <div class="row">
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>
        <div class="row">
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat occupied"></div>
          <div class="seat occupied"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>
        <div class="row">
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat occupied"></div>
          <div class="seat occupied"></div>
        </div>
        <div class="row">
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>
        <div class="row">
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat occupied"></div>
          <div class="seat occupied"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>
        <div class="row">
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat occupied"></div>
          <div class="seat occupied"></div>
          <div class="seat occupied"></div>
          <div class="seat"></div>
        </div>
      </div>
  
     
</body>
</html>

<script>

    const container=document.querySelector('.container');
    const seats=document.querySelectorAll('.row .seat:not(.occupied)');
    const count=document.getElementById('count');
    const total= document.getElementById('total');
    const seatsSelect=document.getElementById('stadium');

    var seatsCategory=document.getElementById('category');
    let ticketPrice =+seatsSelect.value;

    function updateSelectedCount() {
        const selectedSeats =document.querySelectorAll('.row .seat.selected');
        const selectedSeatsCount =selectedSeats.length;

        count.value=selectedSeatsCount;
        total.value=selectedSeatsCount*ticketPrice;
    }

    seatsSelect.addEventListener('change', (e) =>{

        ticketPrice=+e.target.value;
        updateSelectedCount();
    });


    container.addEventListener('click',(e) => {

        if(e.target.classList.contains('seat') && !e.target.classList.contains('occupied')){
            console.log(e.target);
            e.target.classList.toggle('selected');
             updateSelectedCount();
  
        }
    });
    
    function check(){
    <%
    ResultSet rs1=matchDao.getMatchByMatchId(matchId);
    if(rs1.next()){
    %>
    console.log(<%=rs1.getInt(9) %>);  
        if(seatsSelect.options[seatsSelect.selectedIndex].value=="<%=rs1.getInt(9) %>"){
        	 console.log('vanakkam');
        	seatsCategory.value="First Class";
        	 console.log(seatsCategory.value);
        }
        else if(seatsSelect.options[seatsSelect.selectedIndex].value=="<%=rs1.getInt(10) %>"){
        	seatsCategory.value="Second Class";
        	 console.log(seatsCategory.value);
        }
        <%}%>
    }
</script>