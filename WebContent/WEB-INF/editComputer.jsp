<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../include/header.jsp" />

<script type="text/javascript" src="js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>

 <script type="text/javascript">
 $(document).ready(function(){
	 
			jQuery.validator.addMethod("dateValid", function (value,element) { 
				var valid = true;  
				if ( (/^((19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12]\d|3[01]).*/i.test(value)) ) {
					var date = value.split('-');
					var year = parseInt(date[0]);
					var month = parseInt(date[1]);
					var day = parseInt(date[2]);
					if (day > 31 ) {valid = false;} 
					else if ( (day == 31) && ( (month == 2) || (month == 4) || (month == 6) || (month == 9) || (month == 11) ) ) {valid = false;} 
					else if ( ( month == 2 ) && (day > 29) ) {valid = false;} 
					else if ( ( month == 2 ) && (day == 29) && ( (year % 4) != 0) ) {valid = false;} 
				} else {valid = false;}			
				return ( this.optional(element) || valid);
				},"Date Invalide"	        
			);								
			
			jQuery.validator.addMethod("dateComparison", function (value,element) {
				if ( ($.trim(value).length > 0) && ($.trim($('#introducedDate').val()).length > 0) ) { return Date.parse($('#introducedDate').val()) <= Date.parse(value); }
				else {return true;}
				},"Dates Impossibles"
			);
			
     // Initialisation du plugin
	    $("#form").validate({
	    	rules : {
	        "name":{
	            required: true,
	            maxlength: 255
	        },
	    	"introducedDate":{
	    		maxlength: 255,
	    		dateValid: true
        	},
	    	"discontinuedDate":{
	    		maxlength: 255,
	    		dateValid: true,
	    		dateComparison: true
        	},
	    	"company":{
	    		maxlength: 255
        	}
        	}
	    });
 });
 </script>

<section id="main">

	<h1>Edit Computer</h1>
	
	<form id="form" action="editComputer" method="POST">
		<fieldset>
			<div class="clearfix">
				<label for="name">Computer name:</label>
				<div class="input">
					<input type="text" name="name" value="${ecomputer.name}"/>
					<span class="help-inline">Required</span>
					<input readonly size="${errorlist.get(0).length()}" type="text" value="${errorlist.get(0)}"/>
				</div>
			</div>
	
			<div class="clearfix">
				<label for="introduced">Introduced date:</label>
				<div class="input">
					<input id="introducedDate" type="text" name="introducedDate" value="${ecomputer.introduced}" />
					<span class="help-inline">YYYY-MM-DD</span>
					<input readonly size="${errorlist.get(1).length()}" type="text" value="${errorlist.get(1)}"/>
				</div>
			</div>
			<div class="clearfix">
				<label for="discontinued">Discontinued date:</label>
				<div class="input">
					<input type="text" name="discontinuedDate" value="${ecomputer.discontinued}"/>
					<span class="help-inline">YYYY-MM-DD</span>
					<input readonly size="${errorlist.get(2).length()}" type="text" value="${errorlist.get(2)}"/>
				</div>
			</div>
			<div class="clearfix">
				<label for="company">Company Name:</label>
				<div class="input">
					<select name="company">
							<option selected value="${ecomputer.company.id}">${ecomputer.company.name}</option>
						<c:forEach items="${companylist}" var="company">
							<option value="${company.id}">${company.name}</option>
						</c:forEach>
					</select>
					<input readonly size="${errorlist.get(3).length()}" type="text" value="${errorlist.get(3)}"/>
				</div>
			</div>
		</fieldset>
		
		<div class="actions">
			<input type="hidden" name="eid" value="${ecomputer.id}">
			<input type="submit" value="edit" class="btn btn-success">			
			or <a href="dashboard" class="btn btn-danger">Cancel</a>
		</div>
	</form>
</section>

<jsp:include page="../include/footer.jsp" />