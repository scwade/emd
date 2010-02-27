// Onload - Start

function start() {
	startTime();
}

// TWO_COLUMN_LAYOUT clock
function startTime(){

	// Use Date() reference type
	var today=new Date();
	var h=today.getHours();
	var m=today.getMinutes();
	var s=today.getSeconds();

	// add a zero in front of numbers<10
	m=checkTime(m);
	s=checkTime(s);
	if (h>11) {
		ampm = " pm";
		if ( h > 12 ) {
		  h -= 12;
		}
	}
	else {
		ampm = " am";
	}

	// Update DOM object
	var clock = document.getElementById('headerClock');
	clock.innerHTML="Date: "+(today.getMonth()+ 1)+" / "+today.getDate()+" / "+today.getFullYear()+"<br />"+"Times: "+h+":"+m+":"+s+ampm;
	t=setTimeout('startTime()',500); // Repeat
}

function checkTime(i){
	if (i<10){
  		i="0" + i;
  	}
	return i;
}

// TWO_COLUMN_LAYOUT Switch stylesheets
	
	function setStyleSheet() {
		
		var n = document.getElementById("myStyleSheet").selectedIndex;
		n++;
		
		// Disable all except persistence stylesheets
		for ( var i=0, len = document.styleSheets.length; i < len; i++ ) {

			link = document.getElementsByTagName("link")[i];
			
			// skip persistence stylesheets
			if ( link.title != "") {
				link.disabled=true;
			}
		}		

		// Enable new theme
		link = document.getElementsByTagName("link")[n];
		link.disabled=false;

		try { //Update DOM
			var status = showFilters();
		} catch (e) {
			alert("Error trying to show filters: " + e.type);
		}
	}


// Style filters

	function showFilters() {

		var sFilterArray = new Array("contentFilter", "sideFilter", "navFilter", "mainFilter", "copyFilter");
		var sResultArray = new Array();

		var i = sFilterArray.length - 1;
		var browserName = navigator.appName;
		var stackCount = 0;

		//alert("hello " + i );

		do {
			var x = document.getElementById(sFilterArray[i]);

			if ( browserName == "Microsoft Internet Explorer" ) {
				var t = x.currentStyle;
				var backgroundColor = t.backgroundColor;
				var opacity = t.filter;
			} else {
				var t = document.defaultView.getComputedStyle(x, null);
				//var backgroundColor = t.backgroundColor;
				var opacity = t.opacity;
				
				// filter and split rgb to array 
				var s = t.backgroundColor.indexOf("(");
				var l = t.backgroundColor.indexOf(")");
				var rgb = t.backgroundColor.substring(++s, l).split(",");

				// remove spaces and convert to hex 
				var red   = convertRGBToHex( rgb[0] );
				var green = convertRGBToHex( rgb[1] );
				var blue  = convertRGBToHex( rgb[2] );
				backgroundColor = "#" + red + green + blue;
			} 
			
			stackCount = sResultArray.push(opacity, backgroundColor, sFilterArray[i]);

			i--;

		} while ( i >= 0 );

		//alert(stackCount);

		// Check results
		// checkResults( sResultArray, stackCount );
		
		writeResults( sResultArray, stackCount );

		return false;

	} // end of getFilter()

	function writeResults( array, count ) {
		var obj = document.getElementById("bg");
		//alert(obj.id);
		obj.style.display="block";
		obj.style.fontSize="13px";
		obj.style.textAlign="justify";
		obj.style.margin="0px 20px";
		
		var msg = "";
		do {
			//msg += "<div style='float: left'>" + "Hello";
			
			msg += 	"<div style='float: left; margin: 0 20px;'>" +
				"<span style='color: red; font-weight: bold;'>" + "Filter: </span>"  + array[--count] + "<br />" + 
				"<span style='color: red; font-weight: bold;'>" + "BgColor: </span>" + (array[--count]).toUpperCase() + "<br />" +
				"<span style='color: red; font-weight: bold;'>" + "Opacity: </span>" + array[--count] + "<br />" +
				"</div>";
			
		} while ( count > 0 );

		//alert(msg);
		obj.innerHTML = msg;
	}


	function convertRGBToHex(n) {
		if ( isNaN(n) ) {
			return true; // Not a number
		} else {
			return parseInt(n).toString(16); // Is convertable to or is a number
		}
	}

	function checkResults( sResultArray, stackCount ) {
		do {
			alert( sResultArray.pop() );
			stackCount--;
		} while ( stackCount > 0 );
	}

