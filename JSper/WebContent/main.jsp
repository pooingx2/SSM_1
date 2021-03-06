
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSper</title>
<!-- ace -->
<link rel="stylesheet" href="CSS/layout-default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="CSS/layout.css" type="text/css" media="screen" />
<link rel="stylesheet" href="CSS/custom.css" type="text/css" media="screen" />
<link rel="stylesheet" href="CSS/jquery-ui-1.10.1.custom.css" type="text/css" />
<link rel="shortcut icon" href="img/logo2.png" />

<!-- jquert.layout -->
<script type="text/javascript" src="JS/jquery-latest.js"></script>
<script type="text/javascript" src="JS/jquery-ui-1.10.1.custom.js"></script>
<script type="text/javascript" src="JS/jquery-ui-latest.js"></script>
<script type="text/javascript" src="JS/jquery.layout-latest.js"></script>
</head>

<body id="allpage">
	<div id="introPage" style="position:absolute; top: 0px; left: 0px; width:100%; height:100%; ">
		<img src="./img/desc_01.png" style="position:fixed; top: 130px; left: 220px; height: 25%; z-index:99"/>
		<img src="./img/desc_02.png" style="position:fixed; bottom: 200px; left: 283px; height:25%; z-index:99" />
	</div>
	<div class="outer-center">
		
		<div id="holder"></div>
 		 <!--Flowchart Div-->
 		<div class="flowBG" id="flowBG">
 			<a id="cflowBtn" href="#"> close </a>
			<div class="flowCont" id="flowCont">
			</div>
		</div>
	
		<!--diagramColor Div-->
		<div class="lineBG">
			<span style="background-color:#fff8dc; font-weight:bold"><small>Declaration</small></span>
			<span style="background-color:#ffe4e1; font-weight:bold"><small>Expression</small></span>
			<span style="background-color:#e6e6fa; font-weight:bold"><small>Anonymous</small></span>
		</div>
	 		
 		<select class="drawSelector" onChange = "javascript:selectDraw(this)">
 			  <option value="Divide">Divide</option>
			  <option value="Colorful">Depth</option>
			  <option value="Simple">Simple</option> 
		</select>
	</div>

	<div class="outer-west">
		<div class="textCode"></div>
		<div id="editor"> ${code} </div>
		<div class="findBG">
			<div>
				<input class="findInput" id="searchFor" type="text" placeholder=" Search for"></input>
				<a id="findBtn_1" href="#">Find</a>
			</div>
			<div>
				<input class="findInput" id="replaceWith" type="text" placeholder=" Replace with"></input>
				<a id="findBtn_2" href="#">Replace</a>
			</div>	
		</div>
		<div class="zoomBG">
			<div><a href="#" onClick="setSize(3); return false;">+</a></div>
 			<div><a href="#" onClick="setSize(4); return false;">-</a></div>
		</div>
		<select class="codeSelector" onChange = "javascript:selectCodeEvent(this)">
			  <option value="new" selected>New</option>
			  <option value="Random_1">Random_1</option>
			  <option value="CheckEqualSort">CheckEqualSort</option>
			  <option value="SelectionSort">SelectionSort</option>
			  <option value="QuickSort">QuickSort</option>
			  <option value="DFS">DFS</option>
			  <option value="AstarAlgorithm">AstarAlgorithm</option>
			  <option value="SimilarityValue">SimilarityValue</option>
			  <option value="AES">AES</option>
		</select>
		
		<select class="skinSelector" onChange = "javascript:selectEvent(this)">
			  <option value="ambiance">Ambiance</option>
			  <option value="chrome" selected>Chrome</option>
			  <option value="clouds">Clouds</option>
			  <option value="cobalt">Cobalt</option>
			  <option value="dawn">Dawn</option>
			  <option value="eclipse">Eclipse</option>
			  <option value="monokai">Monokai</option>
			  <option value="textmate">Textmate</option>
		</select>
		
	</div>
<!-- <div class="outer-east">Outer East</div> -->

<!-- <div class="ui-layout-north">Outer North</div> -->
	<div class="ui-layout-south">
		<a class="button" id="runBtn" href="#"> 
		<img src="img/btnRun.png" style="position: absolute; left: 102px; width: 23px; height: 23px; margin-top: 18px" />
		Run
		</a>
		<a class="button" id="findBtn" href="#"> 
		<img src="img/btnFind.png" style="left: 23px; width: 20px; height: 20px; margin-top: 20px" />
		</a>
	</div>
	<div id="dialog-modal" title="syntax error" style="font-size:16px">
		<p>
		    <span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 50px 0;"></span>
		    Your code has a syntax error..  :(
		</p>
	</div>
</body>



<!-- ace -->

<script type="text/javascript" src="JS/ace/ace.js" charset="utf-8"></script>
<script type="text/javascript" src="JS/ace/ace-controll.js" charset="utf-8"></script>
<script src="JS/raphael-min.js"></script>
<script src="JS/graffle.js"></script>
<script type="text/javascript">
	$("#runBtn").click(function userViewSub(){
		$('.lineBG').show(false);
		var eLine = $(".ace_error").length;
	if ( eLine ){ 
	$("#dialog-modal").dialog({
		modal : true,
		// buttons: {
		//   Ok: function() {
		//     $( this ).dialog( "close" );
		//   },
		// },
		height : 140,
		width : 320
		});
		} else {
		$.ajax({
		type : "POST",
		url : "main",
		   data: "option=total&code="+encodeURIComponent(editor.getValue()),
		success : function(response) {
			test_gender = [];
			console.log('succeess');
			test_ajax = jQuery.parseJSON(response);
			for ( var i = 0, length = test_ajax.fList.length; i < length; i++) {
				test_gender.push([test_ajax.fList[i].depth,test_ajax.fList[i].name,test_ajax.fList[i].parent,test_ajax.fList[i].maxLength,test_ajax.fList[i].lines,test_ajax.fList[i].code,test_ajax.fList[i].type ]);
			}
			draw_raphael(test_gender);
		},
		error : function() { console.log('error'); }
		});
	}
});


	$("#findBtn").click(function userViewSub() {
		if ($('.findBG').css('display') == 'none') {
			$('.findBG').show(false);
		} else {
			$('.findBG').hide(false);
		}
	});

	$("#findBtn_1").click(function openFindBox() {
		var a = $("#searchFor").val();
		editor.find(a);
	});

	$("#findBtn_2").click(function closeFindBox() {
		var a = $("#searchFor").val();
		b = $("#replaceWith").val();

		editor.find(a);
		editor.replace(b, a);
	});
	$("#cflowBtn").click(function closeFindBox(){
		(function(){
			$('.flowBG').hide('fast');
		})();
	});
	$(document).ready(function() {
		//$( ".flowBG" ).resizable({ handles: 'n, e, s, w' })
		
		$(window).click(function(){
			$('#introPage').hide();
		})
		
		$('.flowBG').scroll(function(){
		    $('#cflowBtn').css('top', $(this).scrollTop());
		    console.log('asdf');
		});
		
		$( ".flowBG" ).draggable({ containment: ".outer-center", handle: ".flowCont", scroll: true });
		
		// OUTER-LAYOUT
		$('body').layout({
			center__paneSelector:	".outer-center"
		,	west__paneSelector:		".outer-west"
		,	west__size:				470
		,	south__size:			80
		,   south__spacing_open:	10
		//,	south__maxSize:			80
		//,	south__minSize:			80
		,   south__fxName:           "none"
		,	south__togglerLength_open:  0
		//,	south__initClosed: true
		,	south__closable : false
		, 	south__resizable : false
		,	spacing_closed:			20 // ALL panes
		,	spacing_open:			10  // ALL panes
		});

	});

	var setSize;
	var selectEvent;
	var selectDraw;
	window.onload = function(){
		var codeBtn = document.getElementById('editor');
			codeBtn.style.fontSize='12px';
		setSize = function( n ) {
			switch (n) {
				case 1:
					scaleLarge();
					break;
				case 2:
					scaleSmall();
					break;
				case 3:
					var t  = parseFloat(codeBtn.style.fontSize);
					if(t<=16) t += 2; codeBtn.style.fontSize= t + "px" ;
					break;
				case 4:
					var t  = parseFloat(codeBtn.style.fontSize)
					if(t>10) t -= 2; codeBtn.style.fontSize= t + "px" ;
				default:
					break;
			}
				
		}
		
		selectEvent = function (selectObj) {		
			editor.setTheme("ace/theme/" + selectObj.value);
		}
		
		selectCodeEvent = function (selectObj) {	
			$.post('main', { option:"file" ,code : encodeURIComponent(selectObj.value) },
			function(data) {
				editor.setValue(data); 
				editor.gotoLine(1);
			});
		}
		
		selectDraw = function (selectValue) {
				$('.lineBG').hide(false);
			if ( selectValue.value == 'Divide'){
				$('.lineBG').show(false);
			}
			changeColor(""+selectValue.value);
		}
	}

</script>
	</html>
