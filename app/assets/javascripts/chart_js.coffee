window.draw_chart_top = ->
  ctx = document.getElementById("myChart_top").getContext("2d");
  myChrt = new Chart(ctx, {
      type: 'radar',
      data: {
        labels: [
          "睡眠時間", "睡眠の質", "食事回数", "ストレス度", "タフ度",
          "ストレスと回復のバランス", "ポジティブ度", "幸福・充実度"
        ],
        datasets: [{
          label: '今日',
          backgroundColor: "rgba(102,204,255,0.3)",
          borderColor: "rgba(102,204,255,1)",
          data: gon.value
        }, {
          label: '平均',
          backgroundColor: "rgba(255,204,204,0.3)",
          borderColor: "rgba(255,204,204,1)",
          data: gon.average_value           }]
      },
      options: {
        scale: {
          ticks: {
              suggestedMin: 0,
              suggestedMax: 5,
              stepSize: 1
          }
        }
      }
  })

window.draw_chart_condition_index = ->
  ctx = document.getElementById("myChart_condition_index");
  myChart = new Chart(ctx, {
      type: 'line',
      data: {
          labels: gon.condition_created_at,
          datasets: [{
              label: 'スコア',
              data: gon.condition_score,
              backgroundColor: ['rgba(0,255,0,0.4)',],
              borderColor: ['rgba(0,255,0,1)',],
          }]
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                    max: 40,
                    min: 0,
                    stepSize: 4
                  }
              }]
          }
      }
  })  

window.draw_chart_record_index_line = ->
  ctx = document.getElementById("myChart_record_index_line").getContext("2d");
  myChart = new Chart(ctx, {
      type: 'line',
      data: {
          labels: gon.record_created_at,
          datasets: [{
              label: '値',
              data: gon.record_value,
              backgroundColor: ['rgba(0,255,0,0.4)',],
              borderColor: ['rgba(0,255,0,1)',],
          }]
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                    max: gon.chart_value_max,
                    min: gon.chart_value_min
                  }
              }]
          }
      }
  })  

window.draw_chart_record_index_pie = ->
  ctx = document.getElementById("myChart_record_index_pie").getContext("2d");
  myChart = new Chart(ctx, {
      type: 'pie',
      data: {
          datasets: [{
            data: gon.record_value,
            backgroundColor: [
              "#BB5179",
              "#FAFF67",
            ],
          }]
          labels: [
            '実施',
            '未実施',
          ]
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                    max: gon.chart_value_max,
                    min: gon.chart_value_min
                  }
              }]
          }
      }
  })  

