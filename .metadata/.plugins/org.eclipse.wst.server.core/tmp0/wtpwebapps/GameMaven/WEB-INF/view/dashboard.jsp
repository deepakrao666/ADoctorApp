<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>

<spring:url value="/resources/css/theme-white.css" var="themeCss" />
<spring:url value="/resources/css/jqGrid/jqGridStyle.css" var="jqGridCss" />
       
<spring:url value="/resources/js/plugins/jquery/jquery.min.js" var="jqueryJs" />
<spring:url value="/resources/js/plugins/jquery/jquery-ui.min.js"  var="jqueryUiJs" />
<spring:url value="/resources/js/plugins/bootstrap/bootstrap.min.js"  var="bootstrapJs" />
<spring:url value="/resources/js/plugins/bootstrap/bootstrap-file-input.js"  var="bootstrapFileJs" />
<spring:url value="/resources/js/plugins/bootstrap/bootstrap-select.js"  var="bootstrapSelectJs" />
<spring:url value="/resources/js/plugins/tagsinput/jquery.tagsinput.min.js"  var="bootstrapTagsJs" />
<spring:url value="/resources/js/plugins/bootstrap/bootstrap-datepicker.js"  var="datePickerJs" />
<spring:url value="/resources/js/plugins/bootstrap/bootstrap-timepicker.min.js"  var="timePickerJs" />
<spring:url value="/resources/js/plugins/bootstrap/bootstrap-datepicker.js"  var="datePickerJs" />
<spring:url value="/resources/js/plugins/icheck/icheck.min.js"  var="icheckJs" />
<spring:url value="/resources/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"  var="mcustomeJs" />
<spring:url value="/resources/js/settings.js"  var="settingsJs" />
<spring:url value="/resources/js/plugins/owl/owl.carousel.min.js"  var="carouselJs" />
<spring:url value="/resources/js/plugins.js"  var="pluginJs" />
<spring:url value="/resources/js/actions.js"  var="actionsJs" />
 <spring:url value="/resources/js/warehouseGrid.js"  var="warehouseGridJs" />   
 
 <spring:url value="/resources/js/plugins/noty/jquery.noty.js"  var="notyJs" /> 
 <spring:url value="/resources/js/plugins/noty/layouts/topRight.js"  var="topCenterJs" />  
 <spring:url value="/resources/js/plugins/noty/themes/default.js"  var="themeNotyJs" /> 
 <spring:url value="/resources/js/plugins/maskedinput/jquery.maskedinput.min.js"  var="maskedJs" /> 

 <spring:url value="/resources/js/plugins/validationengine/languages/jquery.validationEngine-en.js"  var="validationEngineJs" />  
 <spring:url value="/resources/js/plugins/validationengine/jquery.validationEngine.js"  var="validationEngineJs2" /> 
 <spring:url value="/resources/js/plugins/jquery-validation/jquery.validate.js"  var="validateJs" /> 

	<link href="${themeCss}" rel="stylesheet" />	
	<link href="${jqGridCss}" rel="stylesheet" /> 

    <script src="${jqueryJs}"></script>
    <script src="${jqueryUiJs}"></script>
    <script src="${bootstrapJs}"></script>
    <script src="${bootstrapFileJs}"></script>
    <script src="${bootstrapSelectJs}"></script>
    <script src="${bootstrapTagsJs}"></script>
    <script src="${datePickerJs}"></script>
    <script src="${timePickerJs}"></script>
    <script src="${icheckJs}"></script>
    <script src="${mcustomeJs}"></script>
    <script src="${carouselJs}"></script>
    <script src="${settingsJs}"></script>
    <script src="${pluginJs}"></script>
    <script src="${actionsJs}"></script>
    <script src="${warehouseGridJs}"></script>
     <script src="${notyJs}"></script>
    <script src="${topCenterJs}"></script>
    <script src="${themeNotyJs}"></script>
    <script src="${maskedJs}"></script>
    <script src="${validationEngineJs}"></script>
    <script src="${validationEngineJs2}"></script>
    <script src="${validateJs}"></script>

<script type='text/javascript' src="http://trirand.com/blog/jqgrid/js/i18n/grid.locale-en.js"></script>
<script type='text/javascript'  src="http://trirand.com/blog/jqgrid/js/jquery.jqGrid.min.js"></script>

		
 <script type='text/javascript'>
 var readinessTemplateValues = [];
 var warehouseNameValues = [];
 var gSCTemplateValues = [];
 function dashboardValues()
	{
		$.ajax({
		type:'POST',
		encoding : "UTF-8",
		url : "dashboardIconInfo",
	    dataType: 'json',
	    success: function(data) {
	    	
	    	
	    	
	    	var a= data.totalWarehouse;
	    	var b = data.totalSpaceUtilizedCount;
	    	var c = data.totalClientsCount;
	    	
	    	    $('#totalWarehouse').val(a);
				$('#totalSpaceUtilizedCount').val(parseInt(b));
				$('#totalClientsCount').val(c);
	    }
	});
}
 
 
 
 function loadClientNames()
 {

	 $("#clientRTName").empty();
	 
	 $.ajax({
			type:'GET',
			encoding : "UTF-8",
			url : "listRTClientName",
			data : "",
		    dataType: 'json',
		    success: function( json ) {
		        $.each(json, function(i, value) {
		        	
		        	$('#clientRTName').append($('<option>').text(value.companyName).attr('value', value.salesPipeLineId));

		        	readinessTemplateValues.push(value.readiness_element_name);
		        	
		        });
		    }
		});
	 
 }

 function loadProductCategory()
 {

	 //$("#clientRTName").empty();
	 
/* 	 $.ajax({
			type:'GET',
			encoding : "UTF-8",
			url : "listReadinessElementName",
			data : "",
		    dataType: 'json',
		    success: function( json ) {
		        $.each(json, function(i, value) {
		        	
		        	readinessTemplateValues.push(value.readiness_element_name);
		        	
		        });
		    }
		});
 */

 $('#product_category_id2').empty();
 
		$.ajax({
			type:'GET',
			encoding : "UTF-8",
			url : "listProductCategory",
			data : "",
		    dataType: 'json',
		    success: function( json ) {
		        $.each(json, function(i, value) {
		        	
		        	$('#product_category_id2').append($('<option>').text(value.category_name).attr('value', value.product_category_id));
		        });
		    }
		});
	 
 }


 function loadProductName()
 {

	 $("#clientWarehouseFilter").empty();
	 
	 $.ajax({
			type:'GET',
			encoding : "UTF-8",
			url : "listProduct",
			data : "",
		    dataType: 'json',
		    success: function( json ) {
		        $.each(json, function(i, value) {
		        	
		        	$('#clientWarehouseFilter').append($('<option>').text(value.product_name).attr('value', value.product_id));

		        	warehouseNameValues.push(value.product_name);
		        	
		        });
		    }
		});
	 
 }
 
 
 function validateSalesPipeLine()
 {
	 
	 
     
    
	 var jvalidate = $("#jvalidate").validate({
         ignore: [],
         rules: {                                            
        	 estimatedFloorBuiltupArea: {
                         required: true
                        
                 },
                 estimatedFloorCarpetArea: {
                         required: true
                 },
                 
                 estimatedRackCarpetArea: {
                         required: true
                 },
                 estimatedRackCarpetArea: {
                         required: true
                 },
                 estimatedStartDate: {
                         required: true,
                         date: true
                 },
                 estimatedRevenue: {
                         required: true
                        
                 }
             }                                        
         });            
	 
	 
 }


 function loadGlassStockCategory()
 {


 $('#gsc_id2').empty();
 
		$.ajax({
			type:'GET',
			encoding : "UTF-8",
			url : "listGSC",
			data : "",
		    dataType: 'json',
		    success: function( json ) {
		        $.each(json, function(i, value) {
		        	
		        	$('#gsc_id2').append($('<option>').text(value.gsc_name).attr('value', value.gsc_id));
		        });
		    }
		});
	 
 }
 
$(document).ready(function(){
	
   
	
//	dashboardValues();
	//loadClientNames();
	loadProductCategory();
	loadProductName();
	loadGlassStockCategory();
	
	$('#warehouseLink').css( 'cursor', 'pointer' );
	$('#dashboardLink').css( 'cursor', 'pointer' );
	$('#accountSettingLink').css( 'cursor', 'pointer' );
	$('#readinessLink').css( 'cursor', 'pointer' );
	$('#glassCategoryLink').css( 'cursor', 'pointer' );
	$('#glassElementLink').css( 'cursor', 'pointer' );
	$('#graphicalReportLink').css( 'cursor', 'pointer' );
	$('#tabularReportLink').css( 'cursor', 'pointer' );
	$('#areaReportLink').css( 'cursor', 'pointer' );
	$('#clientReportLink').css( 'cursor', 'pointer' );
	$('#readinessReportLink').css( 'cursor', 'pointer' );
	$('#settingLink').css( 'cursor', 'pointer' );
	$('#logoutLink').css( 'cursor', 'pointer' );
	$('#cancelReadinessOrder').css( 'cursor', 'pointer' );
	
	
	$("#logoutLink").click(function(){
		 $("#logoutDiv").fadeIn(500);
		 
		 
		});

	

	$("#graphicalReportLink").click(function(){
         $("#graphicalChartDiv").fadeIn(500);
		 $("#dashboardDiv").hide(500);
		 $("#userModuleDiv").hide();
		 $('#warehouseDiv').hide();
		 $('#areaReportDiv').hide();
		 $('#clientReportDiv').hide();
		 $('#readinessTemplateReportDiv').hide();
		 $('#reportDiv').hide();
		  $("#glassCategoryDiv").hide();
			 $("#gSEDiv").hide();
				
		});

	
	$("#dashboardLink").click(function(){
		 $("#dashboardDiv").fadeIn(500);
		 $("#userModuleDiv").hide();
		 $('#warehouseDiv').hide();
		 $('#areaReportDiv').hide();
		 $('#clientReportDiv').hide();
		 $('#readinessTemplateReportDiv').hide(); 
		 $("#graphicalChartDiv").hide();
		 $('#reportDiv').hide();
		 $('#readinessDiv').hide();
		  $("#glassCategoryDiv").hide();
		  $("#gSEDiv").hide();
		});

	$("#tabularReportLink").click(function(){
		$('#reportDiv').show();
		$('#areaReportDiv').hide();
		 $("#warehouseDiv").hide();
		 $("#gSEDiv").hide();
		 $('#clientReportDiv').hide();
		 $("#userModuleDiv").hide();
		 $("#readinessDiv").hide();
		  $("#glassCategoryDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#addTitle').hide();
		 $('#updateTitle').hide();
		 $('#addWarehouse').show();
		 $('#saveWarehouseInfo').hide();
		 $('#cancelWarehouseInfo').hide();
		 $('#updateWarehouseInfo').hide();
		 $('#areaReportDiv').hide();
		 $('#readinessTemplateReportDiv').hide();
		 $("#graphicalChartDiv").hide();
		 $("#grid5").trigger("reloadGrid");
		});
	
	
	
	
	$("#areaReportLink").click(function(){
		$('#areaReportDiv').show();
		$('#clientReportDiv').hide();
		 $('#reportDiv').hide();
		 $("#warehouseDiv").hide();
		 $("#userModuleDiv").hide();
		 $("#readinessDiv").hide();
		 $("#gSEDiv").hide();
		  $("#glassCategoryDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#addTitle').hide();
		 $('#updateTitle').hide();
		 $('#addWarehouse').show();
		 $('#saveWarehouseInfo').hide();
		 $('#cancelWarehouseInfo').hide();
		 $('#updateWarehouseInfo').hide();
		 $('#readinessTemplateReportDiv').hide();
		 $("#graphicalChartDiv").hide();
		 $("#areaGrid").trigger("reloadGrid");
		 
		 
		});
	
	$("#clientReportLink").click(function(){
		$('#clientReportDiv').show();
		$('#areaReportDiv').hide();
		 $('#reportDiv').hide();
		 $("#warehouseDiv").hide();
		 $("#userModuleDiv").hide();
		 $("#readinessDiv").hide();
		 $('#dashboardDiv').hide();
		 $("#gSEDiv").hide();
		  $("#glassCategoryDiv").hide();
		 $('#addTitle').hide();
		 $('#updateTitle').hide();
		 $('#addWarehouse').show();
		 $('#saveWarehouseInfo').hide();
		 $('#cancelWarehouseInfo').hide();
		 $('#updateWarehouseInfo').hide();
		 $('#readinessTemplateReportDiv').hide();
		 $("#graphicalChartDiv").hide();
		 $("#clientGrid").trigger("reloadGrid");
		});
	
	
	$("#readinessReportLink").click(function(){

		//$('#reportRTDiv').show();
		$('#readinessTemplateReportDiv').show();
		loadClientNames();
		$('#clientReportDiv').hide();
		$('#areaReportDiv').hide();
		$('#reportDiv').hide();
		 $("#warehouseDiv").hide();
		 $("#userModuleDiv").hide();
		 $("#readinessDiv").hide();
		 $("#gSEDiv").hide();
         $("#glassCategoryDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#addTitle').hide();
		 $('#updateTitle').hide();
		 $('#addWarehouse').show();
		 $('#saveWarehouseInfo').hide();
		 $('#cancelWarehouseInfo').hide();
		 $('#updateWarehouseInfo').hide();
		 $('#areaReportDiv').hide();
		 $("#graphicalChartDiv").hide();
		 $("#readinessTemplateReportGrid").trigger("reloadGrid");
		});
	
	
	
	
	
	$("#warehouseLink").click(function(){
		 $("#warehouseDiv").fadeIn(500);
		 $("#viewWarehouseDiv").fadeIn(500);
		 $("#gSEDiv").hide();
		  $("#glassCategoryDiv").hide();
		 $("#userModuleDiv").hide();
		 $('#reportDiv').hide();
		 $("#readinessDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#addTitle').hide();
		 $('#updateTitle').hide();
		 $('#addWarehouse').show();
		 $('#saveWarehouseInfo').hide();
		 $('#cancelWarehouseInfo').hide();
		 $('#updateWarehouseInfo').hide();
		 $('#areaReportDiv').hide();
		 $('#clientReportDiv').hide();
		 $("#graphicalChartDiv").hide();
		 $('#readinessTemplateReportDiv').hide();
		});

	$("#glassElementLink").click(function(){
		 $("#gSEDiv").fadeIn(500);
		 $("#viewGSEDiv").fadeIn(500);

		 $("#warehouseDiv").hide;
		 $("#viewWarehouseDiv").hide;
		  $("#glassCategoryDiv").hide();
		 $("#userModuleDiv").hide();
		 $('#reportDiv').hide();
		 $("#readinessDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#addTitle').hide();
		 $('#updateTitle').hide();
		 $('#addWarehouse').show();
		 $('#saveWarehouseInfo').hide();
		 $('#cancelWarehouseInfo').hide();
		 $('#updateWarehouseInfo').hide();
		 $('#areaReportDiv').hide();
		 $('#clientReportDiv').hide();
		 $("#graphicalChartDiv").hide();
		 $('#readinessTemplateReportDiv').hide();
		});
	

	
	$("#readinessLink").click(function(){
		 $("#readinessDiv").fadeIn(500);
		 $("#viewReadinessDiv").fadeIn(500);
		  $("#glassCategoryDiv").hide();
		 $("#userModuleDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#warehouseDiv').hide();
		 $("#gSEDiv").hide();
		 $('#reportDiv').hide();
		 $('#addRETitle').hide();
		 $('#updateRETitle').hide();
		 $('#addReadiness').show();
		 $('#saveReadinessInfo').hide();
		 $('#cancelReadinessInfo').hide();
		 $('#updateReadinessInfo').hide();
		 $('#areaReportDiv').hide();
		 $('#clientReportDiv').hide();
		 $("#graphicalChartDiv").hide();
		 $('#readinessTemplateReportDiv').hide();
		 
		});
	


	$("#glassCategoryLink").click(function(){
		 $("#glassCategoryDiv").fadeIn(500);
		 $("#gSEDiv").hide();
		 $("#viewGSCDiv").fadeIn(500);	
		 $("#readinessDiv").hide();
		 $("#viewReadinessDiv").hide();
		 $("#userModuleDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#warehouseDiv').hide();
		 $('#reportDiv').hide();
		 $('#addRETitle').hide();
		 $('#updateRETitle').hide();
		 $('#addReadiness').hide();
		 $('#saveReadinessInfo').hide();
		 $('#cancelReadinessInfo').hide();
		 $('#updateReadinessInfo').hide();
		 $('#areaReportDiv').hide();
		 $('#clientReportDiv').hide();
		 $("#graphicalChartDiv").hide();
		 $('#readinessTemplateReportDiv').hide();
		 $('#addGSC').show();
		 $('#saveGSCInfo').hide();
		 $('#cancelGSCInfo').hide();
		 $('#updateGSCInfo').hide();	
			 
		});

	

/* 	$("#readinessTemplateLink").click(function(){
		 $("#readinessTemplateDiv").fadeIn(500);
		 $("#viewReadinessTemplateDiv").fadeIn(500);
		 $("#salesPipeLineDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#warehouseDiv').hide();
		 $('#readinessDiv').hide();
		});*/
	 
	$("#accountSettingLink").click(function(){
			 $("#userModuleDiv").fadeIn(500);
			 $("#viewSalesPipeLineDiv").fadeIn(500);
			 $("#glassCategoryDiv").hide(500);
			 $("#gSEDiv").hide();
			 $("#dashboardDiv").hide();
			 $('#warehouseDiv').hide();	 
			 $("#readinessDiv").hide();
			 $('#reportDiv').hide();
			 $('#addSPLTitle').hide();
			 $('#updateSPLTitle').hide();
			 $('#addUser').show();
			 $('#saveSalesPipeLineInfo').hide();
			 $('#cancelSalesPipeLineInfo').hide();
			 $('#updateSalesPipeLineInfo').hide(); 
			 $("#addSalesPipeLineDiv").hide();
			 $('#areaReportDiv').hide();
			 $('#clientReportDiv').hide();
			 $("#graphicalChartDiv").hide();
			 $('#readinessTemplateReportDiv').hide();			 
			});
	
	/* Add Warehouse
	 */
	$("#addWarehouse").click(function(){
		 $("#addWarehouseDiv").fadeIn();
		 $('#addTitle').fadeIn();
		 $('#addWarehouse').hide();
		 $('#saveWarehouseInfo').show();
		 $('#cancelWarehouseInfo').show();
		 $('#updateWarehouseInfo').hide();
		 $("#viewWarehouseDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#updateTitle').hide();
		    $("#product_name").val("");
			$("#product_brand").val("");
			$("#product_rate").val("");
			$("#product_quantity").val("");
			$("#product_category_id2").val("");
			
			
		 
		});

	///Addd GSE
	
		$("#addGSE").click(function(){
		 $("#addGSEDiv").fadeIn();
		 $('#addGSETitle').fadeIn();
		 $('#addGSE').hide();
		 $('#saveGSEInfo').show();
		 $('#cancelGSEInfo').show();
		 $('#updateGSEInfo').hide();
		 $("#viewGSEDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#updateTitle').hide();
		    $("#gse_value").val("");
			$("#gsc_id2").val("");
			
			
		 
		});
	
	
	/* Add Readiness
	 */
	$("#addReadiness").click(function(){
		 $("#addReadinessDiv").fadeIn();
		 $('#addRETitle').fadeIn();
		 $('#saveReadinessInfo').show();
		 $('#cancelReadinessInfo').show();
		 $('#addReadiness').hide();
		 $('#updateReadinessInfo').hide();
		 $("#viewReadinessDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#updateRETitle').hide();
			$("#category_name").val("");		 
		 
		});

	$("#addGSC").click(function(){
		 $("#addGSCDiv").fadeIn();
		 $('#addGSCTitle').fadeIn();
		 $('#saveGSCInfo').show();
		 $('#cancelGSCInfo').show();
		 $('#addGSC').hide();
		 $('#updateGSCInfo').hide();
		 $("#viewGSCDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#updateGSCTitle').hide();
			$("#gsc_name").val("");		 
		 
		});
	
	
	/* Add Readiness Template
	 */
	$("#addReadinessTemplate").click(function(){
		 $("#addReadinessTemplateDiv").fadeIn();
		 $('#addRTLTitle').fadeIn();
		 $('#addReadinessTemplate').hide();
		 $('#saveReadinessTemplate').show();
		 $('#cancelReadinessTemplate').show();
		 $('#updateReadinessTemplate').hide();
		 $("#viewReadinessTemplateDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#updateRTLTitle').hide();
		 $('#customerNameRT').empty();
         $('#readinessElementNameRT').empty();
	    	
		/* 	$("#warehouseName").val("");
			$("#floorBuiltupArea").val("");
			$("#floorCarpetArea").val("");
			$("#rackBuiltupArea").val("");
			$("#rackCarpetArea").val(""); */
		
			
			//Populate Dropdown with Custmer Name

			$.ajax({
				type:'GET',
				encoding : "UTF-8",
				url : "listSalesPipeLine",
				data : "",
			    dataType: 'json',
			    success: function( json ) {
			    	
			        $.each(json, function(i, value) {
			        	$('#customerNameRT').append($('<option>').text(value.customerName).attr('value', value.salesPipeLineId));
			        });
			    }
			});
			
			/* 
			Populate Droupdown with Readiness Element */
			
			$.ajax({
				type:'GET',
				encoding : "UTF-8",
				url : "listReadinessElements",
				data : "",
			    dataType: 'json',
			    success: function( json ) {
			    	
			    	    $.each(json, function(i, value) {
			        	
			        	$('#readinessElementNameRT').append($('<option>').text(value.readiness_element_name).attr('value', value.re_id));
			        });
			    }
			});

		 
		});
	
	
	
	/* Add SalesPipeLine
	 */
	
	$("#addUser").click(function(){
		
		
		 $("#addSalesPipeLineDiv").fadeIn();
		 $('#addSPLTitle').fadeIn();
		 $('#saveSalesPipeLineInfo').show();
		 $('#cancelSalesPipeLineInfo').show();
		 $('#addUser').hide();
		 $('#updateReadinessInfo').hide();
		 $("#viewSalesPipeLineDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#updateSPLTitle').hide();
		 $('#updateSalesPipeLineInfo').hide();
		 $('#product_category_id5').empty();;
		 $('#product_id5').empty();;
		 $('#gsc_id5').empty();;
		 $('#eyes_number').empty();;
		   
		
		 
		 
		 
		 $('#allocatedWarehouse').empty();
		 $("#customerName").val("");   
			$("#availableFloor").val("");
			$("#availableCarpet").val("");
			$("#customer_name").val("");
			$("#enrollment_date").val("");
			$("#contact_number").val("");
			$("#customer_address").val("");
			$("#eyes_number").val("");
			$("#product_category_id").val("");
			$("#product_id").val("");
			$("#actual_total_cost").val("");
			/* $("#statusWork").empty(); */
			$("#advance_payment").val("");
			$("#balance_payment").val("");
		/* 	$("#actualRackBuiltupArea").val("");
			$("#actualRackCarpetArea").val("");
			$("#actualRevenue").val("");
			$("#actualStartDate").val("");
		 */	
			  $("#actualFloorBuiltupArea").attr('disabled','disabled');
				$("#actualFloorCarpetArea").attr('disabled','disabled');
				$("#actualRackBuiltupArea").attr('disabled','disabled');
				$("#actualRackCarpetArea").attr('disabled','disabled');
				$("#actualRevenue").attr('disabled','disabled');
				$("#actualStartDate").attr('disabled','disabled');
			
				$('#confirmed').hide();
			
			//Populate Dropdown

			$.ajax({
				type:'GET',
				encoding : "UTF-8",
				url : "listProductCategory",
				data : "",
			    dataType: 'json',
			    success: function( json ) {
			        $.each(json, function(i, value) {
			        	
			        	$('#product_category_id5').append($('<option>').text(value.category_name).attr('value', value.product_category_id));
			        });
			    }
			});


			$.ajax({
				type:'GET',
				encoding : "UTF-8",
				url : "listGSC",
				data : "",
			    dataType: 'json',
			    success: function( json ) {
			        $.each(json, function(i, value) {
			        	
			        	$('#gsc_id5').append($('<option>').text(value.gsc_name).attr('value', value.gsc_id));
			        });
			    }
			});
		 
		});
	
	
	
	//Populate Client 
	
	
	
	
//Populate warehouse available area based on Warehouse Selected id= #allocatedWarehouse
	
	$('#product_category_id5').change(function () {
	   var selectedPCId = $('#product_category_id5').val();
	  // var $txt = $("#product_category_id5 option:selected").text();
	   //alert(txt);
	//   $('#product_category_id').val(selectedWarehouseId);
	// Re-select the original options
	    $('#product_id5').empty();
	    $('#product_category_id5').prop("selected", true);
		  
	  // alert($('#allocatedWarehouseId').val());
	   
	   
		$.ajax({
			type:'GET',
			encoding : "UTF-8",
			url : "getProductByCId",
			data : 
			{
				selectedPCId : selectedPCId,
			},
		    dataType: 'json',
		    success: function( json ) {
		        $.each(json, function(i, value) {
		        	
		        	/*  var valueOfFieldFloor = value.available_floor_carpet_area;
		        	 var valueOfFieldCarpet =value.available_rack_carpet_area;
		        	 $("#availableFloor").val(valueOfFieldFloor);
					$("#availableCarpet").val(valueOfFieldCarpet); */
		        	$('#product_id5').append($('<option>').text(value.product_name).attr('value', value.product_id));
				     
		        	 
		        });
		    }
		}); 
	   
		//Populate Dropdown
	   
	} );
	


//Populate warehouse available area based on Warehouse Selected id= #allocatedWarehouse
	
	$('#product_id5').change(function () {
	   var selectedPId = $('#product_id5').val();
	  // var $txt = $("#product_category_id5 option:selected").text();
	   //alert(txt);
	//   $('#product_category_id').val(selectedWarehouseId);
	// Re-select the original options
	    $('#product_id5').prop("selected", true);
		  
	  // alert($('#allocatedWarehouseId').val());
	   
	  // $('#product_id5').empty();;
	   
		$.ajax({
			type:'GET',
			encoding : "UTF-8",
			url : "getProductById",
			data : 
			{
				selectedPId : selectedPId,
			},
		    dataType: 'json',
		    success: function( json ) {
		        $.each(json, function(i, value) {
		        	
		        	/*  var valueOfFieldFloor = value.available_floor_carpet_area;
		        	 var valueOfFieldCarpet =value.available_rack_carpet_area;*/
		        	 $("#actual_total_cost").val(value.product_rate);
		        	 var actualTotalCost = parseInt(value.product_rate);
		        	 
					$("#advance_payment").val(actualTotalCost*0.75);
					$('#balance_payment').val(actualTotalCost*0.25);
		        	 
		        });
		    }
		}); 
	   
		//Populate Dropdown

	
		
		
	   
	} );
	
//Populate warehouse available area based on Warehouse Selected id= #allocatedWarehouse
	
	$('#gsc_id5').change(function () {
	   var gsc_id = $('#gsc_id5').val();
	    $('#eyes_number').empty();
	    $('#gsc_id5').prop("selected", true);
		  
	   
	   
		$.ajax({
			type:'GET',
			encoding : "UTF-8",
			url : "getGSEByCId",
			data : 
			{
				gsc_id : gsc_id,
			},
		    dataType: 'json',
		    success: function( json ) {
		        $.each(json, function(i, value) {
		 
		        	$('#eyes_number').append($('<option>').text(value.gse_value).attr('value', value.gse_id));
				     
		        	 
		        });
		    }
		}); 
	   
		//Populate Dropdown
	   
	} );



	$('#advance_payment').change(function () {

		var actual_total_cost = parseInt($('#actual_total_cost').val());
		var advance_payment = parseInt($('#advance_payment').val());

		var balance_payment = actual_total_cost - advance_payment;

		$('#balance_payment').val(balance_payment);
		console.log(balance_payment);
		
		});
	
	
	
	 $('#statusWork').change(function(){
		/*  $('.actualData').hide();
         $('#' + $(this).val()).fadeIn(500);
        */
        
        var currentStatus = $(this).val();
       
		var confirmed = "confirmed";
		if(currentStatus == confirmed){
		
			    $("#actualFloorBuiltupArea").prop('disabled', false);
				$("#actualFloorCarpetArea").prop('disabled', false);
				$("#actualRackBuiltupArea").prop('disabled', false);
				$("#actualRackCarpetArea").prop('disabled', false);
				$("#actualRevenue").prop('disabled', false);
				$("#actualStartDate").prop('disabled', false);
	
			}
		else
			{
			
			  $("#actualFloorBuiltupArea").attr('disabled','disabled');
				$("#actualFloorCarpetArea").attr('disabled','disabled');
				$("#actualRackBuiltupArea").attr('disabled','disabled');
				$("#actualRackCarpetArea").attr('disabled','disabled');
				$("#actualRevenue").attr('disabled','disabled');
				$("#actualStartDate").attr('disabled','disabled');
			
			}
         
     /* 	var estimatedFloorBuiltupArea = $("#estimatedFloorBuiltupArea").val();
		var estimatedFloorCarpetArea = $("#estimatedFloorCarpetArea").val();
		var estimatedRackBuiltupArea = $("#estimatedRackBuiltupArea").val();
		var estimatedRackCarpetArea = $("#estimatedRackCarpetArea").val();
		var estimatedStartDate = $("#estimatedStartDate").val();
     	
		
		
		 $("#actualFloorBuiltupArea").val(estimatedFloorBuiltupArea);
			$("#actualFloorCarpetArea").val(estimatedFloorCarpetArea);
			$("#actualRackBuiltupArea").val(estimatedRackBuiltupArea);
			$("#actualRackCarpetArea").val(estimatedRackCarpetArea);
			$("#actualStartDate").val(estimatedStartDate); */
     });
	
	/* Carpet Area calculations */
	
	
	
	
	$('#floorCarpetArea').change(function () {
	   var floorCarpetArea = $('#floorCarpetArea').val();
	   var floorBuiltupArea = parseInt((floorCarpetArea*1.25));
	   $("#floorBuiltupArea").val(floorBuiltupArea);
	});
	

	$('#floorBuiltupArea').change(function () {
	   var floorBuiltupArea = $('#floorBuiltupArea').val();
	   if(floorBuiltupArea>0){
		   var floorCarpetArea = parseInt((floorBuiltupArea/1.25));
		   $("#floorCarpetArea").val(floorCarpetArea);
		  }
	  });
	   
	
		$('#estimatedFloorCarpetArea').change(function () {
			   var estimatedFloorCarpetArea = $('#estimatedFloorCarpetArea').val();
			   
			   var estimatedFloorBuiltupArea = parseInt((estimatedFloorCarpetArea*1.25));
			   $("#estimatedFloorBuiltupArea").val(estimatedFloorBuiltupArea);
			   
			});
	
		$('#estimatedFloorBuiltupArea').change(function () {
			   var estimatedFloorBuiltupArea = $('#estimatedFloorBuiltupArea').val();
			   if(estimatedFloorBuiltupArea>0){
				   var estimatedFloorCarpetArea = parseInt((estimatedFloorBuiltupArea/1.25));
				   $("#estimatedFloorCarpetArea").val(estimatedFloorCarpetArea);
				  }
			  });
		
		
		
		
		$('#actualFloorCarpetArea').change(function () {
			   var actualFloorCarpetArea = $('#actualFloorCarpetArea').val();
			   
			   var actualFloorBuiltupArea = parseInt((actualFloorCarpetArea*1.25));
			   $("#actualFloorBuiltupArea").val(actualFloorBuiltupArea);
			   
			});
		

		$('#actualFloorBuiltupArea').change(function () {
		   var actualFloorBuiltupArea = $('#actualFloorBuiltupArea').val();
		   if(actualFloorBuiltupArea>0){
			   var actualFloorCarpetArea = parseInt((actualFloorBuiltupArea/1.25));
			   $("#actualFloorCarpetArea").val(actualFloorCarpetArea);
			  }
		  });
		
		
	
	/* Collects n Passes Warehouse Information from UI to the Warehouse Contoller
	 */


	 $("#warehouseForm").validate({
	        rules: {
	        	warehouseName :"required",
				floorBuiltupArea : "required",
				floorCarpetArea : "required",
				rackBuiltupArea : "required",
				rackCarpetArea : "required",
	        },
	        messages: {
	        	warehouseName :"Please specify Warehouse Name",
				floorBuiltupArea : "What is the Built-up area",
				floorCarpetArea : "What is the Built-up area",
				rackBuiltupArea : "required",
				rackCarpetArea : "Whats the Carpet Area",
	           
	        }
	    });

	 
	$("#saveWarehouseInfo").click(function(){

		if($("#warehouseForm").valid())
		 {
		
		 $("#addWarehouseDiv").hide();
		 $("#viewWarehouseDiv").fadeIn();
		 $('#dashboardDiv').hide();
		 $('#updateWarehouseInfo').hide();
		 $("#addTitle").hide();
		 $("#updateTitle").hide();
		 $("#addWarehouse").fadeIn();
		 $('#cancelWarehouseInfo').hide();
		 $('#updateWarehouseInfo').hide();
		 $('#saveWarehouseInfo').hide();
		 
		var product_name = $("#product_name").val();
		var product_brand = $("#product_brand").val();
		var product_rate = $("#product_rate").val();
		var product_quantity = $("#product_quantity").val();
		var product_category_id = $("#product_category_id2").val();
		alert(product_category_id);
		$.ajax({
			
			type : "POST",
			encoding : "UTF-8",
			url : "addProduct",
			datatype :'json', 
			data : {
				product_name : product_name,
				product_brand : product_brand,
				product_rate : product_rate,
				product_quantity : product_quantity,
				product_category_id : product_category_id,
				
	            },
			success : function(data) {
				console.log("SUCCESS: ", data);
				loadProductName();
				$("#grid").trigger("reloadGrid");
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
		});	
		 }
     
		 			 
		});
	
	
	/* Collects n Passes Warehouse Information from UI to the Warehouse Contoller
	 */
	 
	$("#updateWarehouseInfo").click(function(){

		if($("#warehouseForm").valid())
		 {
		
		$("#addWarehouseDiv").hide();
		 $("#viewWarehouseDiv").fadeIn();
		 $('#dashboardDiv').hide();
		 
		 
		 $("#addTitle").hide();
		 $("#updateTitle").hide();
		 $("#addWarehouse").fadeIn();
		 $('#cancelWarehouseInfo').hide();
		 $('#updateWarehouseInfo').hide();
		 $('#saveWarehouseInfo').hide();
		 
		var product_id = $("#product_id").val();
		var product_name = $("#product_name").val();
		var product_brand = $("#product_brand").val();
		var product_rate = $("#product_rate").val();
		var product_quantity = $("#product_quantity").val();
		var product_category_id = $("#product_category_id2").val();
		alert(product_category_id);
		
		$.ajax({
			
			type : "POST",
			encoding : "UTF-8",
			url : "updateProduct",
			datatype :'json', 
			data : {
				product_id : product_id,
				product_name : product_name,
				product_brand : product_brand,
				product_rate : product_rate,
				product_quantity : product_quantity,
				product_category_id : product_category_id,
			   },
			success : function(data) {
				console.log("SUCCESS: ", data);
				$("#grid").trigger("reloadGrid");
				var msg="";
				 $("#warehouseDivCount").html(msg).fadeIn().delay(2000);
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
		});				 
		 }
		});
	

	//Cancel Operation of Adding Warehouse
	
	$("#cancelWarehouseInfo").click(function(){
		 $("#addWarehouseDiv").hide();
		 $("#viewWarehouseDiv").fadeIn();
		 $("#addTitle").hide();
		 $("#updateTitle").hide();
		 $("#addWarehouse").fadeIn();
		 $('#cancelWarehouseInfo').hide();
		 $('#updateWarehouseInfo').hide();
		 $('#saveWarehouseInfo').hide();
		 
		});



	 $("#gSEForm").validate({
	        rules: {
	        	gse_value :"required",
				
	        },
	        messages: {
	        	gse_value :"Please specify Warehouse Name",
				
	           
	        }
	    });

	 
	$("#saveGSEInfo").click(function(){

		if($("#gSEForm").valid())
		 {
		
		 $("#addGSEDiv").hide();
		 $("#viewGSEDiv").fadeIn();
		 $('#dashboardDiv').hide();
		 $('#updateGSEInfo').hide();
		 $("#addGSETitle").hide();
		 $("#updateGSETitle").hide();
		 $("#addGSE").fadeIn();
		 $('#cancelGSEInfo').hide();
		 $('#updateGSEInfo').hide();
		 $('#saveGSEInfo').hide();
		 
		var gse_value = $("#gse_value").val();
		var gsc_id = $("#gsc_id2").val();
		alert(gsc_id);
		$.ajax({
			
			type : "POST",
			encoding : "UTF-8",
			url : "addGSE",
			datatype :'json', 
			data : {
				gse_value : gse_value,
				gsc_id : gsc_id
	            },
			success : function(data) {
				console.log("SUCCESS: ", data);
				$("#gridGSE").trigger("reloadGrid");
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
		});	
		 }
    
		 			 
		});
	
	
	/* Collects n Passes Warehouse Information from UI to the Warehouse Contoller
	 */
	 
	$("#updateGSEInfo").click(function(){

		if($("#gSEForm").valid())
		 {
		
		$("#addGSEDiv").hide();
		 $("#viewGSEDiv").fadeIn();
		 $('#dashboardDiv').hide();
		 
		 
		 $("#addGSETitle").hide();
		 $("#updateGSETitle").hide();
		 $("#addGSE").fadeIn();
		 $('#cancelGSEInfo').hide();
		 $('#updateGSEInfo').hide();
		 $('#saveGSEInfo').hide();
		 
		var gse_id = $("#gse_id").val();
		var gse_value = $("#gse_value").val();
		var gsc_id = $("#gsc_id2").val();
		alert(gsc_id);
		
		$.ajax({
			
			type : "POST",
			encoding : "UTF-8",
			url : "updateGSE",
			datatype :'json', 
			data : {
				gse_id : gse_id,
				gse_value : gse_value,
				gsc_id : gsc_id,
			   },
			success : function(data) {
				console.log("SUCCESS: ", data);
				$("#gridGSE").trigger("reloadGrid");
				var msg="";
				 //$("#warehouseDivCount").html(msg).fadeIn().delay(2000);
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
		});				 
		 }
		});
	

	//Cancel Operation of Adding Warehouse
	
	$("#cancelGSEInfo").click(function(){
		 $("#addGSEDiv").hide();
		 $("#viewGSEDiv").fadeIn();
		 $("#addGSETitle").hide();
		 $("#updateGSETitle").hide();
		 $("#addGSE").fadeIn();
		 $('#cancelGSEInfo').hide();
		 $('#updateGSEInfo').hide();
		 $('#saveGSEInfo').hide();
		 
		});




	

	/* Collects n Passes Warehouse Information from UI to the Warehouse Contoller
	 */
	 $("#readinessForm").validate({
	        rules: {
	        	readinessElementName: "required",
	        },
	        messages: {
	        	readinessElementName: "Please specify Product Category name",
	           
	        }
	    });

	 
	$("#saveReadinessInfo").click(function(){

		if($("#readinessForm").valid())
		 {

		 $("#addReadinessDiv").hide();
		 $("#viewReadinessDiv").fadeIn();
		 $('#dashboardDiv').hide();
		 $('#updateReadinessInfo').hide();
		
		 $("#addRETitle").hide();
		 $("#updateRETitle").hide();
	
		 $("#addReadiness").fadeIn();
		 $('#cancelReadinessInfo').hide();
		 $('#updateReadinessInfo').hide();
		 $('#saveReadinessInfo').hide();
		 
		var category_name = $("#category_name").val();
		
		$.ajax({
			
			type : "POST",
			encoding : "UTF-8",
			url : "addProductCategory",
			datatype :'json', 
			data : {
				category_name : category_name,
	        		        	
	            },
			success : function(data) {
				console.log("SUCCESS: ", data);
				$("#grid3").trigger("reloadGrid");
				loadProductCategory();
							
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
		});				
		 } 
		});
	
	
	/* Collects n Passes Warehouse Information from UI to the Warehouse Contoller
	 */
	 
	$("#updateReadinessInfo").click(function(){

			if($("#readinessForm").valid())
		 {
		
		$("#addReadinessDiv").hide();
		 $("#viewReadinessDiv").fadeIn();
		 $('#dashboardDiv').hide();
		 $('#updateReadinessInfo').hide();
		 $("#addRETitle").hide();
		 $("#updateRETitle").hide();
	
		 $("#addReadiness").fadeIn();
		 $('#cancelReadinessInfo').hide();
		 $('#updateReadinessInfo').hide();
		 $('#saveReadinessInfo').hide();
		 
		 
		 var product_category_id = $("#product_category_id").val(); 
		var category_name = $("#category_name").val();
		

		
		$.ajax({
			
			type : "POST",
			encoding : "UTF-8",
			url : "updateProductCategory",
			datatype :'json', 
			data : {
				product_category_id : product_category_id,
				category_name : category_name,
	        		        	
	            },
			success : function(data) {
				console.log("SUCCESS: ", data);
				$("#grid3").trigger("reloadGrid");
				loadProductCategory();
							
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
		});				 
		 }
		});
	

	//Cancel Operation of Adding Warehouse
	
	$("#cancelReadinessInfo").click(function(){
		 $("#addReadinessDiv").hide();
		 $("#viewReadinessDiv").fadeIn();
		 $("#addRETitle").hide();
		 $("#updateRETitle").hide();
	
		 $("#addReadiness").fadeIn();
		 $('#cancelReadinessInfo').hide();
		 $('#updateReadinessInfo').hide();
		 $('#saveReadinessInfo').hide();
		 
		 
		});

	

	/* Collects n Passes Warehouse Information from UI to the Warehouse Contoller
	 */
	 $("#gSCForm").validate({
	        rules: {
	        	gsc_name: "required",
	        },
	        messages: {
	        	gsc_name: "Please specify Glass Stock Category name",
	           
	        }
	    });

	 
	$("#saveGSCInfo").click(function(){

		if($("#readinessForm").valid())
		 {

		 $("#addGSCDiv").hide();
		 $("#viewGSCDiv").fadeIn();
		 $('#dashboardDiv').hide();
		 $('#updateGSCInfo').hide();
		
		 $("#addGSCTitle").hide();
		 $("#updateGSCTitle").hide();
	
		 $("#addGSC").fadeIn();
		 $('#cancelGSCInfo').hide();
		 $('#updateGSCInfo').hide();
		 $('#saveGSCInfo').hide();
		 
		var gsc_name = $("#gsc_name").val();
		
		$.ajax({
			
			type : "POST",
			encoding : "UTF-8",
			url : "addGSC",
			datatype :'json', 
			data : {
				gsc_name : gsc_name,
	        		        	
	            },
			success : function(data) {
				console.log("SUCCESS: ", data);
				$("#gridGSC").trigger("reloadGrid");
				loadProductCategory();
							
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
		});				
		 } 
		});
	
	
	/* Collects n Passes Warehouse Information from UI to the Warehouse Contoller
	 */
	 
	$("#updateGSCInfo").click(function(){

			if($("#gSCForm").valid())
		 {
		
		$("#addGSCDiv").hide();
		 $("#viewGSCDiv").fadeIn();
		 $('#dashboardDiv').hide();
		 $('#updateGSCInfo').hide();
		 $("#addGSCTitle").hide();
		 $("#updateGSCTitle").hide();
	
		 $("#addGSC").fadeIn();
		 $('#cancelGSCInfo').hide();
		 $('#updateGSCInfo').hide();
		 $('#saveGSCInfo').hide();
		 
		 
		 var gsc_id = $("#gsc_id").val(); 
		var gsc_name = $("#gsc_name").val();
		

		
		$.ajax({
			
			type : "POST",
			encoding : "UTF-8",
			url : "updateGSC",
			datatype :'json', 
			data : {
				gsc_id : gsc_id,
				gsc_name : gsc_name,
	        		        	
	            },
			success : function(data) {
				console.log("SUCCESS: ", data);
				$("#gridGSC").trigger("reloadGrid");
				loadProductCategory();
							
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
		});				 
		 }
		});
	

	//Cancel Operation of Adding Warehouse
	
	$("#cancelGSCInfo").click(function(){
		 $("#addGSCDiv").hide();
		 $("#viewGSCDiv").fadeIn();
		 $("#addGSCTitle").hide();
		 $("#updateGSCTitle").hide();
	
		 $("#addGSC").fadeIn();
		 $('#cancelGSCInfo').hide();
		 $('#updateGSCInfo').hide();
		 $('#saveGSCInfo').hide();
		 
		 
		});

	
	
	
	/* Collects n Passes Warehouse Information from UI to the Warehouse Contoller
	 */
	 
	$("#saveReadinessTemplate").click(function(){
		 $("#addReadinessTemplateDiv").hide();
		 $("#viewReadinessTemplateDiv").fadeIn();
		 $('#dashboardDiv').hide();
		 $('#updateReadinessTemplateInfo').hide();
		 
		 $("#addRTLTitle").hide();
		 $("#updateRTLTitle").hide();
		 $("#addReadinessTemplate").fadeIn();
		 $('#cancelReadinessTemplate').hide();
		 $('#updateReadinessTemplate').hide();
		 $('#saveReadinessTemplate').hide();
		
		$.ajax({
			
			type : "POST",
			encoding : "UTF-8",
			url : "addReadinessTemplate",
			datatype :'json', 
			data : {
				warehouseName : warehouseName,
				floorBuiltupArea : floorBuiltupArea,
				floorCarpetArea : floorCarpetArea,
				rackBuiltupArea : rackBuiltupArea,
				rackCarpetArea : rackCarpetArea,
	        		        	
	            },
			success : function(data) {
				console.log("SUCCESS: ", data);
				$("#grid4").trigger("reloadGrid");
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
		});				 
		});
	
	
	/* Collects n Passes Warehouse Information from UI to the Warehouse Contoller
	 */
	 
	$("#updateReadinessTemplate").click(function(){
		
		$("#addReadinessTemplateDiv").hide();
		 $("#viewReadinessTemplateDiv").fadeIn();
		 $('#dashboardDiv').hide();
		 $('#updateReadinessTemplateInfo').hide();
		 
		 $("#addRTLTitle").hide();
		 $("#updateRTLTitle").hide();
		 $("#addReadinessTemplate").fadeIn();
		 $('#cancelReadinessTemplate').hide();
		 $('#updateReadinessTemplate').hide();
		 $('#saveReadinessTemplate').hide();
		 
		 
		var warehouseId = $("#warehouseId").val();
		var warehouseName = $("#warehouseName").val();
		var floorBuiltupArea = $("#floorBuiltupArea").val();
		var floorCarpetArea = $("#floorCarpetArea").val();
		var rackBuiltupArea = $("#rackBuiltupArea").val();
		var rackCarpetArea = $("#rackCarpetArea").val();
		

		
		$.ajax({
			
			type : "POST",
			encoding : "UTF-8",
			url : "updateReadinessTemplate",
			datatype :'json', 
			data : {
				warehouseId : warehouseId,
				warehouseName : warehouseName,
				floorBuiltupArea : floorBuiltupArea,
				floorCarpetArea : floorCarpetArea,
				rackBuiltupArea : rackBuiltupArea,
				rackCarpetArea : rackCarpetArea,
	        		        	
	            },
			success : function(data) {
				console.log("SUCCESS: ", data);
				$("#grid4").trigger("reloadGrid");
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
		});				 
		});
	

	//Cancel Operation of Adding Warehouse
	
	$("#cancelReadinessTemplate").click(function(){
		 $("#addReadinessTemplateDiv").hide();
		 $("#viewReadinessTemplateDiv").fadeIn();
		 $("#addRTLTitle").hide();
		 $("#updateRTLTitle").hide();
		 $("#addReadinessTemplate").fadeIn();
		 $('#cancelReadinessTemplate').hide();
		 $('#updateReadinessTemplate').hide();
		 $('#saveReadinessTemplate').hide();
		 
		});

	
	
	/* Collects n Passes SalesPipeLine Information from UI to the SalesPipeLine Contoller
	 */


	 var validator = $("#myForm").validate({
	        rules: {
	        	first_name: "required",
	        	email_id : "required",
	        	password: "required",
	        },
	        messages: {
	        	first_name: "Please specify first name",
	            email_id : "Please Enter Email Id",
	            password: "Please Enter Password",
	          
	           
	        }
	    });

	    

	


	$("#saveSalesPipeLineInfo").click(function(){

		
		
		if($("#myForm").valid())
		 {
		 var empty="";
		var first_name = $("#first_name").val();
		var email_id = $("#email_id").val();
		var password = $("#password").val();
				
			$.ajax({
				
				type : "POST",
				encoding : "UTF-8",
				url : "addUser",
				datatype :'json', 
				data : {
					first_name : first_name,
					email_id : email_id,
					password : password,
						        		        	
		            },
				success : function(data) {
					console.log("SUCCESS: ", data);
					//alert("hello");
					 $("#addSalesPipeLineDiv").hide();
					 $("#viewSalesPipeLineDiv").fadeIn();
					 $('#dashboardDiv').hide();
					 $('#updateWarehouseInfo').hide();
					 $("#addSPLTitle").hide();
					 $("#updateSPLTitle").hide();
					 $("#addUser").show();
					 $('#cancelSalesPipeLineInfo').hide();
					 $('#updateSalesPipeLineInfo').hide();
					 $('#saveSalesPipeLineInfo').hide();
					
					$("#customer_name").css("border-color","#d7d7d7");
					$("#enrollment_date").css("border-color","#d7d7d7");
					$("#contact_number").css("border-color","#d7d7d7");
					$("#customer_address").css("border-color","#d7d7d7");
					$("#eyes_number").css("border-color","#d7d7d7");
					$("#product_category_id5").css("border-color","#d7d7d7");
					$("#product_id5").css("border-color","#d7d7d7");
					$("#actual_total_cost").css("border-color","#d7d7d7");
					$("#advance_payment").css("border-color","#d7d7d7");
					$("#balance_payment").css("border-color","#d7d7d7");

					$("#myForm").resetForm();
					
				},
				error : function(e) {
					console.log("ERROR: ", e);
				
				}
			});	
			}
		else
			{
console.log("hello");
			}
				});
	
	
	/* Collects n Passes Warehouse Information from UI to the Warehouse Contoller
	 */

	var validatorUpdate = $("#myFormUpdate").validate({
	        rules: {
	        	/* customerName: "required",
	        	estimatedFloorBuiltupArea : "required",
	        	estimatedFloorCarpetArea: "required",
	        	estimatedRackBuiltupArea : "required",
	        	estimatedRackCarpetArea: "required",
	        	estimatedRevenue : "required",
	        	estimatedStartDate: "required",
	        	actualFloorBuiltupArea : "required", */
				actualFloorCarpetArea : "required",
				actualRackBuiltupArea : "required",
				actualRackCarpetArea : "required",
				actualRevenue : "required",
				actualStartDate : "required",
				remark : "required",
	        },
	        messages: {
	        	/* customerName: "Please specify customer name",
	            estimatedFloorBuiltupArea : "How much is the Floor built-up area ?",
	            estimatedFloorCarpetArea: "How much is the Floor carpet area ?",
	            estimatedRackBuiltupArea: "How much is the Rack built-up area ?",
	            estimatedRackCarpetArea : "How much is the Rack carpet area ?",
	            estimatedRevenue: "What amount of revenue is expected ?",
	            estimatedStartDate : "By when is this project expected to begin?",actualFloorBuiltupArea : "required", */
				actualFloorCarpetArea : "Enter Actual Carpert area",
				actualRackBuiltupArea : "Enter Actual Built-up Area",
				actualRackCarpetArea : "Enter Actual Rack Space",
				actualRevenue : "enter Actual Revenue",
				actualStartDate : "Enter Actual Start Date ",
				remark : "enter remark",
	           
	        }
	    });

	    


	 
	$("#updateSalesPipeLineInfo").click(function(){

		if($("#myForm").valid())
		 {
		 
		 $("#addSalesPipeLineDiv").hide();
		 $("#viewSalesPipeLineDiv").fadeIn();
		 $("#addWarehouseDiv").hide();
	     $("#viewWarehouseDiv").hide();
		 $('#dashboardDiv').hide();
		 $('#updateWarehouseInfo').hide();
		 
		 $("#addSPLTitle").hide();
		 $("#updateSPLTitle").hide();
		 $("#addUser").show();
		 $('#cancelSalesPipeLineInfo').hide();
		 $('#updateSalesPipeLineInfo').hide();
		 $('#saveSalesPipeLineInfo').hide();
		 
		    var customer_id = $("#customer_id").val();
		    var customer_name = $("#customer_name").val();
			var enrollment_date = $("#enrollment_date").val();
			var contact_number = $("#contact_number").val();
			var customer_address = $("#customer_address").val();
			var eyes_number = $("#eyes_number").val();
			var product_category_id = $("#product_category_id5").val();
			var product_id = $("#product_id5").val();
			var actual_total_cost = $("#actual_total_cost").val();
			var advance_payment = $("#advance_payment").val();
			var balance_payment = $("#balance_payment").val();

			
			$.ajax({
				
				type : "POST",
				encoding : "UTF-8",
				url : "updateCustomer",
				datatype :'json', 
				data : {
					customer_id : customer_id,
					customer_name : customer_name,
					enrollment_date : enrollment_date,
					contact_number : contact_number,
					customer_address : customer_address,
					eyes_number : eyes_number,
					product_category_id : product_category_id,
					product_id : product_id,
					actual_total_cost : actual_total_cost,
					advance_payment : advance_payment,
					balance_payment : balance_payment,
		            },
				success : function(data) {
					console.log("SUCCESS: ", data);
					$("#grid2").trigger("reloadGrid");
					$("#grid5").trigger("reloadGrid");
					/* var workStatus = $.trim(data);
					var confirmed = "confirmed";
					if(workStatus == confirmed)
						{
						    	
						$('#readinessTemplateCompanyName').val(customerName);
				    	$('#readinessSalesPipeLineId').val(salesPipeLineId);
						
						$("#inlineEditGrid").jqGrid('setGridParam', { 
				            postData: {"salesPipeLineId":salesPipeLineId }
				     }).trigger('reloadGrid'); 
			  	
				    	$('#readinessTemplate').show();
				    	$('#addReadinessTemplateGrid').hide();
				    	$('#editReadinessTemplateGrid').show();
				    	$('#bulkSave').hide();
				    	$('#bulkUpdate').show();
						

				    	$("#updateReadinessOrderTitle").hide();
				    	$("#addReadinessOrderTitle").show();
												
						} */
					
				},
				error : function(e) {
					console.log("ERROR: ", e);
				
				}
			});	
}
		else
			{
               console.log("failed");
			}
		
		});
	
	
//	Cancel Opertaion of SalesPipleLine
	
		$("#cancelSalesPipeLineInfo").click(function(){
			 $("#addWarehouseDiv").hide();
			 $("#viewWarehouseDiv").hide();
			 $("#addSalesPipeLineDiv").hide();
			 $("#viewSalesPipeLineDiv").fadeIn();
			 $("#addSPLTitle").hide();
			 $("#updateSPLTitle").hide();
			 $("#addUser").show();
			 $('#cancelSalesPipeLineInfo').hide();
			 $('#updateSalesPipeLineInfo').hide();
			 $('#saveSalesPipeLineInfo').hide();
			 
			 validator.resetForm();
			 validatorUpdate.resetForm();
				$("#customerName").css("border-color","#d7d7d7");
				//alert("here");
				$("#estimatedFloorBuiltupArea").css("border-color","#d7d7d7");
				$("#estimatedFloorCarpetArea").css("border-color","#d7d7d7");
				$("#estimatedRevenue").css("border-color","#d7d7d7");
				$("#estimatedStartDate").css("border-color","#d7d7d7");
				$("#estimatedRackBuiltupArea").css("border-color","#d7d7d7");
				$("#estimatedRackCarpetArea").css("border-color","#d7d7d7");
			    $("#actualStartDate").css("border-color","#d7d7d7")
			});
	
	$("#cancelReadinessTemplateDailog").click(function()
			{
		      
		     $("#readinessTemplate").hide();
		
	        }
			);

	
	 
	$("#readinessTemplateEditButton").click(function(){


		if($("#readinessTemplateForm").valid())
		 {
		  
			 
		var grid = $('#inlineEditGrid');    
		var rowid = $("#rowNumber").val();
		var readinessTemplateEditId = $("#readinessTemplateEditId").val();
		var readinessTemplateEditCustomerName = $("#readinessTemplateEditCustomerName").val();
		var readinessTemplateEditElement =$("#readinessTemplateEditElement").val();                                 
		var readinessTemplateEditStartDate = $("#readinessTemplateEditStartDate").val();                                
		var readinessTemplateEditEndDate = $("#readinessTemplateEditEndDate").val(); 
		var readinessTemplateEditElementStatus = $("#readinessTemplateEditElementStatus").val();
		var readinessTemplateEditOwnerName = $("#readinessTemplateEditOwnerName").val(); 
		var readinessTemplateEditQuantity = $("#readinessTemplateEditQuantity").val(); 
		
		//alert(rowid+","+readinessTemplateEditId);
		
		var startDateV    = new Date(readinessTemplateEditStartDate),
	    yr      = startDateV.getFullYear(),
	    month   = startDateV.getMonth() < 10 ? '0' + startDateV.getMonth() : startDateV.getMonth(),
	    day     = startDateV.getDate()  < 10 ? '0' + startDateV.getDate()  : startDateV.getDate(),
	    startDate = day + '-' + month + '-' + yr;
		alert(startDate);

	    var endDateV    = new Date(readinessTemplateEditEndDate),
	    yr      = endDateV.getFullYear(),
	    month   = endDateV.getMonth() < 10 ? '0' + endDateV.getMonth() : endDateV.getMonth(),
	    day     = endDateV.getDate()  < 10 ? '0' + endDateV.getDate()  : endDateV.getDate(),
	    endDate = day + '-' + month + '-' + yr;
		alert(endDate);
		
		
		
		grid.jqGrid('setCell', rowid, 'readinessTemplateId',readinessTemplateEditId);	
		grid.jqGrid('setCell', rowid, 'readiness_element_name',readinessTemplateEditCustomerName);	
		 grid.jqGrid('setCell', rowid, 'readinessElementQuantity',readinessTemplateEditQuantity);	
		grid.jqGrid('setCell', rowid, 'taskStartDate',startDate);	
		grid.jqGrid('setCell', rowid, 'taskEndDate',endDate);	
		grid.jqGrid('setCell', rowid, 'ownerName',readinessTemplateEditOwnerName);	
		grid.jqGrid('setCell', rowid, 'readinessElementStatus',readinessTemplateEditElementStatus);	
		grid.jqGrid('setCell', rowid, 'taskStartDateAct',readinessTemplateEditStartDate);	
		grid.jqGrid('setCell', rowid, 'taskEndDateAct',readinessTemplateEditEndDate);	
		$("#editReadinessTemplateDiv").hide();
		
		
		$("#readinessTemplateEditId").val("");
		$("#readinessTemplateEditCustomerName").val("");
		$("#readinessTemplateEditElement").val("");                                 
		$("#readinessTemplateEditStartDate").val("");                                
		$("#readinessTemplateEditEndDate").val(""); 
		$("#readinessTemplateEditElementStatus").val("");
		$("#readinessTemplateEditOwnerName").val(""); 
		$("#readinessTemplateEditQuantity").val(""); 
		
	/* 	$.ajax({
			
			type : "POST",
			encoding : "UTF-8",
			url : "updateReadinessTemplate",
			datatype :'json', 
			data : {
				readinessTemplateEditId : readinessTemplateEditId,
				readinessTemplateEditCustomerName : readinessTemplateEditCustomerName,
				readinessTemplateEditStartDate : readinessTemplateEditStartDate,
				readinessTemplateEditEndDate : readinessTemplateEditEndDate,
				readinessTemplateEditElementStatus : readinessTemplateEditElementStatus,
				readinessTemplateEditOwnerName : readinessTemplateEditOwnerName,
				readinessTemplateEditQuantity : readinessTemplateEditQuantity,
	            },
			success : function(data) {
				console.log("SUCCESS: ", data);
				alert(data);
				$('#editReadinessTemplateDiv').hide();
				
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
		});		 */		
		
		 }
		 else
			 {
			 console.log('hello');

			 }
		
		
		
		});
	
	$("#singleAdd").click(function()
			{
		$("#editReadinessTemplateDiv").show();
		$("#readinessTemplateEditButton").hide();
		$("#addReadinessTemplateButton").show();
		$("#readinessTemplateEditId").val("");
		$("#readinessTemplateEditCustomerName").val("");
		$("#readinessTemplateEditElement").val("");                                 
		$("#readinessTemplateEditStartDate").val("");                                
		$("#readinessTemplateEditEndDate").val(""); 
		$("#readinessTemplateEditElementStatus").val("");
		$("#readinessTemplateEditOwnerName").val(""); 
		$("#readinessTemplateEditQuantity").val(""); 
		
		
		

		 $('#readinessTemplateEditCustomerName').empty();
		 
		
		$.ajax({
			type:'GET',
			encoding : "UTF-8",
			url : "listReadinessElements",
			data : "",
		    dataType: 'json',
		    success: function( json ) {
		        $.each(json, function(i, value) {
		        	
		        	$('#readinessTemplateEditCustomerName').append($('<option>').text(value.readiness_element_name).attr('value', value.readiness_element_name));
		        });
		    }
		});
		
		
			});

	
	

	 var validatorReadiness = $("#readinessTemplateForm").validate({
	        rules: {
	        	readinessTemplateEditStartDate : "required",
	        	readinessTemplateEditEndDate: "required",
	        	readinessTemplateEditElementStatus : "required",
	        	readinessTemplateEditOwnerName: "required",
	        	readinessTemplateEditQuantity: {
	        	      required: true,
	        	      number: true
	        	    },
	        },
	        messages: {
	        	readinessTemplateEditStartDate : "Please select Start Date",
	        	readinessTemplateEditEndDate: "Please select End Date",
	        	readinessTemplateEditElementStatus : "Please Enter Element Status",
	        	readinessTemplateEditOwnerName: "Enter Owner Name",/* 
	        	readinessTemplateEditQuantity : "Enter the Quantity ", */
	           
	        }
	    });

	

	$("#addReadinessTemplateButton").click(function()
			{
		
		if($("#readinessTemplateForm").valid())
		 {
		  
		
		var grid = $('#inlineEditGrid'); 
		var exactRowCount = $("#inlineEditGrid").getGridParam("reccount");
		var counter = "1"; 
		var rowid =parseInt(exactRowCount) + parseInt(counter);
		//alert(rowid);
		var readinessTemplateEditId = $("#readinessTemplateEditId").val();
		var readinessTemplateEditCustomerName = $("#readinessTemplateEditCustomerName").val();
		var readinessTemplateEditElement =$("#readinessTemplateEditElement").val();                                 
		var readinessTemplateEditStartDate = $("#readinessTemplateEditStartDate").val();                                
		var readinessTemplateEditEndDate = $("#readinessTemplateEditEndDate").val(); 
		var readinessTemplateEditElementStatus = $("#readinessTemplateEditElementStatus").val();
		var readinessTemplateEditOwnerName = $("#readinessTemplateEditOwnerName").val(); 
		var readinessTemplateEditQuantity = $("#readinessTemplateEditQuantity").val(); 
	 	var counterId = parseInt("0");

	 	var startDateV    = new Date(readinessTemplateEditStartDate),
	    yr      = startDateV.getFullYear(),
	    month   = startDateV.getMonth() < 10 ? '0' + startDateV.getMonth() : startDateV.getMonth(),
	    day     = startDateV.getDate()  < 10 ? '0' + startDateV.getDate()  : startDateV.getDate(),
	    startDate = day + '-' + month + '-' + yr;
		//alert(startDate);

	    var endDateV    = new Date(readinessTemplateEditEndDate),
	    yr      = endDateV.getFullYear(),
	    month   = endDateV.getMonth() < 10 ? '0' + endDateV.getMonth() : endDateV.getMonth(),
	    day     = endDateV.getDate()  < 10 ? '0' + endDateV.getDate()  : endDateV.getDate(),
	    endDate = day + '-' + month + '-' + yr;
		//alert(endDate);
	 	
		var mydata3 =  [{
			                 "readinessTemplateId": counterId,
				            "readiness_element_name": readinessTemplateEditCustomerName,
		            	    "readinessElementQuantity": readinessTemplateEditQuantity,
		            	    "taskStartDate": startDate,
		            	    "taskEndDate": endDate,
		            	    "ownerName": readinessTemplateEditOwnerName,
		            	    "readinessElementStatus": readinessTemplateEditElementStatus,
		            	    "isDeleted": "No",
		            	    "taskStartDateAct": readinessTemplateEditStartDate,
		            	    "taskEndDateAct": readinessTemplateEditEndDate
		            	  }]; 

		
		grid.addRowData(rowid, mydata3);
		
		 var readinessCompanyName = $('#readinessTemplateCompanyName').val();
		
		
		
	/* 	$.ajax({
			
			type : "POST",
			encoding : "UTF-8",
			url : "addReadinessTemplateBulk",
			datatype :'json', 
			data : {
				valueOfReadinessCompanyName : readinessCompanyName,
				valueOfReadinessSalesPipeLineId : readinessSalesPipeLineId,
				readinessArrayValue : mydata3,
	            },
			success : function(data) {
				console.log("SUCCESS: ", data);	alert(data);
				$('#inlineEditGrid').trigger("reloadGrid");
			
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
		});	  */
		
		$("#editReadinessTemplateDiv").hide();
		 }
		else{
			console.log("validation works");

			}
			});
	
	
	
	
	$('#cancelReadinessOrder').click(function()
			{
	      
	     $("#editReadinessTemplateDiv").hide();
	     //$("#readinessTemplateForm").resetForm();
	     validatorReadiness.resetForm();
	     
	     $("#readinessTemplateEditStartDate").css("border-color","#d7d7d7");
	     $("#readinessTemplateEditEndDate").css("border-color","#d7d7d7");
	     $("#readinessTemplateEditElementStatus").css("border-color","#d7d7d7");
	     $("#readinessTemplateEditOwnerName").css("border-color","#d7d7d7");
	     $("#readinessTemplateEditQuantity").css("border-color","#d7d7d7");
	     
       }
		);
	
	$('#applyFilter').click(function()
			{
		
		var filterText = $('#statusWorkFilter').val();
		alert(filterText);
		var grid = jQuery("#grid5");
		var postdata = grid.jqGrid('getGridParam','postData');
		
		var myfilter = { groupOp: "OR", rules: [] };        
	    myfilter.rules.push({ field: "statusWork", op: "cn", data: filterText });
	    $.extend(postdata, { filters: myfilter });
	//	$.extend (postdata,{filters:'',searchField: 'error_column',searchOper: 'eq',searchString: filterText});
		grid.jqGrid('setGridParam', { search: true, postData: postdata });
		grid.trigger("reloadGrid");
		
		
			});
	
	

	$("#bulkRemove").click(function()
			{
	/* 	var ids=$('#grid4').getGridParam('selarrrow');
		$('#grid4').delRowData(ids);
		
		for( var i=ids.length-1;i>=0;i--)
			{

			$('#grid4').delRowData(ids[i]);
			
			} */
	/* 	var myData = grid.jqGrid('getRowData');
		alert(myData);
		 */
		 var demo = $("#inlineGrid").jqGrid('getRowData')
		
		console.log(demo);
		 
			});
	
	
	$('#bulkSave').click(function(){
	 /*    var p = $('#grid4').getGridParam();
	    console.log("found gridParamData:", p.data); */
	  /*   if (p.data){
	        var newData = [
	            {id: 462, thingy: "abc"}
	        ];
	        var rowId = $.jgrid.randId();
	        $("#grid").jqGrid('addRowData', rowId, newData);
	        console.log(rowId);
	    }  */  
	     var readinessArrayValue = JSON.stringify($("#inlineGrid").jqGrid('getRowData'));
		console.log(readinessArrayValue);

	    
	 	var readinessCompanyName = $('#readinessTemplateCompanyName').val();
		var readinessSalesPipeLineId = $('#readinessSalesPipeLineId').val();
		
		
		$.ajax({
			
			type : "POST",
			encoding : "UTF-8",
			url : "addReadinessTemplateBulk",
			datatype :'json', 
			data : {
				valueOfReadinessCompanyName : readinessCompanyName,
				valueOfReadinessSalesPipeLineId : readinessSalesPipeLineId,
				readinessArrayValue : readinessArrayValue,
	            },
			success : function(data) {
				console.log("SUCCESS: ", data);
				
				alert(data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			}
		});		
	    
	    
	    
	});
	
	
	$('#bulkUpdate').click(function(){
		
		     var readinessArrayValue = JSON.stringify($("#inlineEditGrid").jqGrid('getRowData'));
			
		     console.log(readinessArrayValue);

		    
		 	var readinessCompanyName = $('#readinessTemplateCompanyName').val();
			var readinessSalesPipeLineId = $('#readinessSalesPipeLineId').val();
			
			
			$.ajax({
				
				type : "POST",
				encoding : "UTF-8",
				url : "updateReadinessTemplateBulk",
				datatype :'json', 
				data : {
					valueOfReadinessCompanyName : readinessCompanyName,
					valueOfReadinessSalesPipeLineId : readinessSalesPipeLineId,
					readinessArrayValue : readinessArrayValue,
		            },
				success : function(data) {
					console.log("SUCCESS: ", data);
					$("#grid3").trigger("reloadGrid");
					readinessTemplateValues.length = 0;
					loadReadinessElementName();
					//alert(readinessTemplateValues);
					
					
					$('#readinessTemplate').hide();
				},
				error : function(e) {
					console.log("ERROR: ", e);
				
				}
			});		
		    
		    
		    
		});
	
	$('#bulkUndo').click(function()
			{
		 
		
		 var rowData = $("#inlineEditGrid").getDataIDs();
		 console.log(rowData);
		 
		 
		    for (var i = 0; i<rowData.length; i++) 
		    {
		    	var trElement = jQuery("#"+rowData[i],jQuery('#inlineEditGrid'));
		    	trElement.addClass('displayShow');
		    	$("#inlineEditGrid").trigger("reloadGrid");
		    	//$("#inlineEditGrid").jqGrid('setRowData', rowData[i], false, {display:block});
		    }
		
			});
	
	
	$("#clientRTButton").click(function()
			{
		
		var clientRTValue = $('#clientRTName').val();
		alert(clientRTValue);
		
		$("#readinessTemplateReportGrid").jqGrid('setGridParam', { 
            postData: {"salesPipeLineId":clientRTValue }
     }).trigger('reloadGrid'); 
		
			});




	$("#clientWarehouseFilterButton").click(function()
			{
		
		var product_id = $('#clientWarehouseFilter').val();
		//alert(clientRTValue);
		
		$("#clientGrid").jqGrid('setGridParam', { 
			postData: {
		    	product_id: product_id,
		    },
     }).trigger('reloadGrid'); 
		
			});
	


    $("#hideLogout").click(function(){
    	$('#logoutDiv').hide();
        	});

    $("#hideWarning").click(function(){
    	$('#warningDiv').hide();
        	});

    $("#hideAlert").click(function(){
    	$('#alertDiv').hide();
        	});

	 $('#doWarehouseOperation').click(function()
	 {

		 var product_id = $('#alertPara').val();
		// alert(id);
		  $.ajax({
      		
      		type : "POST",
      		encoding : "UTF-8",
      		url : "deleteProductById",
      		datatype :'json', 
      		data : {
      			product_id : product_id,
      			        },
      		success : function(data) {
                    console.log("Marked for Deletion");
                    $("#grid").trigger("reloadGrid");
                    $('#alertDiv').hide();
      		           },
      		error : function(e) {
      			console.log("ERROR: ", e);
      		
      			}
      	});
	      	
		 });	

	 
	 
	 $('#doReadinessOperation').click(function()
			 {

				 var id = $('#alertPara').val();
				// alert(id);
				  $.ajax({
			                         		type : "POST",
			                         		encoding : "UTF-8",
			                         		url : "deleteProductCategory",
			                         		datatype :'json', 
			                         		data : {
			                         			product_category_id : id,
			                         			        },
			                         		success : function(data) {
			                                       console.log("Marked for Deletion");
			                                       $("#grid3").trigger("reloadGrid");
			                                       $('#alertDiv').hide();
			                         		           },
			                         		error : function(e) {
			                         			console.log("ERROR: ", e);
			                         		
			                         		}
			                         	});
				 });



	 $('#doGSCOperation').click(function()
			 {

				 var id = $('#alertPara').val();
				// alert(id);
				  $.ajax({
			                         		type : "POST",
			                         		encoding : "UTF-8",
			                         		url : "deleteGSC",
			                         		datatype :'json', 
			                         		data : {
			                         			gsc_id : id,
			                         			        },
			                         		success : function(data) {
			                                       console.log("Marked for Deletion");
			                                       $("#gridGSC").trigger("reloadGrid");
			                                       $('#alertDiv').hide();
			                         		           },
			                         		error : function(e) {
			                         			console.log("ERROR: ", e);
			                         		
			                         		}
			                         	});
				 });

	 

	 

	 $('#doSalesPipeLineOperation').click(function()
			 {

				 var salesPipeline_id = $('#alertSalesPipeLineId').val();
				// var warehouse_id = $('#alertWarehousId').val();
				 //var actualFloorCarpetArea_value = $('#alertFloorCarpertArea').val();

					  $.ajax({
              		
              		type : "POST",
              		encoding : "UTF-8",
              		url : "deleteCustomer",
              		datatype :'json', 
              		data : {
              			customer_id : salesPipeline_id,
              			//warehouseId : warehouse_id,
              			//estimatedFloorCarpetArea : actualFloorCarpetArea_value,
              			        },
              		success : function(data) {
                            console.log("Marked for Deletion");
                            $("#grid2").trigger("reloadGrid");
                            $('#alertDiv').hide();
              		           },
              		error : function(e) {
              			console.log("ERROR: ", e);
              		
              		}
              	});
	              	
				 });

/* 	 $('#readinessTemplateEditStartDate').addEventListener('change', function() {
		    if (start.value)
		        end.min = start.value;
		}, false);
		$('#readinessTemplateEditEndDate').addEventLiseter('change', function() {
		    if (end.value)
		        start.max = end.value;
		}, false); */
		
		var start = document.getElementById('readinessTemplateEditStartDate');
		var end = document.getElementById('readinessTemplateEditEndDate');

		start.addEventListener('change', function() {
		    if (start.value)
		        end.min = start.value;
		}, false);
		end.addEventListener('change', function() {
		    if (end.value)
		        start.max = end.value;
		}, false);

		




		
});

/* $("#from").datepicker({ dateFormat: 'dd-mm-yy' }) */



//setInterval(dashboardValues,10000);


</script>
</head>
<body>
<!-- START PAGE CONTAINER -->
        <div class="page-container">
            
            <!-- START PAGE SIDEBAR -->
            
            <div class="page-sidebar">
                <!-- START X-NAVIGATION -->
                <ul class="x-navigation" >
                    <li class="xn-logo">
                        <a href="#"><i>A</i>GameShop</a>
                        <a href="#" class="x-navigation-control"></a>
                    </li> 
                    
                    <li class="xn-profile">
                       
                        <div class="profile">
                            
                            <div class="profile-data">
                                <div class="profile-data-name"><%=request.getAttribute("FullName")%></div>
                                <div class="profile-data-title"><%=request.getAttribute("Designation")%></div>
                            
                            </div>
                            
                        </div>                                                                        
                    </li>

				<li id="dashboardLink"><a><span class="fa fa-home"></span>
						Home</a></li>
					
				<li class="xn-openable">
					<a href="#"><span class="fa fa-money"></span> Setting</a>
						<ul>
				<li id="accountSettingLink"><a><span class="fa fa-arrows"></span>
						<span class="xn-text">Account Setting</span></a></li>
						</ul>
						</li>
						
						<li class="xn-openable">
					<a href="#"><span class="fa fa-history"></span> Inventory</a>
						<ul>
						<li id="warehouseLink"><a><span class="fa fa-desktop"></span>
								<span class="xn-text">Products</span></a></li>
						<li id="readinessLink"><a><span class="fa fa-car"></span>
								<span class="xn-text">Product Category</span></a></li>
						<li id="glassElementLink"><a><span class="fa fa-tags"></span>
								<span class="xn-text">Glass Stocks</span></a></li>
						<li id="glassCategoryLink"><a><span class="fa fa-tag"></span>
								<span class="xn-text">Glass Stock Category</span></a></li>		
					  </ul>
					   </li>
	<!-- 			<li id="readinessTemplateLink"><a><span class="fa fa-calendar"></span>
						<span class="xn-text"> Readiness Template </span></a></li> -->
						
						<li class="xn-openable">
					<a href="#"><span class="fa fa-money"></span> Reports</a>
						<ul>
				<li id="graphicalReportLink"><a><span class="fa fa-circle"></span>
						<span class="xn-text">Graphical Report</span></a></li>
						<!-- <li id="tabularReportLink" ><a><span class="fa fa-arrows-h"></span>
						<span class="xn-text">Aging Report </span></a>
						</li>
						<li id="areaReportLink"><a><span class="fa fa-gear"></span>
						<span class="xn-text">Area Report</span></a>
						
						</li> -->
						<li id="clientReportLink" ><a><span class="fa fa-gear"></span>
						<span class="xn-text">Client Report</span></a>
						
						</li>
						<!-- <li id="readinessReportLink" ><a><span class="fa fa-gear"></span>
						<span class="xn-text">Readiness Report</span></a>
						
						</li> -->
						</ul>
						</li>
						
						
				<li id="settingLink"><a><span class="fa fa-gear"></span> <span
						class="xn-text">Setting</span></a></li>

                   <li id="logoutLink"><a><span class="fa fa-sign-out "></span> <span
						class="xn-text">Logout</span></a></li>
			</ul>
				
                <!-- END X-NAVIGATION -->
            </div>
            <!-- END PAGE SIDEBAR -->
            
            <!-- PAGE CONTENT -->
            <div class="page-content">
                
                   <!-- START X-NAVIGATION VERTICAL -->
                <ul class="x-navigation x-navigation-horizontal x-navigation-panel" style="display:none;">
                    <!-- TOGGLE NAVIGATION -->
                    <li class="xn-icon-button">
                        <a href="#" class="x-navigation-minimize"><span class="fa fa-dedent"></span></a>
                    </li>
                    <!-- END TOGGLE NAVIGATION -->                    
                </ul>
                <!-- END X-NAVIGATION VERTICAL -->                     
                               
                
                
                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">
                 <!-- START WIDGETS -->       
                 <div id="dashboardDiv" style="margin-left: 30px;"> 
				 
                    <div class="row" style="margin-top: 30px;">
                        <div class="col-md-8" id="warehouseDivCount">
                            
                             <div class="widget widget-default widget-item-icon">
                                <div class="widget-item-left">
                                    <span class="fa fa-home"></span>
                                </div>                             
                                <div class="widget-data">
                                    <div class="widget-int num-count" ><input type="text" style="background:white;border:none;width:20px;" id="totalWarehouse" disabled />20</div>
                                    <div class="widget-title" style="text-transform: capitalize;">Total Clients </div>
                                    <div class="widget-subtitle"></div>
                                </div>      
                               
                            </div>  
                            
                        </div>
                        <div class="col-md-4">
                            
                            <!-- START WIDGET MESSAGES -->
                            <div class="widget widget-default widget-item-icon" >
                                <div class="widget-item-left">
                                    <span class="fa fa-user"></span>
                                </div>                             
                                <div class="widget-data">
                                    <div class="widget-int num-count"><input type="text" style="background:white;border:none;width:20px" id="totalClientsCount" disabled />20,000</div>
                                    <div class="widget-title" style="text-transform: capitalize;">Total Revenue</div>
                                    <div class="widget-subtitle"></div>
                                </div>      
                               
                            </div>                            
                            <!-- END WIDGET MESSAGES -->
                            
                        </div>
                       <!--  <div class="col-md-4">
                            
                            START WIDGET REGISTRED
                            <div class="widget widget-default widget-item-icon" >
                                <div class="widget-item-left">
                                    <span class="fa fa-database"></span>
                                </div>
                                <div class="widget-data">
                                    <div class="widget-int num-count"><input type="text"  style="background:white;border:none;width:150px;" id="totalSpaceUtilizedCount" disabled /></div>
                                    <div class="widget-title" style="text-transform: capitalize;">Total Space Utilized</div>
                                    <div class="widget-subtitle"></div>
                                </div>
                                                     
                            </div>                            
                            END WIDGET REGISTRED
                            
                        </div> -->
                      
                    </div>
                    <!-- END WIDGETS -->                    
                    
 
                    
                    
                    
                    
                    
                    <div class="row" style="display:none;">
						<div class="col-md-8">
                            
                            <!-- START SALES BLOCK -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="panel-title-box">
                                        <h3>Sales</h3>
                                        <span>Sales activity by period you selected</span>
                                    </div>                                     
                                                                 
                                    
                                </div>
                                <div class="panel-body">                                    
                                    <div class="row stacked">
                                        <div class="col-md-4">                                            
                                            <div class="progress-list">                                               
                                                <div class="pull-left"><strong>In Queue</strong></div>
                                                <div class="pull-right">75%</div>                                                
                                                <div class="progress progress-small progress-striped active">
                                                    <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">75%</div>
                                                </div>
                                            </div>
                                            <div class="progress-list">                                               
                                                <div class="pull-left"><strong>Shipped Products</strong></div>
                                                <div class="pull-right">450/500</div>                                                
                                                <div class="progress progress-small progress-striped active">
                                                    <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">90%</div>
                                                </div>
                                            </div>
                                            <div class="progress-list">                                               
                                                <div class="pull-left"><strong class="text-danger">Returned Products</strong></div>
                                                <div class="pull-right">25/500</div>                                                
                                                <div class="progress progress-small progress-striped active">
                                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 5%;">5%</div>
                                                </div>
                                            </div>
                                            <div class="progress-list">                                               
                                                <div class="pull-left"><strong class="text-warning">Progress Today</strong></div>
                                                <div class="pull-right">75/150</div>                                                
                                                <div class="progress progress-small progress-striped active">
                                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;">50%</div>
                                                </div>
                                            </div>
                                            <p><span class="fa fa-warning"></span> Data update in end of each hour. You can update it manual by pressign update button</p>
                                        </div>
                                        <div class="col-md-8">
                                            <div id="dashboard-map-seles" style="width: 100%; height: 200px"></div>
                                        </div>
                                    </div>                                    
                                </div>
                            </div>
                            <!-- END SALES BLOCK -->
                            
                        </div>
						<div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-content">
								<ul class="list-inline item-details">
									<li><a href="http://themifycloud.com/downloads/janux-premium-responsive-bootstrap-admin-dashboard-template/">Admin templates</a></li>
									<li><a href="http://themescloud.org">Bootstrap themes</a></li>
								</ul>
							</div>
						</div>
                        
                        <div class="col-md-4">
                            
                                                      
                        </div>
                    </div>
                    
                    
                    
                    <!-- START DASHBOARD CHART -->
					<div class="chart-holder" id="dashboard-area-1" style="height: 200px;"></div>
					<div class="block-full-width">
                                                                       
                    </div>                    
                </div>
                
             <%--    <div id="graphicalChartDiv" style="display:none;">
                <div class="row" >
                    <div class="col-md-12">
                    <jsp:include page="pie2.jsp" />
                    </div>
                 
                    </div>
				</div> --%>

				<div id="warehouseDiv" style="display:none;">
				
			<div class="panel-heading ui-draggable-handle" style="background-color: #1aad98;">
						<div class="row">
							<div class="col-md-2">
								<h3 class="panel-title"
									style="font-size: x-large; color: white;">Product</h3>
							</div>
							<div class="col-md-4" style="float: left;">
								<h3 id="addTitle" class="panel-title"
									style="margin-top: 5px; display: none; color: white;">Add
									Product</h3>
								<h3 id="updateTitle" class="panel-title"
									style="margin-top: 5px; display: none; color: white;">Update
									Product</h3>

							</div>

							<div class="col-md-4" style="float: right;">
								<button class="btn btn-info btn-rounded pull-right"	id="addWarehouse" style="background: white;">
									Add Product <span class="fa fa-plus fa-right"></span>
								</button>
								<button class="btn btn-info btn-rounded pull-right"	id="saveWarehouseInfo" style="background: white; display: none;">
									Save Info <span class="fa fa-save fa-right"></span>
								</button>

								<button class="btn btn-warning btn-rounded pull-right" id="updateWarehouseInfo"	style="background: white; display: none;">
									Update Info <span class="fa fa-save fa-right"></span>
								</button>

								<button class="btn btn-danger btn-rounded pull-right" id="cancelWarehouseInfo" style="background: white; display: none;">
									Cancel <span class="fa fa-undo fa-right"></span>
								</button>

							</div>

						</div>
					</div>

				<div class="panel-body"	style="background: rgba(255, 255, 255, 255);">




					<div class="row" id="viewWarehouseDiv">
					
					
						<div class="col-md-12" style="background:white;margin-bottom:170px;">
					
 <!-- START BASIC TABLE SAMPLE -->
                            <div class="panel panel-default">
                               
                                <div class="panel-body" style="padding: 22px 70px;">

										<table id="grid" class="table"></table>
										<div id="pagingDiv"></div>
                                      
										                   
                                </div>
                            </div>
                            <!-- END BASIC TABLE SAMPLE -->

						</div>


					</div>
					
						<div class="row" id="addWarehouseDiv" style="display:none;">
				
				
				
				<div class="col-md-12" style="background:white;margin-bottom:170px;">
					
 <!-- START BASIC TABLE SAMPLE -->
                            <div class="panel panel-default">
                             
                                <div class="panel-body">
                                    
                                      <form id="warehouseForm" class="form-horizontal" >
                                <div class="panel-body">                                    
                                    <div class="form-group" style="display:none;">
                                        <label class="col-md-3 control-label" style="color:black;">Warehouse Name :</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="product_id"/>
                                           
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Product Name :</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="product_name" name="warehouseName"/>
                                           
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Product Brand :</label>                                       
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="product_brand" name="floorCarpetArea"/>
                                             
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Product Rate :</label>                                        
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="product_rate" name="floorBuiltupArea"/>                                        
                                            
                                        </div>
                                    </div> 
                                    
                                     <div class="form-group">                                        
                                        <label class="col-md-3 control-label" style="color:black;">Product Quantity :</label>          
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="product_quantity" name="rackCarpetArea"/>                                        
                                            
                                        </div>
                                    </div> 
                                               
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Product Category Id :</label>
                                        <div class="col-md-9">
                                          <!--   <input type="text" value="" class="form-control" id="product_category_id2" name="rackBuiltupArea"/>                                        
                                           -->  <select class="form-control" id="product_category_id2">
                                                <option value="0">Select Category</option>
                                               
                                                
                                            </select>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                   
                                  <!--   
                                     <div class="form-group">                                        
                                        <label class="col-md-3 control-label" style="color:black;">Warehouse Address :</label>          
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="rackCarpetArea"/>                                        
                                            
                                        </div> -->
                                    </div> 
                                                                                               
                                   <!--  <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Date of birth:</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control datepicker" name="date"/>
                                            <span class="help-block">required date</span>
                                        </div>
                                    </div> -->
                                                                                                                                                             
                                </div>                                               
                                </form>
                                                                 
                                </div>
                            </div>
                            <!-- END BASIC TABLE SAMPLE -->

						</div>

						<!-- <div class="col-md-2" style="">
						
							<button class="btn btn-info btn-rounded pull-right" id="saveWarehouseInfo" style="background:white;">
								Save Info <span class="fa fa-save fa-right"></span>
							</button>
							
							<button class="btn btn-warning btn-rounded pull-right" id="updateWarehouseInfo" style="background:white;dsiplay:none;">
								Update Info <span class="fa fa-save fa-right"></span>
							</button>
							
							<br/>
							<br/><br/>
							<button class="btn btn-danger btn-rounded pull-right" id="cancelWarehouseInfo" style="background:white;">
								Cancel <span class="fa fa-undo fa-right"></span>
							</button>
							
						</div> -->
				
				
				        </div>

				</div>
				
				
					<div id="gSEDiv" style="display:none;">
				
			<div class="panel-heading ui-draggable-handle" style="background-color: #1aad98;">
						<div class="row">
							<div class="col-md-2">
								<h3 class="panel-title"
									style="font-size: x-large; color: white;">Glass Stocks</h3>
							</div>
							<div class="col-md-4" style="float: left;">
								<h3 id="addGSETitle" class="panel-title"
									style="margin-top: 5px; display: none; color: white;">Add
									Stocks</h3>
								<h3 id="updateGSETitle" class="panel-title"
									style="margin-top: 5px; display: none; color: white;">Update
									Stocks</h3>

							</div>

							<div class="col-md-4" style="float: right;">
								<button class="btn btn-info btn-rounded pull-right"	id="addGSE" style="background: white;">
									Add Stock <span class="fa fa-plus fa-right"></span>
								</button>
								<button class="btn btn-info btn-rounded pull-right"	id="saveGSEInfo" style="background: white; display: none;">
									Save Info <span class="fa fa-save fa-right"></span>
								</button>

								<button class="btn btn-warning btn-rounded pull-right" id="updateGSEInfo"	style="background: white; display: none;">
									Update Info <span class="fa fa-save fa-right"></span>
								</button>

								<button class="btn btn-danger btn-rounded pull-right" id="cancelGSEInfo" style="background: white; display: none;">
									Cancel <span class="fa fa-undo fa-right"></span>
								</button>

							</div>

						</div>
					</div>

				<div class="panel-body"	style="background: rgba(255, 255, 255, 255);">




					<div class="row" id="viewGSEDiv">
					
					
						<div class="col-md-12" style="background:white;margin-bottom:170px;">
					
 <!-- START BASIC TABLE SAMPLE -->
                            <div class="panel panel-default">
                               
                                <div class="panel-body" style="padding: 22px 70px;">

										<table id="gridGSE" class="table"></table>
										<div id="pagingDiv"></div>
                                      
										                   
                                </div>
                            </div>
                            <!-- END BASIC TABLE SAMPLE -->

						</div>


					</div>
					
						<div class="row" id="addGSEDiv" style="display:none;">
				
				
				
				<div class="col-md-12" style="background:white;margin-bottom:170px;">
					
 <!-- START BASIC TABLE SAMPLE -->
                            <div class="panel panel-default">
                             
                                <div class="panel-body">
                                    
                                      <form id="gSEForm" class="form-horizontal" >
                                <div class="panel-body">                                    
                                    <div class="form-group" style="display:none;">
                                        <label class="col-md-3 control-label" style="color:black;">Warehouse Name :</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="gse_id"/>
                                           
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Stock Value :</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="gse_value" name="gse_value"/>
                                           
                                        </div>
                                    </div>
                                    
                                               
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;"> Category :</label>
                                        <div class="col-md-9">
                                          <!--   <input type="text" value="" class="form-control" id="product_category_id2" name="rackBuiltupArea"/>                                        
                                           -->  <select class="form-control" id="gsc_id2">
                                                <option value="0">Select Category</option>
                                               
                                                
                                            </select>
                                        </div>
                                    </div>
                                    
                                </div>                                               
                                </form>
                                                                 
                                </div>
                            </div>
                            <!-- END BASIC TABLE SAMPLE -->

						</div>

				
				
				        </div>

				</div>
				
		</div>
			
			<div id="readinessDiv" style="display:none;">
				
			<div class="panel-heading ui-draggable-handle" style="background-color: #1aad98;height: 49px;">
						<div class="row">
							<div class="col-md-3">
								<h3 class="panel-title"
									style="font-size: x-large; color: white;">Product Category</h3>
							</div>
							<div class="col-md-4" style="float: left;">
								<h3 id="addRETitle" class="panel-title"
									style="margin-top: 5px; display: none; color: white;">Add
									Product Category</h3>
								<h3 id="updateRETitle" class="panel-title"
									style="margin-top: 5px; display: none; color: white;">Update
									Product Category</h3>
							</div>
							<div class="col-md-4" style="float: right;">

								<button class="btn btn-info btn-rounded pull-right"	id="addReadiness" style="background: white;">
									Add Product Category <span class="fa fa-plus fa-right"></span>
								</button>

								<button class="btn btn-info btn-rounded pull-right"	id="saveReadinessInfo" style="background: white;">
									Save Info <span class="fa fa-save fa-right"></span>
								</button>

								<button class="btn btn-warning btn-rounded pull-right" id="updateReadinessInfo"	style="background: white; dsiplay: none;">
									Update Info <span class="fa fa-save fa-right"></span>
								</button>

								<button class="btn btn-danger btn-rounded pull-right" id="cancelReadinessInfo" style="background: white;">
									Cancel <span class="fa fa-undo fa-right"></span>
								</button>

							</div>
						</div>
					</div>

				<div class="panel-body"	style="background: rgba(255, 255, 255, 255);">

					<div class="row" id="viewReadinessDiv">
					
					
						<div class="col-md-12" style="background:white;margin-bottom:170px;">
					
 <!-- START BASIC TABLE SAMPLE -->
                            <div class="panel panel-default">
                               
                                <div class="panel-body" style="padding: 22px 70px;margin-left: 200px;">

										<table id="grid3" class="table"></table>
										<div id="pagingDiv3"></div>

										                   
                                </div>
                            </div>
                            <!-- END BASIC TABLE SAMPLE -->

						</div>

					</div>
					
						<div class="row" id="addReadinessDiv" style="display:none;">
				
				
				
				<div class="col-md-12" style="background:white;margin-bottom:170px;">
					
 <!-- START BASIC TABLE SAMPLE -->
                            <div class="panel panel-default">
                             
                                <div class="panel-body">
                                    
                                      <form id="readinessForm" role="form" class="form-horizontal" action="javascript:alert('Form #validate2 submited');">
                                <div class="panel-body">                                    
                                    <div class="form-group" style="display:none;">
                                        <label class="col-md-3 control-label" style="color:black;">Readiness Id :</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="product_category_id" disabled/>
                                        </div>
                                    </div>        
                                    
                                     <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Readiness Element Name :</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="category_name" name="readinessElementName"/>
                                        </div>
                                    </div>    
                                                                                                                                      
                                </div>                                               
                                </form>
                                                                 
                                </div>
                            </div>
                            <!-- END BASIC TABLE SAMPLE -->

						</div>
				
				        </div>

				</div>
				
				
				
				</div>
			
			
			
						<div id="glassCategoryDiv" style="display:none;">
				
			<div class="panel-heading ui-draggable-handle" style="background-color: #1aad98;height: 49px;">
						<div class="row">
							<div class="col-md-3">
								<h3 class="panel-title"
									style="font-size: x-large; color: white;">Glass Stock Category</h3>
							</div>
							<div class="col-md-4" style="float: left;">
								<h3 id="addGSCTitle" class="panel-title"
									style="margin-top: 5px; display: none; color: white;">Add
									Glass Stock Category</h3>
								<h3 id="updateGSCTitle" class="panel-title"
									style="margin-top: 5px; display: none; color: white;">Update
									Glass Stock Category</h3>
							</div>
							<div class="col-md-4" style="float: right;">

								<button class="btn btn-info btn-rounded pull-right"	id="addGSC" style="background: white;">
									Add Category <span class="fa fa-plus fa-right"></span>
								</button>

								<button class="btn btn-info btn-rounded pull-right"	id="saveGSCInfo" style="background: white;">
									Save Info <span class="fa fa-save fa-right"></span>
								</button>

								<button class="btn btn-warning btn-rounded pull-right" id="updateGSCInfo"	style="background: white; dsiplay: none;">
									Update Info <span class="fa fa-save fa-right"></span>
								</button>

								<button class="btn btn-danger btn-rounded pull-right" id="cancelGSCInfo" style="background: white;">
									Cancel <span class="fa fa-undo fa-right"></span>
								</button>

							</div>
						</div>
					</div>

				<div class="panel-body"	style="background: rgba(255, 255, 255, 255);">

					<div class="row" id="viewGSCDiv">
					
					
						<div class="col-md-12" style="background:white;margin-bottom:170px;">
					
 <!-- START BASIC TABLE SAMPLE -->
                            <div class="panel panel-default">
                               
                                <div class="panel-body" style="padding: 22px 70px;margin-left: 200px;">

										<table id="gridGSC" class="table"></table>
										<div id="pagingDiv3"></div>

										                   
                                </div>
                            </div>
                            <!-- END BASIC TABLE SAMPLE -->

						</div>

					</div>
					
						<div class="row" id="addGSCDiv" style="display:none;">
				
				
				
				<div class="col-md-12" style="background:white;margin-bottom:170px;">
					
 <!-- START BASIC TABLE SAMPLE -->
                            <div class="panel panel-default">
                             
                                <div class="panel-body">
                                    
                                      <form id="gSCForm" role="form" class="form-horizontal" action="javascript:alert('Form #validate2 submited');">
                                <div class="panel-body">                                    
                                    <div class="form-group" style="display:none;">
                                        <label class="col-md-3 control-label" style="color:black;">Readiness Id :</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="gsc_id" disabled/>
                                        </div>
                                    </div>        
                                    
                                     <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Readiness Element Name :</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="gsc_name" name="gsc_name"/>
                                        </div>
                                    </div>    
                                                                                                                                      
                                </div>                                               
                                </form>
                                                                 
                                </div>
                            </div>
                            <!-- END BASIC TABLE SAMPLE -->

						</div>
				
				        </div>

				</div>
				
				
				
				</div>
			
			
			
			
			
					<div id="userModuleDiv" style="display:none;">
				
			<div class="panel-heading ui-draggable-handle" style="background-color: #1aad98;height: 49px;">
					
				<div class="row">
							<div class="col-md-4">
								<h3 class="panel-title"
									style="font-size: x-large; color: white;">User
									Module :</h3>
							</div>
							<div class="col-md-4" style="float: left;">
								<h3 id="addSPLTitle" class="panel-title" style="margin-top: 5px; display: none; color: white;">Add User</h3>
								<h3 id="updateSPLTitle" class="panel-title"	style="margin-top: 5px; display: none; color: white;">Update Customer</h3>
							</div>
							<div class="col-md-4" style="float: right;">

								<button class="btn btn-info btn-rounded pull-right"	id="addUser" style="background: white;">
									Add User <span class="fa fa-plus fa-right"></span>
								</button>

								<button class="btn btn-info btn-rounded pull-right"	id="saveSalesPipeLineInfo" style="background: white;">
									Save Info <span class="fa fa-save fa-right"></span>
								</button>

								<button class="btn btn-warning btn-rounded pull-right" id="updateSalesPipeLineInfo" style="background: white; dsiplay: none;">
									Update Info <span class="fa fa-save fa-right"></span>
								</button>
																
								<button class="btn btn-danger btn-rounded pull-right" id="cancelSalesPipeLineInfo" style="background: white;">
									Cancel <span class="fa fa-undo fa-right"></span>
								</button>
							</div>
						</div>
			
			
			
			
				</div>

				<div class="panel-body"	style="background: rgba(255, 255, 255, 255);">




					<div class="row" id="viewSalesPipeLineDiv">
					
					
						<div class="col-md-12" style="background:white;margin-bottom:170px;">
					
 <!-- START BASIC TABLE SAMPLE -->
                            <div class="panel panel-default">
                     <!--            <div class="panel-heading">
                                    <h3 class="panel-title" style="margin-top:5px;">Information</h3>
                                </div> -->
                                <div class="panel-body" style="padding: 22px 30px;">

										<table id="grid2" class="table"></table>
										<div id="pagingDiv2"></div>

										                   
                                </div>
                            </div>
                            <!-- END BASIC TABLE SAMPLE -->

						</div>


					</div>
					
						<div class="row" id="addSalesPipeLineDiv" style="display:none;">
				
				
				
				<div class="col-md-12" style="background:white;margin-bottom:170px;">
					
 <!-- START BASIC TABLE SAMPLE -->
                            <div class="panel panel-default">
                              <!--   <div class="panel-heading">
                                    <h3 id="addSPLTitle" class="panel-title" style="margin-top:5px;">Add SalesPipeLine </h3>
                                    <h3 id="updateSPLTitle" class="panel-title" style="margin-top:5px;display:none;">Update SalesPipeLine </h3>
                                </div> -->
                                
                                
                                    
                                <div class="panel-body">
                                    
                                      <form id="myForm" class="form-horizontal">
                                <div class="panel-body">                                    
                                    <div class="form-group" style="display:none;">
                                        <label class="col-md-3 control-label" style="color:black;">User :</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="customer_id"/>
                                         </div>
                                    </div>
                                    
                        
                                    
                                    
                  
                                    <div class="row">
                                <div class="col-md-6">
                                     
                                  
                                    <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">First Name :</label>                                        
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="first_name" name="first_name"/>                                        
                                          
                                        </div>
                                    </div>      
                                    
                                    <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Email-Id  :</label>                                       
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="email_id" name="email_id"/>
                                            
                                        </div>
                                    </div>              
                                     
                                                 
                                    <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Password  :</label>
                                        <div class="col-md-6">
                                            <input type="password" value="" class="form-control" id="password" name="password"/>                                        
                                          
                                        </div>
                                    </div>
                                    
                                  
                                    </form>
                                 </div>
                         
                     
                                        
                                                         </div>
                                                                                                                                                             
                                </div>                                               
                               
                                                                 
                                </div>
                            </div>
                            <!-- END BASIC TABLE SAMPLE -->

						</div>

						
				
				        </div>

				</div>
				
				
				
				</div>


				<div id="readinessTemplateDiv" style="display: none;">

					<div class="panel-heading ui-draggable-handle"
						style="background-color: #1aad98;">
						<div class="row">
							<div class="col-md-4">
								<h3 class="panel-title"
									style="font-size: x-large; color: white;">Readiness Template</h3>
							</div>
							<div class="col-md-4" style="float: left;">
								<h3 id="addRTLTitle" class="panel-title"
									style="margin-top: 5px; display: none; color: white;">Create Readiness Template
									</h3>
								<h3 id="updateRTLTitle" class="panel-title"
									style="margin-top: 5px; display: none; color: white;">Update Readiness Template</h3>

							</div>

							<div class="col-md-4" style="float: right;">
								
								<button class="btn btn-info btn-rounded pull-right"
									id="saveReadinessTemplate"
									style="background: white; display: none;">
									Save <span class="fa fa-save fa-right"></span>
								</button>

								<button class="btn btn-warning btn-rounded pull-right"
									id="updateReadinessTemplate"
									style="background: white; display: none;">
									Update <span class="fa fa-save fa-right"></span>
								</button>

								<button class="btn btn-danger btn-rounded pull-right"
									id="cancelReadinessTemplate"
									style="background: white; display: none;">
									Cancel <span class="fa fa-undo fa-right"></span>
								</button>

							</div>

						</div>
					</div>

					<div class="panel-body"
						style="background: rgba(255, 255, 255, 0.2);">




						<div class="row" id="viewReadinessTemplateDiv" style="display:none;">


							<div class="col-md-12"
								style="background: white; margin-bottom: 170px;">

										<div class="panel panel-default" style="margin-top: 50px;margin-bottom: 200px;">
                                <div class="panel-body" style="margin-top: 20px;">
                                 <div class="form-group">
											<div class="col-md-3">
												<label class="control-label text-left"
													style="font-size: medium;">Create Readiness
													Template </label>
											</div>
											<div class="col-md-1">
												<button class="btn btn-danger btn-rounded pull-right"
													id="addReadinessTemplate" style="background: white;">
													Create <span class="fa fa-file-text-o fa-right"></span>
												</button>
											</div>
											<div class="col-md-3">
												<label class="control-label text-left"
													style="font-size: medium;">Update Readiness
													Templates</label>
											</div>
											<div class="col-md-1">
												<button class="btn btn-warning btn-rounded pull-right"
													id="addReadinessTemplate" style="background: white;">
													Update <span class="fa fa-pencil fa-right"></span>
												</button>
											</div>

											<div class="col-md-3">
												<label class="control-label text-left"
													style="font-size: medium;">View Readiness Templates</label>
											</div>
											<div class="col-md-1">
												<button class="btn btn-info btn-rounded pull-right"
													id="viewReadinessTemplate" style="background: white;">
													View <span class="fa fa-pencil fa-right"></span>
												</button>
											</div>
										</div>                                    
                                        
                                        </div>
                                      
                                </div>
                            </div>


								<!-- END BASIC TABLE SAMPLE -->

							</div>


						</div>

						<div class="row" id="addReadinessTemplateDiv" style="display:none;">



							<div class="col-md-12"
								style="background: white; margin-bottom: 170px;">

								<!-- START BASIC TABLE SAMPLE -->
								<div class="panel panel-default">

									<div class="panel-body">

										<form id="jvalidate" role="form" class="form-horizontal"
											action="javascript:alert('Form #validate2 submited');">
											<div class="panel-body">
											
												<div class="form-group">
												    <div class="col-md-3">
													<label class="control-label" style="color: black;">Customer Name</label>
													</div> 
													<div class="col-md-3">
											<select class="form-control select" id="customerNameRT">
                                              <option value="0">Select Customer </option>
                                            </select>
													</div>
											
													<div class="col-md-3 control-label" style="color: black;">Readiness Elements </div>
													<div class="col-md-3">
														<select multiple class="form-control select" id="readinessElementNameRT">
                                                <option>Select Elements </option>
                                                         </select>  
													</div>
												</div>
												


											</div>
										</form>

									</div>
								</div>
								<!-- END BASIC TABLE SAMPLE -->

							</div>
						</div>

					</div>

<div id="reportRTDiv" style="display:none;">
<div class="row">

<div class="col-md-4">

<input type="text" id="reportSalesId" />

</div>

<div class="col-md-8">

<table id="gridRT" class="table"></table>
										<div id="pagingDiv5"></div>


</div>




</div>
</div>




                <div id="reportDiv" style="display:none">
                  
                  
                  		
			<div class="panel-heading ui-draggable-handle" style="background-color: #1aad98;height: 49px;">
					
				<div class="row">
							<div class="col-md-4">
								<h3 class="panel-title"
									style="font-size: x-large; color: white;">Aging Report</h3>
							</div>
							<div class="col-md-4" style="float: left;">
								</div>
							<div class="col-md-4" style="float: right;">

								
							</div>
						</div>
			
			
			
			
				</div>

				<div class="panel-body"	style="background: rgba(255, 255, 255, 255);">




					<div class="row" id="viewFilterDiv">
					
					
						<div class="col-md-12" style="background:white;margin-bottom:170px;">
					
 <!-- START BASIC TABLE SAMPLE -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title" style="margin-top:5px;">Report</h3>
                                </div> 
                                <div class="panel-body" style="padding: 22px 30px;">

										<table id="grid5" class="table"></table>
										<div id="pagingDiv5"></div>

										                   
                                </div>
                         <div class="panel-footer text-center">
                            
                                    <div class="form-group">
                                         <div class="col-md-12">
                                            <button class="btn btn-info btn-rounded" id="excelPort">Download as Excel</button>
                                      </div>
                                      </div> 
                        </div>
                            </div>
                            <!-- END BASIC TABLE SAMPLE -->

						</div>
					<!-- 	<div class="col-md-3" id="filterBox">
						 <div class="panel panel-primary">
                            <div class="panel-heading" style="background:white;">
                                <h3 class="panel-title" style="color:black;"><span class="fa fa-tasks"></span> Filter Box :</h3>                                
                                <div class="pull-right">
                                    <button class="btn btn-info btn-rounded" id="applyFilter">Apply Filter</button>
                                </div>
                            </div>
                            <div class="panel-body list-group scroll" style="height: 260px;">                                
                               
                                <div class="panel-body">                                    
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Work Status</label>  
                                        <div class="col-md-9">
                                            <select class="form-control" id="statusWorkFilter" >
                                                <option value="0">Select Status</option>
                                                <option value="wIP">Work In Progress</option>
                                                <option value="confirmed">Confirmed</option>
                                                <option value="cancel">Canceled</option>
                                            </select>
                                        </div>
                                      </div>                                                                                               
                                </div>                           
                            </div>     
                            <div class="panel-footer text-center">
                              
                            </div>                            
                        </div> 
						</div> -->


					</div>
					
						<div class="row" id="addFilterDiv" style="display:none;">
				
				
				
				<div class="col-md-12" style="background:white;margin-bottom:170px;">
					
 <!-- START BASIC TABLE SAMPLE -->
                            <div class="panel panel-default">
                              <!--   <div class="panel-heading">
                                    <h3 id="addSPLTitle" class="panel-title" style="margin-top:5px;">Add SalesPipeLine </h3>
                                    <h3 id="updateSPLTitle" class="panel-title" style="margin-top:5px;display:none;">Update SalesPipeLine </h3>
                                </div> -->
                                <div class="panel-body">
                                    
                                      <form id="jvalidate" role="form" class="form-horizontal" action="javascript:alert('Form #validate2 submited');">
                                <div class="panel-body">                                    
                                    <div class="form-group" style="display:none;">
                                        <label class="col-md-3 control-label" style="color:black;">SalesPipeLine :</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="sp_Id"/>
                                         </div>
                                    </div>
                                    
                         <div class="row">           
                         <div class="col-md-8">
                                     <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Customer Name :</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="customerName"/>
                                         
                                        </div>
                                    </div>
                                    
                                    </div>
                                    </div>
                                 
                                 <br/>
                                    <div class="row">
                                    <div class="col-md-4">
                                    
                                      <div class="btn-group bootstrap-select form-control select">
                                        <label class="col-md-7 control-label">Select Warehouse :</label>
                                        <div class="col-md-5">                                        
                                            <select class="form-control" id="allocatedWarehouse">
                                                <option value="0">Select Warehouse </option>
                                               
                                                
                                            </select>
                                              
                                        </div>
                                    </div>
                                    </div> 
                                    <div class="col-md-6">
                                    
                                      <div class="form-group">
                                        
                                      
                                           <div class="col-md-6">                                        
                                        <input type="text" class="form-control" id="availableFloor" style="color:black;" placeholder="Available Space" disabled/>
                                           <span class="help-block" style="color: #fe970a;font-weight: bolder;">Available Floor Area</span>
                                           </div>
                                          
                                           <div class="col-md-6">                                        
                                        <input type="text" class="form-control" id="availableCarpet" style="color:black;" placeholder="Available Space" disabled/>
                                          <span class="help-block" style="color: #e04b4a;font-weight: bolder;">Available Rack Area</span>
                                           </div>
                                    </div>  
                                    </div>
                                    <div class="col-md-2">
                                     <div class="form-group">
                                        <div class="col-md-12">                                        
                                            <select class="form-control select" id="statusWork" >
                                                <option value="0">Select Status</option>
                                                <option value="wIP">Work In Progress</option>
                                                <option value="confirmed">Confirmed</option>
                                                <option value="cancel">Canceled</option>
                                            </select>
                                        </div>
                                    </div>
                                    </div>
                                    </div>
                                    <br/><br/>
                                    <!-- <div class="row">
                                <div class="col-md-6">
                                     <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Estimated Floor Carpet area :</label>                                       
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="estimatedFloorCarpetArea"/>
                                            
                                        </div>
                                    </div> 
                                    
                                    <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Estimated Floor Builtup Area :</label>                                        
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="estimatedFloorBuiltupArea"/>                                        
                                          
                                        </div>
                                    </div>                   
                                   
                                     <div class="form-group">                                        
                                        <label class="col-md-6 control-label" style="color:black;">Estimated Rack Carpet area :</label>          
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="estimatedRackCarpetArea"/>                                        
                                         
                                        </div>
                                    </div>  
                                                 
                                    <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Estimated Rack Builtup area :</label>
                                        <div class="col-md-6">
                                            <input type="text" value="" class="form-control" id="estimatedRackBuiltupArea"/>                                        
                                          
                                        </div>
                                    </div>
                                    
                                  
                                    
                                     <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Estimated Start Date : </label>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control datepicker" name="date" id="estimatedStartDate"/>
                                       
                                        </div>
                                    </div>
                                 </div>
                         
                         <div class="col-md-6 actualData" id="wIP" style="display:none;">
                         <h5>Actual Space Allocated Yet to be Confirmed</h5>
                         </div>
                         
                         <div class="col-md-6 actualData" id="cancel" style="display:none;">
                         <h5>Deal Closed</h5>
                         </div>
                                        
                         <div class="col-md-6 actualData" id="confirmed">
                              
                                      <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Actuallll Floor Carpet area :</label>                                       
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="actualFloorCarpetArea"/>
                                             
                                        </div>
                                    </div>  
                                                                                                  
                                     <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Actual Floor Builtup Area :</label>                                        
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="actualFloorBuiltupArea" />                                        
                                            
                                        </div>
                                    </div>                    
                                                
                                    
                                    <div class="form-group">                                        
                                        <label class="col-md-6 control-label" style="color:black;">Actual Rack Carpet area :</label>          
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="actualRackCarpetArea" />                                        
                                         
                                        </div>
                                    </div>  
                                    
                                    <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Actual Rack Builtup area :</label>
                                        <div class="col-md-6">
                                            <input type="text" value="" class="form-control" id="actualRackBuiltupArea" />                                        
                                         
                                        </div>
                                    </div>
                                    
                                     <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Actual Start Date : </label>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control datepicker" name="date" id="actualStartDate" />
                                          
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Remark : </label>
                                        <div class="col-md-6">
                                            <textarea rows="5" cols="25" id="remark" ></textarea>
                                           
                                        </div>
                                    </div>
                                    
                                    </div>
                                    </div> -->
                                                                                                                                                             
                                </div>                                               
                                </form>
                                                                 
                                </div>
                            </div>
                            <!-- END BASIC TABLE SAMPLE -->

						</div>

						
				
				        </div>

				</div>
				
                  
                  
                  
				</div>
				

				
				<div id="areaReportDiv" style="display:none">
					<div class="panel-heading ui-draggable-handle" style="background-color: #1aad98;height: 49px;">

						<div class="row">
							<div class="col-md-4">
								<h3 class="panel-title"
									style="font-size: x-large; color: white;">Area Report</h3>
							</div>
							<div class="col-md-4" style="float: left;"></div>
							<div class="col-md-4" style="float: right;"></div>
						</div>




					</div>

					<div class="panel-body"	style="background: rgba(255, 255, 255, 255);">
                           	<div class="row" id="viewFilterDiv">
                        	<div class="col-md-12"	style="background: white; margin-bottom: 170px;">

								<!-- START BASIC TABLE SAMPLE -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title" style="margin-top: 5px;">Report</h3>
									</div>
									<div class="panel-body" style="padding: 22px 30px;">

										<table id="areaGrid" class="table"></table>
										<div id="pagingDiv5"></div>


									</div>
									<div class="panel-footer text-center">

										<div class="form-group">
											<div class="col-md-12">
												<button class="btn btn-info btn-rounded" id="excelPort">Download
													as Excel</button>
											</div>
										</div>
									</div>
								</div>
								<!-- END BASIC TABLE SAMPLE -->

							</div>



						</div>

					</div>




				</div>



	
				
				<div id="clientReportDiv" style="display:none">
					<div class="panel-heading ui-draggable-handle"
						style="background-color: #1aad98;height: 49px;">

						<div class="row">
							<div class="col-md-4">
								<h3 class="panel-title"
									style="font-size: x-large; color: white;">Client Report</h3>
							</div>
							<div class="col-md-4" style="float: left;"></div>
							<div class="col-md-4" style="float: right;"></div>
						</div>




					</div>

					<div class="panel-body"	style="background: rgba(255, 255, 255, 255);">
                           	<div class="row" id="viewFilterDiv">
                        	<div class="col-md-12"	style="background: white; margin-bottom: 170px;">

								<!-- START BASIC TABLE SAMPLE -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title" style="margin-top: 5px;">Report</h3>
									</div>
									<div class="panel-body" style="padding: 22px 30px;">

									<div class="row">
                                       <div class="col-md-2">
                                       <h3> Product : </h3> 
                                       </div>
                                       <div class="col-md-3">
                                       <select id="clientWarehouseFilter" class="form-control">
                                       </select>
                                        </div>
                                        <div class="col-md-3">
                                        <button class="btn btn-warning btn-rounded" id="clientWarehouseFilterButton">Apply Filter</button>
										</div>
										</div>
										<br/><br/>
										
										<table id="clientGrid" class="table"></table>
										<div id="pagingDiv5"></div>


									</div>
									<div class="panel-footer text-center">

										<div class="form-group">
											<div class="col-md-12">
												<button class="btn btn-info btn-rounded" id="excelPort">Download
													as Excel</button>
											</div>
										</div>
									</div>
								</div>
								<!-- END BASIC TABLE SAMPLE -->

							</div>



						</div>

					</div>




				</div>


	<div id="readinessTemplateReportDiv" style="display:none">
					<div class="panel-heading ui-draggable-handle"
						style="background-color: #1aad98;height: 49px;">

						<div class="row">
							<div class="col-md-4">
								<h3 class="panel-title"
									style="font-size: x-large; color: white;">Readiness Report</h3>
							</div>
							<div class="col-md-4" style="float: left;"></div>
							<div class="col-md-4" style="float: right;"></div>
						</div>




					</div>

					<div class="panel-body"	style="background: rgba(255, 255, 255, 255);">
                           	<div class="row" id="viewFilterDiv">
                        	<div class="col-md-12"	style="background: white; margin-bottom: 170px;">

								<!-- START BASIC TABLE SAMPLE -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title" style="margin-top: 5px;">Readiness Report</h3>
									</div>
									<div class="panel-body" style="padding: 22px 30px;">
                                       <div class="row">
                                       <div class="col-md-2">
                                       <h3> CLient Name : </h3> 
                                       </div>
                                       <div class="col-md-5">
                                       <select id="clientRTName" class="form-control"></select>
                                        </div>
                                        <div class="col-md-3">
                                        <button class="btn btn-warning btn-rounded" id="clientRTButton">Apply Filter</button>
										</div>
										</div>
										<table id="readinessTemplateReportGrid" class="table"></table>
										<div id="pagingDiv5"></div>


									</div>
									<div class="panel-footer text-center">

										<div class="form-group">
											<div class="col-md-12">
												<button class="btn btn-info btn-rounded" id="excelPort">Dowload
													as Excel</button>
											</div>
										</div>
									</div>
								</div>
								<!-- END BASIC TABLE SAMPLE -->

							</div>



						</div>

					</div>




				</div>



			</div>
                <!-- END PAGE CONTENT WRAPPER -->                
            </div>            
            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER -->
  <!-- ADD WAREHOUSE -->

		 <div id="" class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
            <div class="mb-container" style="position: static; margin-top: 50px;">
                <div class="mb-middle" style="background-color:white;">
                    <div class="mb-title"><span class="fa fa-sign-out"></span> Add Warehouse</div>
                    <div class="mb-content" style="background-color:white;">
                        <div class="block">
                                 <form id="jvalidate" role="form" class="form-horizontal" action="javascript:alert('Form #validate2 submited');">
                                <div class="panel-body">                                    
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Login:</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="login"/>
                                            <span class="help-block">min size = 2, max size = 8</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Password:</label>                                        
                                        <div class="col-md-9">
                                            <input type="password" class="form-control" name="password" id="password2"/>                                        
                                            <span class="help-block">min size = 5, max size = 10</span>
                                        </div>
                                    </div>                    
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Confirm Password:</label>                                       
                                        <div class="col-md-9">
                                            <input type="password" class="form-control" name="re-password"/>
                                            <span class="help-block">required same value as Password</span>
                                        </div>
                                    </div>               
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">E-mail:</label>
                                        <div class="col-md-9">
                                            <input type="text" value="" name="email" class="form-control"/>                                        
                                            <span class="help-block">required email</span>
                                        </div>
                                    </div>
                                    <div class="form-group">                                        
                                        <label class="col-md-3 control-label" style="color:black;">Age:</label>          
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="age"/>                                        
                                            <span class="help-block">min size = 18, max size = 100</span>
                                        </div>
                                    </div>                                                             
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" style="color:black;">Date of birth:</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control datepicker" name="date"/>
                                            <span class="help-block">required date</span>
                                        </div>
                                    </div>
                                                                                                                           
                                    <div class="btn-group pull-right">
                                        <button class="btn btn-primary" type="button" onClick="jvalidate.resetForm();$('#gender').next('.bootstrap-select').removeClass('error').removeClass('valid')">Hide prompts</button>
                                        <button class="btn btn-primary" type="submit">Submit</button>
                                    </div>                                                                                                                          
                                </div>                                               
                                </form>
                            <!-- END JQUERY VALIDATION PLUGIN -->
                            </div>
						
						
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="pages-login.html" class="btn btn-success btn-lg">Yes</a>
                            <button class="btn btn-default btn-lg mb-control-close">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		  <!-- END PAGE ADD Warehouse -->

		
        <!-- MESSAGE BOX-->
        <div class="message-box animated fadeIn" data-sound="alert" id="logoutDiv" style="display:none;">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?</div>
                    <div class="mb-content">
                        <p>Are you sure you want to log out?</p>                    
                        <p>Press No if youwant to continue work. Press Yes to logout current user.</p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="index.jsp" class="btn btn-success btn-lg">Yes</a>
                            <a id="hideLogout" class="btn btn-default btn-lg mb-control-close">No</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		
		<!-- ERROR MESSAGE BOX-->
        <div class="message-box message-box-info animated fadeIn" data-sound="alert" id="warningDiv" style="display:none;">
            <div class="mb-container" style="width: 430px;margin-left: 430px;">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-warning"></span>Warning ?</div>
                    <div class="mb-content">
                        <p id="warningPara" style="font-size: small"></p>                    
                       
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a id="hideWarning" class="btn btn-default btn-lg mb-control-close">Okay</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	
		<!-- ALERT MESSAGE BOX-->
        <div class="message-box message-box-success animated fadeIn" data-sound="alert" id="alertDiv" style="display:none;">
            <div class="mb-container" style="width: 430px;margin-left: 430px;background: #1aad98;">
                <div class="mb-middle" style="left: 15%;">
                    <div class="mb-title" style="width: 290px;font-size: 19px;"><span class="fa fa-warning"></span>Do you want to continue ?</div>
                    <div class="mb-content">
                        <input type="text" id="alertPara" style="font-size: small;display:none;" />                    
                       
                       <input type="text" id="alertSalesPipeLineId" style="font-size: small;display:none;" />                    
                       <input type="text" id="alertWarehousId" style="font-size: small;display:none;" />                    
                       <input type="text" id="alertFloorCarpertArea" style="font-size: small;display:none;" />                    
                       
                       
                    </div>
                    <div class="mb-footer">
                        <div class="pull-left" style="margin-left: 43px;">
                            <a id="doWarehouseOperation" class="btn btn-default btn-lg mb-control-close" style="dispay:none;">Yes</a>
                        </div>
                        <div class="pull-left" style="margin-left: 43px;">
                            <a id="doReadinessOperation" class="btn btn-default btn-lg mb-control-close" style="dispay:none;">Yes</a>
                        </div>
                        
                        <div class="pull-left" style="margin-left: 43px;">
                            <a id="doGSCOperation" class="btn btn-default btn-lg mb-control-close" style="dispay:none;">Yes</a>
                        </div>
                        
                         <div class="pull-left" style="margin-left: 43px;">
                            <a id="doSalesPipeLineOperation" class="btn btn-default btn-lg mb-control-close" style="dispay:none;">Yes</a>
                        </div>
                        <div class="pull-right">
                            <a id="hideAlert" class="btn btn-default btn-lg mb-control-close">No</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		
		<div class="message-box animated fadeIn" data-sound="alert" id="readinessTemplate" style="display:none;">
            <div class="mb-container" style="background:white;width: 975px;margin-left: 206px;margin-top: -199px;height: 610px;">
                <div class="mb-middle" style="left:0.1%;background-color: #1aad98;">
                    <div class="mb-title" style="background-color: #1aad98;width: 970px;height: 70px;margin-top: -20px;margin-left: -21px;"> 
                    <div class="row">
                    <div class="col-md-6">
                    <h3 style="color: #f5f5f5;margin-left: 50px;"> Readiness Template </h3>
                    </div>
                    <div class="col-md-3">
                    <button class="btn btn-info btn-rounded " id="singleAdd" style="background: white;">Add Element</button> 
                    </div>
                    <div class="col-md-3">
                    <input type="text" id="readinessSalesPipeLineId" class="form-control" style="display:none;" disabled>
                    <button class="btn btn-info btn-rounded " id="bulkSave" style="background: white;">Save</button> 
                    <button class="btn btn-warning btn-rounded" id="bulkUpdate" style="background: white;">Update <!-- <span class="fa fa-save"></span> --></button>  
                    <button class="btn btn-danger btn-rounded" id="bulkUndo" style="background: white;">Undo <!-- <span class="fa fa-save"></span> --></button>  
                    <button class="btn btn-default btn-rounded " id="cancelReadinessTemplateDailog" style="float:right;background: white;margin-right:10px;margin-top:5px;"> Close<!-- <span class="fa fa-times"></span> --></button>
                    
                    </div>
                    
                    </div>
                    </div>
                    <div class="mb-content" style="width: 703px;">
                    <div class="row">
                    <div class="col-md-3">
                    <h5 style="color:black;font-size: medium;float:right;">Company Name : </h5>
                    </div>
                    <div class="col-md-3">
                    <input type="text" id="readinessTemplateCompanyName" class="form-control" style="font-size: medium;background: white;font-size: medium;color: black;border:white;" disabled>
                    </div>
                    <div class="col-md-7">
                    
                    </div>
                    </div>
                    <div id="addReadinessTemplateGrid" style="display:none;">
                        <table id="inlineGrid" class="table"></table>
										<div id="pagingDiv4"></div>
                        </div>
                       <div id="editReadinessTemplateGrid" style="display:none;">
                        <table id="inlineEditGrid" class="table"></table>
										<div id="inlineEditPaging" style="color: white;background: #1aad98;"></div>
                        </div>   
                          
                    </div>
                    <div class="mb-footer">
                      
                    </div>
            </div>
        </div>
        </div>
        <div class="message-box animated fadeIn" data-sound="alert" id="editReadinessTemplateDiv" style="display:none;">
            <div class="mb-container" style="background:#818181;width: 930px;margin-left: 376px;margin-top: -139px;height: 0px;">
                <div class="mb-middle" style="left:0.1%;">
        <div class="panel panel-primary animated zoomIn xn-drop-left xn-panel-dragging" style="width: 470px;">
                            <div class="panel-heading" style="background:white;">
                                <h3 class="panel-title" style="color:black;display:none;" id="addReadinessOrderTitle"><span class="fa fa-tasks"></span> Add Readiness Order </h3>                                
                                 <h3 class="panel-title" style="color:black;display:none;" id="updateReadinessOrderTitle" ><span class="fa fa-tasks"></span> Update Readiness Order </h3>                                
                               <div class="pull-right">
                                    <button class="label label-warning" id="cancelReadinessOrder">X</button>
                                </div>
                            </div>
                            <div class="panel-body list-group scroll" style="height: 260px;">                                
                               
                                <div class="panel-body">                                    
                                    <form id="readinessTemplateForm">
                                    <div class="form-group" style="display:none;">
                                        <label class="col-md-3 control-label" style="color:black;">SPL Id :</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="rowNumber"/>
                                           
                                        </div>
                                    </div>
                                    
                                    <div class="form-group" style="display:none;">
                                        <label class="col-md-3 control-label" style="color:black;">SPL Id :</label>  
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="readinessTemplateEditId"/>
                                           
                                        </div>
                                    </div>
                                 
                                            
                                  <div class="form-group" style="display:none;">
                                        <label class="col-md-3 control-label" style="color:black;">SPL Id :</label>  
                                        <div class="col-md-9">
                                                <select class="form-control" id="elementReadiness">
                                                <option value="0">Select Elements </option>
                                            </select> 
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Element Name :</label>  
                                        <div class="col-md-6">
                                            
                                           <select class="form-control" id="readinessTemplateEditCustomerName">
                                                <option value="0">Select Elements </option>
                                            </select> 
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Readiness Quantity :</label>                                       
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="readinessTemplateEditQuantity" name="readinessTemplateEditQuantity" />
                                             
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Readiness Owner Name :</label>                                        
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="readinessTemplateEditOwnerName" name="readinessTemplateEditOwnerName"/>                                        
                                            
                                        </div>
                                    </div> 
                                    
                                     <div class="form-group">                                        
                                        <label class="col-md-6 control-label" style="color:black;">Readiness Element Status :</label>          
                                        <div class="col-md-6">
                                            <select class="form-control" id="readinessTemplateEditElementStatus" name="readinessTemplateEditElementStatus" >
                                                <option value="wIP">Work In Progress</option>
                                                <option value="confirmed">Confirmed</option>
                                                <option value="cancel">Canceled</option>
                                            </select>                                       
                                            
                                        </div>
                                    </div> 
                                    
                                               
                                    <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Readiness Start Date :</label>
                                        <div class="col-md-6">
                                            <input type="date" value="" class=" form-control" id="readinessTemplateEditStartDate" name="readinessTemplateEditStartDate"/>                                        
                                            
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-6 control-label" style="color:black;">Readiness End Date:</label>
                                        <div class="col-md-6">
                                            <input type="date" value="" class=" form-control" id="readinessTemplateEditEndDate" name="readinessTemplateEditEndDate"/>                                        
                                        </div>
                                    </div>                                                                                                                     
                                </form>
                                </div>                        
                            </div>     
                            <div class="panel-footer text-center">
                                <button class="btn btn-info btn-rounded pull-right" id="readinessTemplateEditButton" style="background: white; ">
									 <span class="fa fa-save fa-right"></span>
								</button>

								<button class="btn btn-primary btn-rounded pull-right" id="addReadinessTemplateButton" style="background: white;">
									 <span class="fa fa-save fa-right">Add</span>
								</button>
                            </div>                            
                        </div> 
		</div>
		</div>
		</div>
		
		
        <!-- END MESSAGE BOX-->

             
        
   
</body>
</html>