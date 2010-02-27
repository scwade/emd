//<![CDATA[ clock

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
    clock.innerHTML=h+":"+m+":"+s+ampm+'<br />'+(today.getMonth()+ 1)+" / "+today.getDate()+" / "+today.getFullYear();
    t=setTimeout('startTime()',500); // Repeat
  }

  // Adjust to 12hr clock
  function checkTime(i){
    if (i<10){
    		i="0" + i;
    	}
    return i;
  }

//]]> End of clock
