
	
	
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
				<div class="row text-warning">Section 2	</div>
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
				
				<div class="row text-warning">Section 4</div>
				<div class="row bg-secondary" style="opacity:0.5;">
					test
				</div>	
				
			
			</div>
			
			
			
			<!-- <div class="form-group">
				<label
					class="text-success" 
					for="">	
					Test				
				</label> 
				<input 
					type="" 
					id="" 
					name="" 
					placeholder=""
					class="form-control  text-white bg-dark" 
				/>
			</div>
			<div class="form-group">
				<label
					class="text-success" 
					for="">	
					Test				
				</label> 
				<input 
					type="" 
					id="" 
					name="" 
					placeholder=""
					class="form-control  text-white bg-dark" 
				/>
			</div>
			<div class="form-group">
				<label
					class="text-success" 
					for="">
					Test					
				</label> 
				<input 
					type="" 
					id="" 
					name="" 
					placeholder=""
					class="form-control  text-white bg-dark" 
				/>
			</div>
			<div class="form-group">		
				<label
					class="text-success" 
					for="">
					Test					
				</label> 
				<input 
					type="" 
					id="" 
					name="" 
					placeholder=""
					class="form-control  text-white bg-dark" 
				/>
			</div>			
			<div class="form-group">
				<button 
					class="btn btn-outline-warning my-2 my-sm-0 lemonText"
					onclick="submit();">
					Save
				</button>
			</div> -->
		
		
<!-- 	</form> -->

