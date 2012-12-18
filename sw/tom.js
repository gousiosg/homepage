$(document).ready(function(){ plot(); })
var last_numwords=1073;
var numwords_vals=new Array(4888, 5257, 6050, 6770, 6913, 7340, 7405, 7775, 7875, 8514, 8959, 9144, 9330, 9624, 11732, 12056, 13239, 13633, 13633, 13633, 13633, 13793, 13793, 14188, 14839, 14839, 16266, 16266, 17423, 18260, 19216, 19216, 19860, 19972, 20654, 21607, 21607, 21607, 21607, 21607, 21607, 21607, 21607, 21607, 21607, 21607, 21607, 21607, 21607, 21607, 22658, 22643, 21153, 21938, 22419, 25791, 27879, 27879, 28181, 29390, 30174, 31486, 0);
var numwords_max=30000;
var chpr_targets="800,500,1400,10500,2000,10500,4000,1400";
var chpr_actual="769,479,1501,13695,2427,13194,5290,2174";

var simpleEncoding = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

function simpleEncode(valueArray,maxValue) {

  var chartData = ['s:'];
  for (var i = 0; i < valueArray.length; i++) {
    var currentValue = valueArray[i];
    if (!isNaN(currentValue) && currentValue >= 0) {
      chartData.push(simpleEncoding.charAt(Math.round((simpleEncoding.length-1) * currentValue / maxValue)));
    }
    else {
      chartData.push('_');
    }
  }
  return chartData.join('');
}

function plot() {
  document.getElementById('numwords').src = 'http://chart.apis.google.com/chart?' +
    'chs=300x200' +
    '&chd=' + simpleEncode(numwords_vals, numwords_max ) +
    '&cht=lc' +
    '&chxt=x,y,x' +
    '&chxr=0,0,65,5|1,0,30000,5000' +
    '&chxl=2:|Mar|Apr|May|Jun|Jul' +
    '&chtt=Total+Number+of+words';

  document.getElementById('chpr').src = 'http://chart.apis.google.com/chart?' +
    'chs=300x200'+
    '&chd=t:' + chpr_actual + '|' + chpr_targets +
    '&cht=bvs' +
    '&chxt=x,y' +
    '&chxl=0:|acks|absrt|intro|rel|meth|plat|eval|concl|' +
    '1:0|5000|11000|' +
    '&chco=4D89F9,C6D9FD' +
    '&chds=0,11000' +
    '&chtt=Progress+in+each+chapter';

  var last_prc= (last_numwords / 1000) * 100;
  document.getElementById('last').src = 'http://chart.apis.google.com/chart?' +
    'chs=200x200' +
    '&chd=t:'+ last_prc +
    '&chl=' + last_numwords +
    '&cht=gom' + 
    '&chtt=Num+Words+Added+Yesterday';
}

