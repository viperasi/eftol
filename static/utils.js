/**
 *utils
**/

/**
 * 连续输出字符串
**/
String.prototype.times = function(n) { 
  if ( n == 1 ) { 
    return this; 
  } 
  var midRes = this.times(Math.floor(n/2)); 
  midRes += midRes; 
  if ( n % 2 ) { 
    midRes += this; 
  } 
  return midRes; 
};