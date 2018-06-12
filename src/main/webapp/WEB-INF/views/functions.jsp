



<div class="form-group">
	<aaa id="errorMsg" class="text-primary" />
	<br> 
	<div class="row">
		<div class="col-3">
			  
			 <input 
			 	type="text" 
			 	id="name"
				required="required" 
				name="function_name"
				placeholder="Function Name"
				class="form-control text-white bg-dark">
		</div>
		<div class="col-3">	
			
			 <input 
			 	type="text" 
			 	id="htmlID"
				required="required" 
				name="htmlID"
				placeholder="HTML ID"
				class="form-control text-white bg-dark">	
		</div>
		 <div class="col-2 dropdown cq-dropdown" data-name='statuses'>
					  	<button class="form-control  dropdown-toggle text-warning bg-dark " type="button" id="dropdown1" data-toggle="dropdown" aria-expanded="true"> Input Type <span class="caret"></span> </button>
					  	<ul  class="dropdown-menu  bg-row-transparent text-warning" aria-labelledby="dropdown1">
						  	<li>
						        <label class="radio-btn">
						        <input type="radio" id="inputType" name="inputType"  value='ckType' >
						          &nbsp;check box 
						        </label>
						     </li>
						     <li>
						        <label class="radio-btn">
						        <input type="radio" id="inputType" name="inputType"  value='textType' >
						          &nbsp;Text
						        </label>
						     </li>
						     <li>
						        <label class="radio-btn">
						        <input type="radio" id="inputType" name="inputType"  value='selectType' >
						          &nbsp;Select
						        </label>
						     </li>
						    <li>
						        <label class="radio-btn">
						        <input type="radio" id="inputType" name="inputType"  value='radioType' >
						          &nbsp;Radio
						        </label>
						     </li>						     
						</ul>      
					  </div>	
	</div>		
</div>
<div class="form-group">
	<label 
		for="content" 
		class="text-success">
		Content 
	</label> 
	<textarea
		
		id="content" 
		required="required" 
		name="content"
		class="form-control  text-white bg-dark" ></textarea>
</div>
<div class="form-group">
	<button class="btn btn-outline-warning my-2 my-sm-0 lemonText"
		onclick="submit();">Save/Update</button>
</div>
<br>

<table class="table" id="table" >
	<thead class="bg-row-transparent text-success ">
		<tr>
			<!-- <th scope="col">#</th> -->
			<th scope="col">Name</th>
			<th scope="col">Content</th>
			<th scope="col">Edit</th>
			<th scope="col">Delete</th>
		</tr>
	</thead>
</table>

<script type="text/javascript">
	data = "";
	submit = function() {
		/* alert( $("#function_id").val());
		alert( $('#name').val());
		alert( $('#content').val()); */
		$.ajax({
			url : 'functions/saveOrUpdate',
			type : 'POST',
			data : {
				/* id : $("#function_id").val(), */
				functionName : $('#name').val(),
				textFunction : $('#content').val()
			},
			success : function(response) {
				/* alert(response.message); */
				$("#errorMsg").html(response.message).show().fadeOut(5000);
				 load(); 
			},
			error : function(error) {
				$("#errorMsg").html(
						"Error: "+ error).show().fadeOut(5000);		
			}
		});
		$("#name").val("");
		$("#content").val("");
	}
 	delete_ = function(function_name) {
		
		
		$.ajax({
			url : 'functions/delete',
			type : 'POST',
			data : {
				functionName : function_name
			},
			success : function(response) {
				 /* alert(response.message); */ 
				$("#errorMsg").html(response.message).show().fadeOut(5000);
				load(); 
			},
			error : function(error) {
				$("#errorMsg").html(
						response.status + " " + response.message + " .Error: "
								+ error).show().fadeOut(5000);		
			}		
		});
	}
	
	
	edit = function(index) {
		/* $("#function_id").val(data[index].id); */
		$("#name").val(data[index].functionName);
		$("#content").val(data[index].textFunction);

	}
	
	load=function(){
		$.ajax({
			url: 'functions/list',
			type: 'POST',
			success: function(response){
				data = response.data;
				if(data.length > 0) {
					$("#table").show();
				}else{
					$("#table").hide();
				}
				$('.tr').remove();
				for(i=0; i < data.length; i++){
					console.log("form json file: " + data[i].textFunction);	
					$("#table")
					.append("<tr class='tr'> <td> "
							/* + response.data[i].id
							+ " </td> <td> " */
							+ response.data[i].functionName
							+ " </td> <td><pre> "
							+ response.data[i].textFunction
							+ " </pre></td> <td> <a href='#' onclick= edit("
							+ i
							+ ");> Edit </a>  </td> </td> <td> <a href='#' onclick=delete_('"
							+ response.data[i].functionName
							+ "');> Delete </a>  </td> </tr>");		
				}				
			}
		});
	}
	
	$(document).ready(function(){
		 load();
		 prettyPrint();
		 $('.cq-dropdown').dropdownCheckboxes();	
						
	 });

	
	
</script>
