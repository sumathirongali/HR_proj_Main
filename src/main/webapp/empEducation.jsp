<%@ page language="java" import="java.util.*, Model.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:include page="editEmpAll.jsp" />

<script type="text/javascript">
	$.get( "EmpEducation", function(data) {
	}
</script>
 
<div class="container" style="margin-right: auto; margin-left: auto; width: 750px;">
	<% EmployeeEducation EmpEduDetails; %>
	<form method="post" action="EmpEducation" name="empEducationPost" id="addressform" >
		<h2 style="text-align: center"><b> Employee Education </b></h2>
		
		<div class="form-group">
			<div class="form-group col-md-12"></div>
		</div>
		
		<%	
		EmpEduDetails = (EmployeeEducation)request.getAttribute("EmpEduDetails");	
		
		if(EmpEduDetails != null) {
		
		%>	
		
		
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="employeeID">Employee ID</label>
				<input type="text" class="form-control" id="employeeID" required pattern="[0-9]+" title="Please enter only numbers" name="emp_ID" readonly="readonly" value=<%=EmpEduDetails.employeeID %>>
			</div>
		
		   <div class="form-group col-md-6">
             <label for="Education type">Education type</label>
             <select name="emp_educationtype" id="inputEducationType" class="form-control" required>
             <option selected = hidden><%=EmpEduDetails.educationType %></option>
              <option value="Diploma">Diploma</option>
              <option value="Bachelors">Bachelors</option>
              <option value="Masters">Masters</option>
              <option value="PhD">PhD</option>	    
             </select>
            </div>	
          </div>
		
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputStartdate">Start date</label> <input type="date" required
					name="emp_startdate" class="form-control" id="inputStartDate" value=<%=EmpEduDetails.startDate %>>
			</div>
			<div class="form-group col-md-6">
				<label for="inputEnddate">End date</label> <input type="date" required
					name="emp_enddate" class="form-control" id="inputEndDate" value=<%=EmpEduDetails.endDate %>>
			</div>
		</div>
				
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputInstituteName">Institute name</label> <input type="text" required
					name="emp_institutename" class="form-control" id="inputEmpInstituteName" value=<%=EmpEduDetails.instituteName %>>
			</div>
			<div class="form-group col-md-6">
				<label for="inputMajorName">Major</label> <input type="text" required
					name="emp_major" class="form-control" id="inputMajor" value=<%=EmpEduDetails.major %>>
			</div>
		</div> 
		
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputGrade">Grade</label> <input type="text" required maxlength="3" pattern="[1-9]+" title = "Please enter value between 1 to 9"
					name="emp_grade" class="form-control" id="inputgrade" value=<%=EmpEduDetails.grade %>>
			</div>
		
		
	<%
		
		} else {
	%>
        
        		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="employeeID">Employee ID</label>
				<input type="text" class="form-control" id="employeeID" name="emp_ID" required pattern="[0-9]+" title="Please enter only numbers">
			</div>
		</div>	
		<div class="form-row">
		   <div class="form-group col-md-6">
             <label for="Education type">Education type</label>
             <select name="emp_educationtype" id="inputEducationType" required>
              <option value="Diploma">Diploma</option>
              <option value="Bachelors">Bachelors</option>
              <option value="Masters">Masters</option>
              <option value="PhD">PhD</option>	    
             </select>
            </div>	
          </div>
		
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputStartdate">Start date</label> <input type="date"
					name="emp_startdate" class="form-control" id="inputStartDate" required>
			</div>
			<div class="form-group col-md-6">
				<label for="inputEnddate">End date</label> <input type="date"
					name="emp_enddate" class="form-control" id="inputEndDate" required>
			</div>
		</div>			
				
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputInstituteName">Institute name</label> <input type="text"
					name="emp_institutename" class="form-control" id="inputEmpInstituteName" required>
			</div>
		</div>
		
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputMajorName">Major</label> <input type="text"
					name="emp_major" class="form-control" id="inputMajor" required>
			</div>
		</div>   
		
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputGrade">Grade</label> <input type="text"
					name="emp_grade" class="form-control" id="inputgrade" required maxlength="3" pattern="[1-9]+" title = "Please enter value between 1 to 9">
			</div>
		</div>  
		
	<%
		}
	%>   
        
        
          <div class="form-group col-md-6"> 
		    <label for="inputCountryName">Country</label> 
         	  <select name="emp_country" id="inputCountry" class="form-control" required>
         	  <option selected hidden><%=EmpEduDetails.country %></option>
	       		<option value=" ">Choose a country...</option>
	       		<option value="al">albania</option>
				<option value="dz">algeria</option>
				<option value="as">american samoa</option>
				<option value="ad">andorra</option>
				<option value="ao">angola</option>
				<option value="ai">anguilla</option>
				<option value="aq">antarctica</option>
				<option value="ag">antigua and barbuda</option>
				<option value="ar">argentina</option>
				<option value="am">armenia</option>
				<option value="aw">aruba</option>
				<option value="au">australia</option>
				<option value="at">austria</option>
				<option value="az">azerbaijan</option>
				<option value="bs">bahamas</option>
				<option value="bh">bahrain</option>
				<option value="bd">bangladesh</option>
				<option value="bb">barbados</option>
				<option value="by">belarus</option>
				<option value="be">belgium</option>
				<option value="bz">belize</option>
				<option value="bj">benin</option>
				<option value="bm">bermuda</option>
				<option value="bt">bhutan</option>
				<option value="bo">bolivia</option>
				<option value="ba">bosnia and herzegovina</option>
				<option value="bw">botswana</option>
				<option value="bv">bouvet island</option>
				<option value="br">brazil</option>
				<option value="io">british indian ocean territory</option>
				<option value="bn">brunei darussalam</option>
				<option value="bg">bulgaria</option>
				<option value="bf">burkina faso</option>
				<option value="bi">burundi</option>
				<option value="kh">cambodia</option>
				<option value="cm">cameroon</option>
				<option value="ca">canada</option>
				<option value="cv">cape verde</option>
				<option value="ky">cayman islands</option>
				<option value="cf">central african republic</option>
				<option value="td">chad</option>
				<option value="cl">chile</option>
				<option value="cn">china</option>
				<option value="cx">christmas island</option>
				<option value="cc">cocos (keeling) islands</option>
				<option value="co">colombia</option>
				<option value="km">comoros</option>
				<option value="cg">congo</option>
				<option value="cd">congo</option>
				<option value="ck">cook islands</option>
				<option value="cr">costa rica</option>
				<option value="ci">cote d</option>
				<option value="hr">croatia</option>
				<option value="cu">cuba</option>
				<option value="cy">cyprus</option>
				<option value="cz">czech republic</option>
				<option value="dk">denmark</option>
				<option value="dj">djibouti</option>
				<option value="dm">dominica</option>
				<option value="do">dominican republic</option>
				<option value="ec">ecuador</option>
				<option value="eg">egypt</option>
				<option value="sv">el salvador</option>
				<option value="gq">equatorial guinea</option>
				<option value="er">eritrea</option>
				<option value="ee">estonia</option>
				<option value="et">ethiopia</option>
				<option value="fk">falkland islands (malvinas)</option>
				<option value="fo">faroe islands</option>
				<option value="fj">fiji</option>
				<option value="fi">finland</option>
				<option value="fr">france</option>
				<option value="gf">french guiana</option>
				<option value="pf">french polynesia</option>
				<option value="tf">french southern territories</option>
				<option value="ga">gabon</option>
				<option value="gm">gambia</option>
				<option value="ge">georgia</option>
				<option value="de">germany</option>
				<option value="gh">ghana</option>
				<option value="gi">gibraltar</option>
				<option value="gr">greece</option>
				<option value="gl">greenland</option>
				<option value="gd">grenada</option>
				<option value="gp">guadeloupe</option>
				<option value="gu">guam</option>
				<option value="gt">guatemala</option>
				<option value="gn">guinea</option>
				<option value="gw">guinea-bissau</option>
				<option value="gy">guyana</option>
				<option value="ht">haiti</option>
				<option value="hm">heard island and mcdonald islands</option>
				<option value="va">holy see (vatican city state)</option>
				<option value="hn">honduras</option>
				<option value="hk">hong kong</option>
				<option value="hu">hungary</option>
				<option value="is">iceland</option>
				<option value="in">india</option>
				<option value="id">indonesia</option>
				<option value="ir">iran</option>
				<option value="iq">iraq</option>
				<option value="ie">ireland</option>
				<option value="il">israel</option>
				<option value="it">italy</option>
				<option value="jm">jamaica</option>
				<option value="jp">japan</option>
				<option value="jo">jordan</option>
				<option value="kz">kazakhstan</option>
				<option value="ke">kenya</option>
				<option value="ki">kiribati</option>
				<option value="kp">korea</option>
				<option value="kr">korea</option>
				<option value="kw">kuwait</option>
				<option value="kg">kyrgyzstan</option>
				<option value="la">lao people</option>
				<option value="lv">latvia</option>
				<option value="lb">lebanon</option>
				<option value="ls">lesotho</option>
				<option value="lr">liberia</option>
				<option value="ly">libyan arab jamahiriya</option>
				<option value="li">liechtenstein</option>
				<option value="lt">lithuania</option>
				<option value="lu">luxembourg</option>
				<option value="mo">macao</option>
				<option value="mk">macedonia</option>
				<option value="mg">madagascar</option>
				<option value="mw">malawi</option>
				<option value="my">malaysia</option>
				<option value="mv">maldives</option>
				<option value="ml">mali</option>
				<option value="mt">malta</option>
				<option value="mh">marshall islands</option>
				<option value="mq">martinique</option>
				<option value="mr">mauritania</option>
				<option value="mu">mauritius</option>
				<option value="yt">mayotte</option>
				<option value="'mx">mexico</option>
				<option value="fm">micronesia</option>
				<option value="md">moldova</option>
				<option value="mc">monaco</option>
				<option value="mn">mongolia</option>
				<option value="ms">montserrat</option>
				<option value="ma">morocco</option>
				<option value="mz">mozambique</option>
				<option value="mm">myanmar</option>
				<option value="na">namibia</option>
				<option value="nr">nauru</option>
				<option value="np">nepal</option>
				<option value="nl">netherlands</option>
				<option value="an">netherlands antilles</option>
				<option value="nc">new caledonia</option>
				<option value="nz">new zealand</option>
				<option value="ni">nicaragua</option>
				<option value="ne">niger</option>
				<option value="ng">nigeria</option>
				<option value="nu">niue</option>
				<option value="nf">norfolk island</option>
				<option value="mp">northern mariana islands</option>
				<option value="no">norway</option>
				<option value="om">oman</option>
				<option value="pk">pakistan</option>
				<option value="pw">palau</option>
				<option value="ps">palestinian territory</option>
				<option value="pa">panama</option>
				<option value="pg">papua new guinea</option>
				<option value="py">paraguay</option>
				<option value="pe">peru</option>
				<option value="ph">philippines</option>
				<option value="pn">pitcairn</option>
				<option value="pl">poland</option>
				<option value="pt">portugal</option>
				<option value="pr">puerto rico</option>
				<option value="qa">qatar</option>
				<option value="re">reunion</option>
				<option value="ro">romania</option>
				<option value="ru">russian federation</option>
				<option value="rw">rwanda</option>
				<option value="sh">saint helena</option>
				<option value="kn">saint kitts and nevis</option>
				<option value="lc">saint lucia</option>
				<option value="pm">saint pierre and miquelon</option>
				<option value="vc">saint vincent and the grenadines</option>
				<option value="ws">samoa</option>
				<option value="sm">san marino</option>
				<option value="st">sao tome and principe</option>
				<option value="sa">saudi arabia</option>
				<option value="sn">senegal</option>
				<option value="cs">serbia and montenegro</option>
				<option value="sc">seychelles</option>
				<option value="sl">sierra leone</option>
				<option value="sg">singapore</option>
				<option value="sk">slovakia</option>
				<option value="si">slovenia</option>
				<option value="sb">solomon islands</option>
				<option value="so">somalia</option>
				<option value="za">south africa</option>
				<option value="gs">south georgia and the south sandwich islands</option>
				<option value="es">spain</option>
				<option value="lk">sri lanka</option>
				<option value="sd">sudan</option>
				<option value="sr">suriname</option>
				<option value="sj">svalbard and jan mayen</option>
				<option value="sz">swaziland</option>
				<option value="se">sweden</option>
				<option value="ch">switzerland</option>
				<option value="sy">syrian arab republic</option>
				<option value="tw">taiwan</option>
				<option value="tj">tajikistan</option>
				<option value="tz">tanzania</option>
				<option value="th">thailand</option>
				<option value="tl">timor-leste</option>
				<option value="tg">togo</option>
				<option value="tk">tokelau</option>
				<option value="to">tonga</option>
				<option value="tt">trinidad and tobago</option>
				<option value="tn">tunisia</option>
				<option value="tr">turkey</option>
				<option value="tm">turkmenistan</option>
				<option value="tc">turks and caicos islands</option>
				<option value="tv">tuvalu</option>
				<option value="ug">uganda</option>
				<option value="ua">ukraine</option>
				<option value="ae">united arab emirates</option>
				<option value="gb">united kingdom</option>
				<option value="us">united states</option>
				<option value="um">united states minor outlying islands</option>
				<option value="uy">uruguay</option>
				<option value="uz">uzbekistan</option>
				<option value="vu">vanuatu</option>
				<option value="ve">venezuela</option>
				<option value="vn">viet nam</option>
				<option value="vg">virgin islands</option>
				<option value="vi">virgin islands</option>
				<option value="wf">wallis and futuna</option>
				<option value="eh">western sahara</option>
				<option value="ye">yemen</option>
				<option value="zm">zambia</option>
				<option value="zw">zimbabwe</option>
			   </select>
		      </div>		
			</div>
			
		<div>
			<a class="btn btn-secondary" href="getEmployeeList" role="button"
						style='margin: 5px; float: right'>Cancel</a>
		</div>
					
		
		<div>
			<button class="btn btn-success" style='margin: 5px; float: right'
				type="submit" >Save</button>
		</div>
	</form>
</div>


 
 <jsp:include page="footer.jsp" />
                		