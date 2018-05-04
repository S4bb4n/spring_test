



<div class="form-group">
	<aaa id="errorMsg" />
	<br>
	<input type="hidden" id="user_id"> <label for="name"
		class="text-success">Name </label> <input type="text" id="name"
		required="required" name="function_name"
		class="form-control text-white bg-dark">
</div>
<div class="form-group">
	<label for="content" class="text-success">Content </label> <input
		type="text" id="content" required="required" name="content"
		class="form-control  text-white bg-dark">
</div>
<div class="form-group">
	<button class="btn btn-outline-warning my-2 my-sm-0 lemonText"
		onclick="submit();">Save/Update</button>
</div>
<br>
<table class="table" id="table">
	<thead class="bg-dark text-success">
		<tr>
			<th scope="col">#</th>
			<th scope="col">Name</th>
			<th scope="col">Email</th>
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
				id : $("#function_id").val(),
				functionName : $('#name').val(),
				textFunction : $('#content').val()
			},
			success : function(response) {
				/* alert(response.message); */
				 $("#errorMsg").html(response.message).show().fadeOut(5000);
				/* load(); */
			}
		});
		/* $("#user_id").val(""); */
	}
</script>