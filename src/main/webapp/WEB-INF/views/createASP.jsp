
	
	
	<%
		// var 
		
		String modulo="text001";
		String varbanca="text002";
		String includes="text003";
		String formatData="text004";
		String b10="text005";
		String cb="text006";
	
	%>
	
	
	<p class="lemonText"><u>ASP creation</u></p>	

	<!-- <form action="" method="get"> -->
	
			<div class="form-group">
			<aaa id="status" class="text-danger bg-warning" />
				<div class="row text-warning">Section 1</div>
				<div class="row bg-row-transparent">	
					<div class="col-3 ">
										
						<input
							type="text" 
							id="<%=modulo%>" 
							required="required" 
							name="<%=modulo%>"
							class="form-control  text-warning bg-dark"
							placeholder="Nome Modulo" 
						/> 
					</div>
					
			
								  
				<!-- 	  <div class="col-3 dropdown cq-dropdown" data-name='statuses'>
					    <button class="form-control  dropdown-toggle text-warning bg-dark " type="button" id="dropdown1" data-toggle="dropdown" aria-expanded="true"> Include function <span class="caret"></span> </button>
					    <ul style="width:90%" class="form-control dropdown-menu text-warning bg-dark" aria-labelledby="dropdown1">
					      <li>
					        <label class="radio-btn">
					          <input type="checkbox" value='new' >
					          jQuery </label>
					      </li>					     
					      <li class='text-center'>
					        <button type='button' class='text-warning bg-dark form-control btn btn-xs btn-default clear ' value='Clear'>Clear</button>
					        <button type='button' class='btn btn-xs btn-default save text-warning bg-dark form-control' value='Save'>Save</button>
					      </li>
					    </ul>
					  </div>
					 -->
						    
					  
					  <div class="dropdown cq-dropdown" data-name='statuses'>
					  	<button class="form-control  dropdown-toggle text-warning bg-dark " type="button" id="dropdown1" data-toggle="dropdown" aria-expanded="true"> Standard Config <span class="caret"></span> </button>
					  	<ul  class="dropdown-menu  bg-row-transparent text-warning" aria-labelledby="dropdown1">
						  	<li>
						        <label class="radio-btn">
						        <input type="radio" id="<%=varbanca%>" name="<%=varbanca%>"  value='var_banca' >
						          &nbsp;var_banca 
						        </label>
						     </li>
						     <li>
						        <label class="radio-btn">
						        <input type="radio" id="<%=varbanca%>" name="<%=varbanca%>" value='no_var_banca' >
						          &nbsp;no var_banca </label>
						     </li>
						     <li> <hr class="bg-secondary"/> </li> 
						     <li>
						        <label class="radio-btn">
						        <input type="checkbox" id= "<%=b10%>" name= "<%=b10%>"  value='b10' >
						          &nbsp;B10 ? 
						        </label>
						     </li>
						      <li>
						        <label class="radio-btn">
						        <input type="checkbox" id= "<%=cb%>" name= "<%=cb%>" value='codicebare' >
						          &nbsp;Codice Bare </label>
						     </li>
						     
						</ul>      
					  </div>
   					
					<%-- <div class="col-2 dropdown cq-dropdown" data-name='statuses'>
					  	<button class="form-control  dropdown-toggle text-warning bg-dark " type="button" id="dropdown1" data-toggle="dropdown" aria-expanded="true"> B10? <span class="caret"></span> </button>
					  	<ul  class=" dropdown-menu bg-row-transparent text-warning " aria-labelledby="dropdown1">
						  	<li>
						        <label class="radio-btn">
						        <input type="radio" id= "<%=b10%>" name= "<%=b10%>"  value='b10' >
						          Si 
						        </label>
						     </li>
						     <li>
						        <label class="radio-btn">
						        <input type="radio" id= "<%=b10%>" name= "<%=b10%>" value='no_b10' >
						          No </label>
						     </li>						     
						</ul>      
					  </div>  --%>
					
					<div class="col-2">
						
						<input 
							id="<%=formatData%>"
							name="<%=formatData%>"
							type="text"
							placeholder="Data (default:dd/mm/yyyy)"
							class="form-control  text-warning bg-dark" 
						/>
						
					</div>
					<%-- <div class="col-2 dropdown">
						<label 
							for="<%=b10%>"
							class="text-success">
							B10 ?
						</label>
						<select id = "<%=b10%>" class="	form-control text-warning bg-dark">
							<option value="">---</option>
							<option value="SI">SI</option>
							<option value="NO">NO</option>
						</select>
					</div>		 --%>  
					
				</div>
				<div class="row text-warning"><h3>Preview</h3></div>
				<div class="row" style="opacity:0.5;">		
					<pre class="prettyprint lang-vb" id="panel" style="width:100%	">
						
					</pre>		
				</div>
	
				<script type="text/javascript">
				
//			
				
				

				/*load=function(){
					$.ajax({
						url:"functions/list",
						type:"POST",
						 data:{
							functionName:name
						}, 
						success:function(response){
							data = response.data;
							*/
				load=function(){
					$.ajax({
						url:"functions/list",
						type:"POST",
						 /* data:{
							functionName:name
						},  */
						success:function(response){
							data = response.data;
							

							$("#status").html(response.message).show().fadeOut(5000);
							
							for(i=0; i < data.length; i++){
								//console.log($('#panel').contents().text())	;
								
								/*console.log($('#panel').contents().text().replace(/(?:\r\n|\r|\n)/g, '').indexOf(response.data[i].textFunction.replace(/(?:\r\n|\r|\n)/g, ''))); */ 
								if($('#panel').contents()										
		 									  .text()
											  .replace(/\s+/g, '')										
										      .trim()
										      .indexOf(response.data[i].textFunction
																 	   .replace(/\s+/g, '')
																       .replace(/&lt;/g,"<")
																	   .replace(/&gt;/g,">")
																       .trim()
												      ) < 0 
								){
								//if($('#panel').contents().text().indexOf($.parseText(response.data[i].textFunction)) < 0){
										
									console.log("from panel:\n"+$('#panel')
																.contents()
																.text()
																.replace(/\s+/g, '')																
																.trim());									
									console.log("response:\n"+response.data[i]
																.textFunction
																.replace(/\s+/g, '')
																.replace(/&lt;/g,"<")
																.replace(/&gt;/g,">")
																.trim());
									
									
									//$("#panel").append("\n"+response.data[i].textFunction.trim());
									//$("#panel").addClass("linenums:1");
									$('#panel').removeClass('prettyprinted');
									
								}else {
									$("#status").html($('#panel').contents().text().replace(/(?:\r\n|\r|\n)/g, '')
									+ " is equal to: " + 
									response.data[i].textFunction.replace(/(?:\r\n|\r|\n)/g, '')
									).show().fadeOut(5000); 
								}
								
								
								
							}
									
							
							
							$("#panel").fadeIn("slow");			
							prettyPrint();
							
						}
					});
				}
					
					
				loadByName=function(id,val){
					//alert(name);
					if(val !=""){
						$.ajax({
							url:"functions/list",
							type:"POST",
							 data:{
								functionName:val
							}, 
							success:function(response){
								data = response.data;
								//alert(data);
								if (data != null){								
									
									//for(i=0; i < data.length; i++){
										//console.log($('#panel').contents().text())	;
										
										/*console.log($('#panel').contents().text().replace(/(?:\r\n|\r|\n)/g, '').indexOf(response.data[i].textFunction.replace(/(?:\r\n|\r|\n)/g, ''))); */ 
									/* 	if($('#panel').contents()										
				 									  .text()
													  .replace(/\s+/g, '')										
												      .trim()
												      .indexOf(data.textFunction
																		 	   .replace(/\s+/g, '')
																		       .replace(/&lt;/g,"<")
																			   .replace(/&gt;/g,">")
																		       .trim()
														      ) < 0 
														       &&
											$('#panel').contents()										
						 					  		   .text()
													   .replace(/\s+/g, '')										
													   .trim()
													   .length != data.textFunction
																 	  .replace(/\s+/g, '')
																	  .replace(/&lt;/g,"<")
																	  .replace(/&gt;/g,">")
																	  .trim().length 			      
										){ */
										//if($('#panel').contents().text().indexOf($.parseText(response.data[i].textFunction)) < 0){
												
											/* console.log("from panel:\n"+$('#panel')
																		.contents()
																		.text()
																		.replace(/\s+/g, '')																
																		.trim());									
											console.log("response:\n"+data
																		.textFunction
																		.replace(/\s+/g, '')
																		.replace(/&lt;/g,"<")
																		.replace(/&gt;/g,">")
																		.trim()); */
											
											//$("#panel").empty();
											//$("#panel").addClass("linenums:1");
											$('#panel').removeClass('prettyprinted');
											//$("#panel").append("\n"+data.textFunction.trim());
											console.log(id+ " --- "+val);
											
												$("#"+id+"_preview").html(data.textFunction).css("background-color", "antiquewhite").hide().fadeIn(1000);
											 
											
											
										/* }else {
											$("#status").html($('#panel').contents().text().replace(/(?:\r\n|\r|\n)/g, '')
											+ " is equal to: " + 
											data.textFunction.replace(/(?:\r\n|\r|\n)/g, '')
											).show(); 
										} */
								
								$("#panel").fadeIn("slow");			
								prettyPrint();
								} else {
									$("#status").html(response.message).show().fadeOut(5000);
								}
							}
						});
					}else{
						//$("#"+id+"_preview").empty().fadeIn(1000);
						
						$("#"+id+"_preview").fadeOut(1000, function() {
							   $(this).empty();
							});
						//$("#"+id+"_preview").html("");
						
					}
				}
				
				loadTemplate=function(){
					$.ajax({
						url:"functions/templateFEA",
						type:"POST",						 
						success:function(response){
							data = response.data;
							
							$("#panel").html(data.toString()).hide().fadeIn("slow");			
							prettyPrint();
							
						}
							
					});
				}
				
				
				
				 jQuery(document).ready(
						function()
						{
							
							
							loadTemplate();						
							
							$('.cq-dropdown').dropdownCheckboxes();
							  
							
							$("input[type=radio]").on("change",function(){									
										loadByName($(this).attr("id"),$(this).val());
								}); 
							 $("input[type=checkbox]").on("change",function(){
								 if($("#"+$(this).attr("id")).is(":checked")){
										loadByName($(this).attr("id"),$(this).val());
									}else{
										loadByName($(this).attr("id"),"");
									}
								
								
								});
							 
							 $("input[name=<%=b10%>]").on("change",function(){
								$("input[name=<%=cb%>]").attr('required','required');								
							 });
							 
							 $("#text004").on("keyup",function(){
								 $("#text004_preview").html($("#text004").val()).css("background-color", "antiquewhite").hide().fadeIn(200);
							 });
					  }
				);  
					  
					

				</script>
				
				
			
			</div>	
				