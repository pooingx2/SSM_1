<%@page contentType="text/html; charset=utf-8"%>
<html>
	<header>
		<link rel="stylesheet" href="test.css" type="text/css" media="screen" />
		<style type="text/css" media="screen">
			#holder {
				-moz-border-radius: 10px;
				-webkit-border-radius: 10px;
				position: relative;
				top: -5%;
				width: 100%;
				height: 100%;
			}
			
			p {
				text-align: center;
			}
		</style>
		<style type="text/css" media="screen">
			#editor {
				position: relative;
				top: 0;
				right: 0;
				bottom: 0;
				left: 0;
				width: 100%;
				height : 100%;
				font-size : 11px;
			}
			
			#left_text_section {
				display: block;
				width: 25%;
				height: 100%;
				float: left;
			}
			
			#right_draw_section {
				display: block;
				width: 75%;
				height: 100%;
				float: left;
			}
		</style>
	</header>
	
	<body id="allpage">
		<div id="left_text_section">
			<div id="editor">
				function foo(items) { 
					var x = "All this is syntax highlighted"; 
					return x; 
				}
		</div>
		</div>
		<div id="right_draw_section">
			<div id="holder"></div>
		</div>
	</body>
	<script src="jquery.js"></script>
	<script
		src="http://d1n0x3qji82z53.cloudfront.net/src-min-noconflict/ace.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		var editor = ace.edit("editor");
		editor.setTheme("ace/theme/monokai");
		editor.getSession().setMode("ace/mode/javascript");
	</script>
	<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
	<script src="raphael-min.js"></script>
	<script src="graffle.js"></script>
</html>
