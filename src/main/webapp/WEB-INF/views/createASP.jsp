
	
	
	<%
		// var 
		
		String modulo="text001";
		String varbanca="text002";
		String checkBrowser="text003";
		String formatData="text004";
		String b10="text005";
	
	%>
	
	
	<p class="lemonText"><u>ASP creation</u></p>	

	<!-- <form action="" method="get"> -->
		
			<div class="form-group">
			<aaa id="status" class="text-primary bg-orange" />
				<div class="row text-warning">Section 1</div>
				<div class="row bg-row-transparent">	
					<div class="col-3">			
						<label
							class="text-success" 
							for="<%=modulo%>">
							Nome Modulo 
						</label>				
						<input
							type="text" 
							id="<%=modulo%>" 
							required="required" 
							name="<%=modulo%>"
							class="form-control  text-warning bg-dark"
							placeholder="inserisci nome modulo" 
						/> 
					</div>
					<div class="col-2 dropdown">
						<label 
							for="<%=varbanca%>"
							class="text-success">Var Banca</label>
						<select id = "<%=varbanca%>" class="	form-control text-warning bg-dark">
							<option value="">---</option>
							<option value="SI">SI</option>
							<option value="NO">NO</option>
						</select>
					</div>	  
					<div class="col-2 dropdown">
						<label 
							for="<%=checkBrowser%>"
							class="text-success">
							Check Browser
						</label>
						<select id = "<%=checkBrowser%>" class="form-control text-warning bg-dark ">
							<option value="">---</option>
							<option value="SI">SI</option>
							<option value="NO">NO</option>
						</select>
					</div>
					<div class="col-2">
						<label 
							for=""
							class="text-success">
							Format Data
						</label>
						<input 
							id="<%=formatData%>"
							name="<%=formatData%>"
							type="text"
							placeholder="dd/mm/yyyy"
							class="form-control  text-warning bg-dark" 
						/>
					</div>
					<div class="col-2 dropdown">
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
					</div>		  
					
				</div>
					<div class="row text-warning"><h3>Preview</h3></div>
				<div class="row" style="background-color:antiquewhite;opacity:0.7;">
					<style>
						.prettyprint ol.linenums>li {
							list-style-type: decimal;
						}
						
						li.L1, li.L3, li.L5, li.L7, li.L9 {
							background: antiquewhite !important
						}
						
						pre.prettyprint {
							padding: 2px;
							border: 0;
						}
					</style>
		
					<pre class="prettyprint lang-js" id="panel"></pre>
<!-- var _html = 'Here goes your html structure';

$('#some-element').lightbox({
  zIndex:99999,
  background:'background-color:rgba(0,0,0,.8);',
  time:300,
  width:300,
  type:'html',
  contentHtml:_html
}); -->
					
			


				</div>
	
				<script type="text/javascript">
				
				$("#<%=varbanca%>").on("change",function(){
					if($("#<%=varbanca%>").val()=="SI"){
						
						 /* $("#panel").fadeIn("slow"); */						 
						 	 load(); 
						 	
								
						  
					}else{
						 $("#panel").fadeOut("slow");
					}
				});
				
				load=function(){
					$.ajax({
						url:"functions/list",
						type:"POST",
						/* data:{
							functionName:name
						}, */
						success:function(response){
							data = response.data;
							$("#status").html(response.message).show().fadeOut(5000);
							
							for(i=0; i < data.length; i++){
								//console.log($('#panel').contents().text())	;
								 console.log($('#panel').contents().text().replace(/\s+/g, '').trim());
								
								console.log("response:\n "+response.data[i].textFunction.replace(/\s+/g, '').trim());
								/*console.log($('#panel').contents().text().replace(/(?:\r\n|\r|\n)/g, '').indexOf(response.data[i].textFunction.replace(/(?:\r\n|\r|\n)/g, ''))); */ 
								if($('#panel').contents().text().replace(/(?:\r\n|\r|\n)/g, '').trim() != 
									response.data[i].textFunction.replace(/(?:\r\n|\r|\n\t)/g, '').trim()){
								//if($('#panel').contents().text().indexOf($.parseText(response.data[i].textFunction)) < 0){
									$("#panel").append("\n"+response.data[i].textFunction.trim());
									$("#panel").addClass("linenums:1");
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
				
				
				jQuery(document).ready(
						function()
						{
							prettyPrint();
					  });
				</script>
				
			
			</div>	
				<!-- <div class="row text-warning">Section 2	</div>
				<div class="row bg-row-transparent">	
					<div class="col-3">			
						<label
							class="text-success" 
							for="modulo">
							Nome Modulo 
						</label>				
						<input
							type="text" 
							id="modulo" 
							required="required" 
							name="modulo"
							class="form-control  text-warning bg-dark"
							placeholder="inserisci nome modulo" 
						/> 
					</div>
					<div class="col-2 dropdown">
						<label 
							for="varbanca"
							class="text-success">Var Banca</label>
						<select id = "varbanca" class="	form-control text-warning bg-dark">
							<option value="">---</option>
							<option value="SI">SI</option>
							<option value="NO">NO</option>
						</select>
					</div>	  
					<div class="col-2 dropdown">
						<label 
							for="checkBrowser"
							class="text-success">
							Check Browser
						</label>
						<select id = "checkBrowser" class="form-control text-warning bg-dark ">
							<option value="">---</option>
							<option value="SI">SI</option>
							<option value="NO">NO</option>
						</select>
					</div>
					<div class="col-2">
						<label 
							for=""
							class="text-success">
							Format Data
						</label>
						<input 
							id="formatData"
							name="formatData"
							type="text"
							placeholder="dd/mm/yyyy"
							class="form-control  text-warning bg-dark" 
						/>
					</div>
					<div class="col-2 dropdown">
						<label 
							for="b10"
							class="text-success">
							B10 ?
						</label>
						<select id = "b10" class="	form-control text-warning bg-dark">
							<option value="">---</option>
							<option value="SI">SI</option>
							<option value="NO">NO</option>
						</select>
					</div>		  
					
				</div>	
				
				<div class="row text-warning">Section 3</div>
				<div class="row bg-row-transparent">	
					<div class="col-3">			
						<label
							class="text-success" 
							for="modulo">
							Nome Modulo 
						</label>				
						<input
							type="text" 
							id="modulo" 
							required="required" 
							name="modulo"
							class="form-control  text-warning bg-dark"
							placeholder="inserisci nome modulo" 
						/> 
					</div>
					<div class="col-2 dropdown">
						<label 
							for="varbanca"
							class="text-success">Var Banca</label>
						<select id = "varbanca" class="	form-control text-warning bg-dark">
							<option value="">---</option>
							<option value="SI">SI</option>
							<option value="NO">NO</option>
						</select>
					</div>	  
					<div class="col-2 dropdown">
						<label 
							for="checkBrowser"
							class="text-success">
							Check Browser
						</label>
						<select id = "checkBrowser" class="form-control text-warning bg-dark ">
							<option value="">---</option>
							<option value="SI">SI</option>
							<option value="NO">NO</option>
						</select>
					</div>
					<div class="col-2">
						<label 
							for=""
							class="text-success">
							Format Data
						</label>
						<input 
							id="formatData"
							name="formatData"
							type="text"
							placeholder="dd/mm/yyyy"
							class="form-control  text-warning bg-dark" 
						/>
					</div>
					<div class="col-2 dropdown">
						<label 
							for="b10"
							class="text-success">
							B10 ?
						</label>
						<select id = "b10" class="	form-control text-warning bg-dark">
							<option value="">---</option>
							<option value="SI">SI</option>
							<option value="NO">NO</option>
						</select>
					</div>		  
					
				</div>	
				
				<div class="row text-warning">Section 4</div>
				<div class="row bg-row-transparent">	
					<div class="col-3">			
						<label
							class="text-success" 
							for="modulo">
							Nome Modulo 
						</label>				
						<input
							type="text" 
							id="modulo" 
							required="required" 
							name="modulo"
							class="form-control  text-warning bg-dark"
							placeholder="inserisci nome modulo" 
						/> 
					</div>
					<div class="col-2 dropdown">
						<label 
							for="varbanca"
							class="text-success">Var Banca</label>
						<select id = "varbanca" class="	form-control text-warning bg-dark">
							<option value="">---</option>
							<option value="SI">SI</option>
							<option value="NO">NO</option>
						</select>
					</div>	  
					<div class="col-2 dropdown">
						<label 
							for="checkBrowser"
							class="text-success">
							Check Browser
						</label>
						<select id = "checkBrowser" class="form-control text-warning bg-dark ">
							<option value="">---</option>
							<option value="SI">SI</option>
							<option value="NO">NO</option>
						</select>
					</div>
					<div class="col-2">
						<label 
							for=""
							class="text-success">
							Format Data
						</label>
						<input 
							id="formatData"
							name="formatData"
							type="text"
							placeholder="dd/mm/yyyy"
							class="form-control  text-warning bg-dark" 
						/>
					</div>
					<div class="col-2 dropdown">
						<label 
							for="b10"
							class="text-success">
							B10 ?
						</label>
						<select id = "b10" class="	form-control text-warning bg-dark">
							<option value="">---</option>
							<option value="SI">SI</option>
							<option value="NO">NO</option>
						</select>
					</div>		  
					
				</div>	
				 -->
			
			
	
