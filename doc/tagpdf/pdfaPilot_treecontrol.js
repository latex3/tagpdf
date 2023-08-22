/*	Add event handler and css classes to list entries to close the menu item at start
	menu:   reference of the list
	data:   string contains numbers of opened menu items
	force:  force open menu items
*/
function treeMenu_init( menu, data, force)
{
	var array = new Array( 0);
	if( null != data && "" != data) {
		array = data.match( /\d+/g);
	}
	if( null == menu) {
		return;
	}
	var items = menu.getElementsByTagName( "li");
	for( var i = 0; i < items.length; ++i) {
		if( !treeMenu_contains( treeMenu_getClasses( items[ i]), "treeMenu_opened")
		 && items[ i].getElementsByTagName( "ul").length
		  + items[ i].getElementsByTagName( "ol").length > 0) 
		{
			var classes = treeMenu_getClasses( items[ i]);
			if( array.length > 0 && i == array[ 0]) {
				classes.push( "treeMenu_opened")
			} else {
				classes.push( "treeMenu_closed")
				if( force) {
					treeMenu_toggle( classes);
				}
			}
			items[ i].className = classes.join( " ");
		}
		if( array.length > 0 && i == array[ 0]) {
			array.shift();
		}
	}
	items = menu.getElementsByTagName( "div");
	for( var i = 0; i < items.length; ++i) {
		if( items[ i].className == "treeMenu_clickable") {
            items[ i].onclick = treeMenu_handleClick;
		}
	}
}

/*	Perform click events on menu items (open and close items)
	event:  the event object
*/
function treeMenu_handleClick( event)
{
	if( event == null) { // IE workaround for missing DOM support
		event = window.event;
		event.currentTarget = event.srcElement;
		while(( "div" != event.currentTarget.nodeName.toLowerCase()) || ("treeMenu_clickable" != event.currentTarget.className)) {
			event.currentTarget = event.currentTarget.parentNode;
		}
		event.cancelBubble = true;
	} else {
		event.stopPropagation();
	}
	node = event.currentTarget.parentNode;
	var array = treeMenu_getClasses( node);
	treeMenu_toggle( array);
	node.className = array.join( " ");
}

/*	Toggle menu items (open and close items)
	array:  the array
*/
function treeMenu_toggle( array)
{
	for( var i = 0; i < array.length; ++i) {
		if( "treeMenu_closed" == array[ i]) {
			array[ i] = "treeMenu_opened";
		} else if( "treeMenu_opened" == array[ i]) {
			array[ i] = "treeMenu_closed"
		} else if( "treeMenu_opened_js" == array[ i]) {
			array[ i] = "treeMenu_opened"
		}
	}
}

/*	return all assigned classes of a HTML element
	element:  HTML element
	return:   assigned classes
*/
function treeMenu_getClasses( element)
{
	if( element.className) {
		return element.className.match( /[^ \t\n\r]+/g);
	} else {
		return new Array( 0);
	}
}

/*	validate existence of special element in an array
	array:    the array
	element:  the element
	return:   true, if element found
*/
function treeMenu_contains( array, element)
{
	for( var i = 0; i < array.length; ++i) {
		if( element == array[ i]) {
			return true;
		}
	}
	return false;
}

/*	return list of numbers of all opened menu items as string
	menu:    reference of the list
	return:  the string
*/
function treeMenu_store( menu) 
{
	var result = new Array();
	if( null == menu) {
		return result.join( " ");
	}
	var items = menu.getElementsByTagName( "li");
	for( var i = 0; i < items.length; ++i) {
		if( treeMenu_contains( treeMenu_getClasses( items[ i]), "treeMenu_opened")) {
			result.push( i);
		}
	}
	return result.join( " ");
}
