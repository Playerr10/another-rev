var _____WB$wombat$assign$function_____ = function(name) {return (self._wb_wombat && self._wb_wombat.local_init && self._wb_wombat.local_init(name)) || self[name]; };
if (!self.__WB_pmw) { self.__WB_pmw = function(obj) { this.__WB_source = obj; return this; } }
{
  let window = _____WB$wombat$assign$function_____("window");
  let self = _____WB$wombat$assign$function_____("self");
  let document = _____WB$wombat$assign$function_____("document");
  let location = _____WB$wombat$assign$function_____("location");
  let top = _____WB$wombat$assign$function_____("top");
  let parent = _____WB$wombat$assign$function_____("parent");
  let frames = _____WB$wombat$assign$function_____("frames");
  let opener = _____WB$wombat$assign$function_____("opener");

function WebForm_FindFirstFocusableChild(control) {
    if (!control || !(control.tagName)) {
        return null;
    }
    var tagName = control.tagName.toLowerCase();
    if (tagName == "undefined") {
        return null;
    }
    var children = control.childNodes;
    if (children) {
        for (var i = 0; i < children.length; i++) {
            try {
                if (WebForm_CanFocus(children[i])) {
                    return children[i];
                }
                else {
                    var focused = WebForm_FindFirstFocusableChild(children[i]);
                    if (WebForm_CanFocus(focused)) {
                        return focused;
                    }
                }
            } catch (e) {
            }
        }
    }
    return null;
}
function WebForm_AutoFocus(focusId) {
    var targetControl;
    if (__nonMSDOMBrowser) {
        targetControl = document.getElementById(focusId);
    }
    else {
        targetControl = document.all[focusId];
    }
    var focused = targetControl;
    if (targetControl && (!WebForm_CanFocus(targetControl)) ) {
        focused = WebForm_FindFirstFocusableChild(targetControl);
    }
    if (focused) {
        try {
            focused.focus();
            if (__nonMSDOMBrowser) {
                focused.scrollIntoView(false);
            }
            if (window.__smartNav) {
                window.__smartNav.ae = focused.id;
            }
        }
        catch (e) {
        }
    }
}
function WebForm_CanFocus(element) {
    if (!element || !(element.tagName)) return false;
    var tagName = element.tagName.toLowerCase();
    return (!(element.disabled) &&
            (!(element.type) || element.type.toLowerCase() != "hidden") &&
            WebForm_IsFocusableTag(tagName) &&
            WebForm_IsInVisibleContainer(element)
            );
}
function WebForm_IsFocusableTag(tagName) {
    return (tagName == "input" ||
            tagName == "textarea" ||
            tagName == "select" ||
            tagName == "button" ||
            tagName == "a");
}
function WebForm_IsInVisibleContainer(ctrl) {
    var current = ctrl;
    while((typeof(current) != "undefined") && (current != null)) {
        if (current.disabled ||
            ( typeof(current.style) != "undefined" &&
            ( ( typeof(current.style.display) != "undefined" &&
                current.style.display == "none") ||
                ( typeof(current.style.visibility) != "undefined" &&
                current.style.visibility == "hidden") ) ) ) {
            return false;
        }
        if (typeof(current.parentNode) != "undefined" &&
                current.parentNode != null &&
                current.parentNode != current &&
                current.parentNode.tagName.toLowerCase() != "body") {
            current = current.parentNode;
        }
        else {
            return true;
        }
    }
    return true;
}


}
/*
     FILE ARCHIVED ON 22:40:34 Mar 04, 2012 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 07:38:54 Jul 13, 2024.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
*/
/*
playback timings (ms):
  captures_list: 0.548
  exclusion.robots: 0.025
  exclusion.robots.policy: 0.015
  esindex: 0.011
  cdx.remote: 4.97
  LoadShardBlock: 156.404 (3)
  PetaboxLoader3.datanode: 81.392 (4)
  PetaboxLoader3.resolve: 153.92 (3)
  load_resource: 82.158
*/