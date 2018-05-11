



<div class="form-group">
	<aaa id="errorMsg" class="text-primary" />
	<br> 
	
		
	 <label 
	 	for="name"
		class="text-success">
		Name 
	 </label> 
	 <input 
	 	type="text" 
	 	id="name"
		required="required" 
		name="function_name"
		class="form-control text-white bg-dark">
</div>
<div class="form-group">
	<label 
		for="content" 
		class="text-success">
		Content 
	</label> 
	<input
		type="text" 
		id="content" 
		required="required" 
		name="content"
		class="form-control  text-white bg-dark">
</div>
<div class="form-group">
	<button class="btn btn-outline-warning my-2 my-sm-0 lemonText"
		onclick="submit();">Save/Update</button>
</div>
<br>
<table class="table" id="table">
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
					console.log(data[i]);	
					$("#table")
					.append("<tr class='tr'> <td> "
							/* + response.data[i].id
							+ " </td> <td> " */
							+ response.data[i].functionName
							+ " </td> <td> "
							+ response.data[i].textFunction
							+ " </td> <td> <a href='#' onclick= edit("
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
	 });

	
	
</script>