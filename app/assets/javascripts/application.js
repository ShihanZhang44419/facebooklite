//= require jquery
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require chartkick
//= require Chart.bundle

$(document).on('turbolinks:load', function(event) {
  var chart = Chartkick.charts['cha1'].getChartObject();
  setInterval(function(){
    var indexToUpdate = Math.round(Math.random() * 30);
    chart.data.datasets[0].data[indexToUpdate] = Math.random() * 100;
    chart.update();
  }, 1000);
});