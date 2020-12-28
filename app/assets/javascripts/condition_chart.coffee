window.draw_graph = ->
    ctx = document.getElementById('myChart').getContext('2d')
    myChart = new Chart(ctx, {
        type: 'radar',
        data: {
          labels: [
            "睡眠時間", "睡眠の質", "食事回数", "ストレス度", "タフ度",
            "ストレスと回復のバランス", "ポジティブ度", "幸福・充実度"
          ],
          datasets: [{
            label: 'today_condition',
            backgroundColor: "rgba(0,0,80,0.4)",
            borderColor: "rgba(0,0,80,1)",
            data: gon.value
          }, {
            label: 'average_condition',
            backgroundColor: "rgba(0,255,0,0.4)",
            borderColor: "rgba(0,255,0,1)",
            data: gon.average_value           }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    })