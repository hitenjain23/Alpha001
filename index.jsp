
<%@page import="com._360consultme.model.InterfaceUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>

<!DOCTYPE html>
<html> 
<head> 
   <!--Start  Meta Tags -->   
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
   <!--End    Meta Tags -->
    <title>360ConsultMe</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">  
    <!-- Start - Custom styles for this template -->
    <link  rel="stylesheet" href="css/360custom.css">   
     <link  rel="stylesheet" href="css/360footer.css"> 
    <!-- End - Custom styles for this template -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js">        
    </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js">        
    </script>
    <script src="js/test.js" type="text/javascript" >        
    </script> 
    <script type="text/javascript" >    
      function mydefaultcity(){
          var x = document.getElementById("inputcity"); 
          x.value="Bangalore"; 
         
  
}
 var xhr = false;
 var statesArray = new Array();

function initAll() {
	document.getElementById("inputArea").onkeyup = searchSuggest;

	if (window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
	}
	else {
		if (window.ActiveXObject) {
			try {
				xhr = new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch (e) { }
		}
	}

	if (xhr) {
		xhr.onreadystatechange = setStatesArray;
		xhr.open("GET", "us-states.xml", true);
		xhr.send(null);
	}
	else {
		alert("Sorry, but I couldn't create an XMLHttpRequest");
	}
}

function setStatesArray() {
	if (xhr.readyState == 4) {
           
		if (xhr.status == 200) {
			if (xhr.responseXML) {
				var allStates = xhr.responseXML.getElementsByTagName("item");
                                
				for (var i=0; i<allStates.length; i++) {
					statesArray[i] = allStates[i].getElementsByTagName("label")[0].firstChild;
				}
			}
		}
		else {
			alert("There was a problem with the request " + xhr.status);
		}
	}
}

function searchSuggest() {
	var str = document.getElementById("inputArea").value;
       
	
	if (str != "") {
		document.getElementById("popups").innerHTML = "";
	document.getElementById("inputArea").className = "";
       
		for (var i=0; i<statesArray.length; i++) {
			var thisState = statesArray[i].nodeValue;
	
			if (thisState.toLowerCase().indexOf(str.toLowerCase()) == 0) {
				var tempDiv = document.createElement("div");
                               
				tempDiv.innerHTML = thisState;
				tempDiv.onclick = makeChoice;
				tempDiv.className = "suggestions";
				document.getElementById("popups").appendChild(tempDiv);
			}
		       }
		var foundCt = document.getElementById("popups").childNodes.length;
		if (foundCt == 0) {
			document.getElementById("inputArea").className = "error";
                        alert("Status erro "); 
		}
		if (foundCt == 1) {
			document.getElementById("inputArea").value = document.getElementById("popups").firstChild.innerHTML;
			document.getElementById("popups").innerHTML = "";
                          alert("Status " +document.getElementById("popups").firstChild.innerHTML); 
		}
	}
}

function makeChoice(evt) {
	var thisDiv = (evt) ? evt.target : window.event.srcElement;
	document.getElementById("inputArea").value = thisDiv.innerHTML;
	document.getElementById("popups").innerHTML = "";
}

function showsignupForm(){
     $('#loginform').modal('hide');
   $('#signupform').modal('show');
  
}

function showloginForm(){
         $('#forgetpassword').modal('hide');
     $('#signupform').modal('hide');
   $('#loginform').modal('show');
  
}
    
 function showforgetpasswordmodal(){
   
     $('#loginform').modal('hide');
     $('#forgetpassword').modal('show');
     
 }   
    
    </script>
</head>    
<body onload="mydefaultcity()">
    <!-- Start - First Sky blue Color Row -->
    <div class="cm-skybluecolor cm-pad25px"> 
         <div class="row">     </div> 
    </div>
     <!-- End - First sky blue color Row -->
      
    <!-- Start - Logo and Login button -->
     <div class="cm-container top">
        <div class="cm-right cm-padright"> 
                <%
                  
                    //check if the session is existing for the specified user
                    HttpSession userSession = request.getSession(false);
                    
                   //userSession will be null if , there is no session created in this application
                    if( userSession == null)
                    {
                        
                  %>   
               
                    <p class="text-center">  <a style="cursor:pointer;"  data-toggle="modal" data-target="#loginform" class="thumbnail">Log In | Sign Up </a></p>    
                        
                    <%} 
                    // else part 
                    
                    else 
                    {
                       InterfaceUser userObj = (InterfaceUser) userSession.getAttribute("userObj");
                    %>
                    <p class="text-center"> <%=userObj.getUserFirstName() +" "+ userObj.getUserLastName()%>   <a class="thumbnail" href="InvalidateSessionServ">Sign Out  </a> </P>
                   
                 <%}//end of %>

                      
                      
                    
                    
                    
                 

        
                
                
          
        </div>
       <a href="http://localhost:8084/360ConsultMe/"><img class="img-responsive"  class="img-responsive" src="img\360logo.png" alt="360consultme.com" ></a>
     </div>
    <!-- End - Logo and Login button  --> 
     
    <!-- Start - Nav Bar -->    
     <ul class="nav nav-tabs">
        <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
        <li><a href="#profile" data-toggle="tab">Demo</a></li>
        <!--li class="disabled"><a>Disabled</a></li-->
        <li><a href="#profile" data-toggle="tab">About us</a></li>
        <li class="dropdown"> 
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
             Why to Join us <span class="caret"></span>
             </a>
             <ul class="dropdown-menu">
             <li><a href="#dropdown1" data-toggle="tab">Contatct us </a></li>
             <li class="divider"></li>
             <li><a href="#dropdown2" data-toggle="tab">Another action</a></li>
             </ul>
        </li>
     </ul>
    <!-- End - Nav Bar -->    
   <div class="col-lg-12  cm-font">
            <p class="text-center myfontcolor"> Looking for perfect consultancy, You are at right place </p> 
            </div>
    <!-- Start Search box with Consultant Images -->
    <div class="container marketing">
        <div class="row"> 
            <div>
                <br>
            </div>
            <div>
                <br>
            </div>
            <!-- Looking for prefect consultancy div-->
           
        </div>
        <div><br> </div>
        <!--Start - Input Group -->
        <div class="container">
            <div class="col-lg-2"  style="padding-right:2px;padding-left:2px">
                <div class="form-group">
                <!--label class="control-label cm-font" for="inputGroup">Select Location </label-->
                    <div class="input-group">
                        <input type="text" id="inputcity" name="inputcity" style="background:url(img/loc-img.png) no-repeat 2px 12px" class="form-control cm-fontsize  cm-inputcitypadding "
                        placeholder="City" />  
                    
                    </div>
                </div>
            </div>
            <div class="col-lg-3" style="padding-right:2px;padding-left:2px;">
                <div class="form-group">
                <!--label class="control-label cm-font" for="inputGroup">Select Location </label-->
                    <div class="input-group">
                    <input type="text" id="inputArea" style="background:url(img/loc-img.png) no-repeat 5px 12px" class="form-control cm-fontsize cm-inputcitypadding"
                           placeholder="Type Your Area" onclick="initAll()" onkeydown=" ">
                                          
                    </div>
                <div id="popups"> </div>    
                </div>
            </div>
        
            <div class="col-lg-3" style="padding-right:2px;padding-left:2px;" >
                <div class="form-group">
                    <select name="Category" id="Category" class="input-group cm-fontblack" onchange="populate('Category','SubCategory')" 
                              style="background:url(img/dropdown_arrow11.png) no-repeat 230px 7px" >
                            <option value="" selected hidden>Select Category</option>                     
                            <option value="leg" >Legal Consultant</option>
                            <option value="fas">Fashion Consultant</option>
                            <option value="inv">Investment Consultant</option>  
                            <option value="career">Career Consultant</option>  
                            <option value="ca">CA Consultant</option>  
                            <option value="prop">Property Consultant</option>  
                    </select>
                </div>
            </div>
            <div class="col-lg-3" style="padding-right:0px;padding-left:2px;">
                <div class="form-group">
                <!--label class="control-label cm-font" for="inputGroup">Select Location </label-->
                <!--div class="input-group"><input type="text" class="form-control cm-fontsize cm-fontblack "  placeholder="SubCategory" id="inputGroup"/-->   
                    <select name="SubCategory" id="SubCategory" class="input-group cm-fontblack" 
                              style="background:url(img/dropdown_arrow11.png) no-repeat 230px 7px" >
                        <option value="" selected hidden> Select SubCategory</option>                     
                    </select>    
       
                
            </div>  
        </div>
        
             <div class="col-lg-1" style="padding-right:0px;padding-left:0px;">                    
               <button class="btn btn-default btn-info cm-fontblack" type="button" style="height:60px" >Go!</button>
            </div>
        
        <!--End - Input Group -->
        <div><br></div>
         <div><br></div>
          <div><br></div>
           <div><br></div>
            <div><br></div>
             <div><br></div>
              <div><br></div>
        <!-- Start - Consultant Images -->
        <div class="row">
            <div class="col-md-2">
               <a href="consultant_search.jsp?cate=leg" data-toggle="tooltip" title="Click here for Legal Consultant"> 
                <img  class="img-circle thumbnail" src="img\legal.png" alt="Generic placeholder image" width="120" height="120">
               </a>
               <h3>Legal Consultants</h3>
               <p>Best LegalConsultants are here.</p>
               <!--p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p-->
            </div><!-- /.col-lg-3 -->
            <div class="col-md-2">
                <a href="consultant_search.jsp?cate=fas" data-toggle="tooltip" title="Click here for Fashion Consultant">   
                <img class="img-circle thumbnail" src="img\fashion.jpg" alt="Fashion Consultant" width="120" height="120"></a>
                <h3>Fashion Consultants</h3>
                <p>Best Fashion Consultants are here.</p>
                <!--p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p-->
            </div><!-- /.col-lg-3 -->
            <div class="col-md-2">
                <a href="consultant_search.jsp?cate=inv" data-toggle="tooltip" title="Click here for Investment Consultant">  
                <img    class="img-circle thumbnail" src="img\investment.jpg" alt="Generic placeholder image" width="120" height="120"></a>
                <h3>Investment Consultants</h3>
                <p>Best Investment Consultants are here.</p>
                <!--p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p-->
            </div><!-- /.col-lg-3 -->
	    <div class="col-md-2">
                  <a href="consultant_search.jsp?cate=career" data-toggle="tooltip" title="Click here for Career Consultant"> 
                <img  class="img-circle thumbnail"  src="img\career.gif" alt="Generic placeholder image" width="120" height="120"></a>
                <h3>Career Consultants</h3>
                <p>Best Career Consultants are here.</p>
                <!--p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p-->
            </div>
            <div class="col-md-2">
                 <a href="consultant_search.jsp?cate=ca" data-toggle="tooltip" title="Click here for CA Consultant"> 
                <img  class="img-circle thumbnail"  src="img\fashion.jpg" alt="Generic placeholder image" width="120" height="120"></a>
                <h3>CA Consultants</h3>
                <p>Best CA Consultants are here.</p>
            </div>
            <div class="col-md-2">
                 <a href="consultant_search.jsp?cate=prop" data-toggle="tooltip" title="Click here for Property Consultant"> 
                <img class="img-circle thumbnail"  src="img\fashion.jpg" alt="Generic placeholder image" width="120" height="120"></a>
                <h3>Property Consultants</h3>
                <p>Best Property Consultants are here.</p>
            </div>          
      </div>
        
    <!-- Start - Consultant Images -->
        <hr >
   
    </div>  
    <!-- End Search box with Consultant Images -->
    
    <!-- Start Login Modal Box -->
    <div class="modal fade" id="loginform" style="margin-top: 170px;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header well" style="height:80px">            
                    <button type="button" class="close" data-dismiss="modal" aria-label=""> <span> &times;</span> </button>
                    <h3 class="modal-title" id="myModalLabel1" style="text-align: left; float: left; margin-left:5px; margin-top: 10px;text-decoration-color: #00B2FF">Log In </h3>
                    <h5 style="text-align: right; float: right; display: inline;margin-right:15px; margin-top: 20px;">New User? &nbsp;
                        <span> <a  onclick="showsignupForm()"> Create Account </a></span>
                    </h5> 
                    <br>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="LoginServlet" method="post" > 
                    <fieldset>
                      <label  for="emailid">Email Id </label>
                      <input type="text" name="emailid" id="emailid" class="form-control input-sm" /><br> 
                      <label  for="password">Password</label>
                      <input type="text" name="password" id="password" class="form-control input-sm" /><br>
                      <span class="fp-link"> <a  onclick="showforgetpasswordmodal()">Forgot Password?</a></span>   <br> <br>
                        <div class="form-group">
                            <div class="col-md-2"> 
                            <input style="float: left" type="submit" class="btn btn-info" value="LogIn" /> 
                            </div>
                        </div>
                    </fieldset>
                    </form>
                </div>
                <div class="modal-footer"> 
                </div>
            </div>
        </div>
    </div>
    <!-- End Login Modal Box -->
    
    <!-- Start Signup Modal Box -->
    <div class="modal fade" id="signupform" style="margin-top: 170px;">
         <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header well" style="height:80px">            
                    <button type="button" class="close" data-dismiss="modal" aria-label=""> <span> &times;</span> </button>
                    <h3 class="modal-title" id="myModalLabel1" style="text-align: left; float: left;margin-left:5px; margin-top: 10px;text-decoration-color: #00B2FF">Create Account </h3>
                    <h5 style="text-align: right; float: right; display: inline;margin-right:15px; margin-top: 20px;">Already have an account? &nbsp;
                        <span> <a  onclick="showloginForm()"> Login </a></span>
                    </h5> 
                    <br>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal"> 
                       <fieldset>
                       <label  for="emailid">Name</label>
                       <input type="text" name="emailid" id="inputbox" class="form-control input-sm" /><br>     
                       <label  for="emailid">Email Id </label>
                       <input type="text" name="emailid" id="inputbox" class="form-control input-sm" /><br> 
                       <label  for="password">Password</label>
                       <input type="text" name="password" id="inputbox" class="form-control input-sm" /><br>
                        <br>
                        <div class="form-group">
                            <div class="col-md-2"> 
                            <input style="float: left" type="submit" class="btn btn-info btn-sm" value="Register me" /> 
                            </div>
                        </div>
                       </fieldset>
                    </form>
                </div>
                <div class="modal-footer"> 
                </div>
            </div>
        </div>
    </div>
    <!-- End Signup Modal Box -->
  
     <!--  Start Forget Password Modal Box -->
       <div class="modal fade" id="forgetpassword" style="margin-top: 170px;">
         <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header well" style="height:80px">            
                    <button type="button" class="close" data-dismiss="modal" aria-label=""> <span> &times;</span> </button>
                    <h3 class="modal-title" id="myModalLabel1" style="text-align: left; float: left;margin-left:5px; margin-top: 10px;text-decoration-color: #00B2FF">Forgot Password </h3>
                    <h5 style="text-align: right; float: right; display: inline;margin-right:15px; margin-top: 20px;">return to ? &nbsp;
                        <span> <a  onclick="showloginForm()"> Login </a></span>
                    </h5> 
                    <br>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal"> 
                       <fieldset>
                        <label  for="emailid">Email Id </label>
                       <input type="text" name="emailid" id="inputbox" class="form-control input-sm" /><br> 
                      
                        <br>
                        <div class="form-group">
                            <div class="col-md-2"> 
                            <input style="float: left" type="submit" class="btn btn-info btn-sm" value="Submit" /> 
                            </div>
                        </div>
                       </fieldset>
                    </form>
                </div>
                <div class="modal-footer"> 
                </div>
            </div>
        </div>
    </div> 
     <!--  End Forget Password Modal Box -->
    
      <!-- Start  - footer -->
 <nav class="navbar-fixed-bottom " role="navigation">     
       <div class="row row_wrap1 m0">
      <div class="container ">
         <div class="col-md-12">
          <div class="col-md-8 p0 social">
          <div class="col-md-12"> <a href="https://www.facebook.com/360consultme"><img  src="img/fb_new.png" ></a> 
            <a href="https://twitter.com/360consultme"> <img src="img/twiter_new.png" ></a> 
            <a href="https://plus.google.com/+360Consultme/"> <img src="img/gplus_new.png" ></a> 
            <a href="https://www.youtube.com/channel/UCq39yngSl5F0140RCFhyvwQ"><img src="img/yutbe_new.png" ></a> 
   
        </div>
        <div class="col-md-12 footerlinks"> 
            <a href="http://www.360consultme.com/home/show-menu-content/22">About Us</a>
            <a href="http://www.360consultme.com/show-specialities">| Specialities</a> 
             <a href="http://www.360consultme.com/show-healthtips">| Blog</a> 
             | <a href="http://www.360consultme.com/home/show-menu-content/2">Privacy</a>| 
             <a href="http://www.360consultme.com/home/show-menu-content/4">Terms</a>| 
             <a href="http://www.360consultme.com/home/show-menu-content/25">Useful Links</a>           
           | <a href="http://www.360consultme.com/home/contact-page">Contact Us</a>            
            <br/><a>Copyright © 360Consultme </a> 
        </div>
      </div>
      <div class="col-md-4 p0">
          <div class="col-md-12 t_r "> <P style="font-family:Segoe Script !important;font-size:25px;color:#000000;word-wrap :break-word"> 360ConsultMe <p> </div>
        <div class="col-md-12 t_r f_l1"> <strong> <a href="http://360consultme.com/" target="_blank">www.360consultme.com</a>  </strong> </div>
        <div class="col-md-12 t_r f_l1">  <strong> <a style="font-size:12px;"> Technology 360Consultme Group</a>  </strong> </div>
      </div>
    </div>
  </div>
</div>  
     </nav>      
      <!-- End  - footer --> 
    
</body>
</html> 

        

     

  
