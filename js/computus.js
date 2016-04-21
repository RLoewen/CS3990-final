
var shrinkOn = 300;	// this is the maximum scrolling distance before the header shrinks





function init() {
	        window.addEventListener('scroll', function(e){
	            var distanceY = window.pageYOffset || document.documentElement.scrollTop,
	                header = document.querySelector("header"),
	                dropdown = document.getElementById("myDropdown");
	                console.log(dropdown.classList);
	            if (distanceY > shrinkOn) {
	            // scrolled far enough to shrink the header

	            	// if no dropdown is showing use smallest header otherwise use the smaller
	                if(!dropdown.classList.contains('show')){
	                	classie.add(header,"smallest");
	                	
	                }else {
	                	classie.add(header,"smaller");
	                	if(classie.has(header,"smallest"))classie.remove(header,"smallest");
	                }
	            } else {
	            // not scrolled far enough to shrink header
	            
	            	//if the dropdown is not showing make sure the regular header is used
	            	if(!dropdown.classList.contains('show')){
	                	if (classie.has(header,"smallest")) {
	                    	classie.remove(header,"smallest");
	                	}
	                	if (classie.has(header,"smaller")) {
	                    	classie.remove(header,"smaller");
	                	}
	            	}else{
	            		// dropdown is showing and the large header was showing
	            		if(classie.has(header,"smallest")){
	            			classie.remove(header,"smallest");
	            		}
	            		classie.add(header,"smaller");
	            	}
	            }
	        });
	    }
	    window.onload = init();



		/* When the user clicks on the button, 
		toggle between hiding and showing the dropdown content */
		function myFunction() {
		    
		    var header = document.querySelector("header"),
		    	dropdown = document.getElementById("myDropdown");
		    dropdown.classList.toggle("show");
		    
		    if(dropdown.classList.contains('show')){
			    if(classie.has(header,"smallest")){
			    	classie.remove(header,"smallest");
			    }
			    classie.add(header,"smaller");
			}else{
				if(classie.has(header,"smaller"))classie.remove(header,"smaller");
				classie.add(header,"smallest");
			}
		    console.log(document.getElementById("myDropdown").classList);
		}

		// Close the dropdown if the user clicks outside of it
		window.onclick = function(event) {
		  if (!event.target.matches('.btn.dropbtn')) {
		  	var header = document.querySelector("header");
		  	
		    var dropdowns = document.getElementsByClassName("dropdown-content");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
		    if(classie.has(header,"smaller"))classie.remove(header,"smaller");
		    if((window.pageYOffset || document.documentElement.scrollTop)>shrinkOn)classie.add(header,"smallest");

		  }
		}