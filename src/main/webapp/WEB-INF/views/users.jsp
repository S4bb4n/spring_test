
	<div class="form-group">
		<input type="hidden" id="user_id"> <label for="name"
			class="text-success">Name </label> <input type="text" id="name"
			required="required" name="user_name"
			class="form-control text-white bg-dark">
	</div>
	<div class="form-group">
		<label for="email" class="text-success">Email </label> <input
			type="email" id="email" required="required" name="email"
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

			$.ajax({
				url : 'users/saveOrUpdate',
				type : 'POST',
				data : {
					user_id : $("#user_id").val(),
					user_name : $('#name').val(),
					email : $('#email').val()
				},
				success : function(response) { 
					alert(response.message);
					load();
				}
			});
			$("#user_id").val("");
		}

		delete_ = function(id) {
			$.ajax({
				url : 'users/delete',
				type : 'POST',
				data : {
					user_id : id
				},
				success : function(response) {
					//alert(response.message);
					load();
				}
			});
		}

		edit = function(index) {
			$("#user_id").val(data[index].user_id);
			$("#name").val(data[index].user_name);
			$("#email").val(data[index].email);

		}

		load = function() {
			$
					.ajax({
						url : 'users/list',
						type : 'POST',
						success : function(response) {
							data = response.data;
							$('.tr').remove();
							for (i = 0; i < response.data.length; i++) {
								$("#table")
										.append(
												"<tr class='tr'> <td> "
														+ response.data[i].user_id
														+ " </td> <td> "
														+ response.data[i].user_name
														+ " </td> <td> "
														+ response.data[i].email
														+ " </td> <td> <a href='#' onclick= edit("
														+ i
														+ ");> Edit </a>  </td> </td> <td> <a href='#' onclick='delete_("
														+ response.data[i].user_id
														+ ");'> Delete </a>  </td> </tr>");
							}
						}
					});

		}
		
	
		 
	
		 
		 $(document).ready(function(){
			 load();
		 });

		 
	</script>
