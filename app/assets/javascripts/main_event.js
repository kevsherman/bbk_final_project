// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
  $numSubEvents = $('#count').data().count;
  
  for(var i = 0; i < $numSubEvents; i++){
    $('#response_chart_'+i).highcharts({
      chart:{
        type: 'bar',
        spacing: [0,0,0,0],
        margin: [0,0,0,0],
        height: 47
      },
      credits:{
        enabled: false
      },
      title:{
        text: null
      },
      yAxis:{ 
        gridLineWidth: 0,
        minorGridLineWidth: 0,
        labels:{
          enabled:false
        },
         title:{
          text: null,
          enabled:false
        }
      },
      xAxis:{
        categories:['RSVPs'],
        labels:{
          enabled:false
        },
        minorTickLength: 0,
        tickLength: 0,
        lineWidth: 0,
        minorGridLineWidth: 0,
        lineColor: 'transparent',
        title:{
          enabled:false,
          text: null
        }
      },
      plotOptions:{
        series: {
          stacking: 'percent',
          groupPadding: -1
        }
      },
      legend:{
        enabled:false
      },
      series:[{
        name: 'No Response',
        data: [$('#response_chart_'+i).data('nilCount')],
        color: '#8D8DAD'
      },{
        name: 'Declined',
        data: [$('#response_chart_'+i).data('falseCount')],
        color: '#B22613'
      },{
        name: 'Attending',
        data: [$('#response_chart_'+1).data('trueCount')],
        color: '#13B265'
      }]
      });
  }
});