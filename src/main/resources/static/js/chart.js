var ctx = document.getElementById("myChart");
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ['탄수화물(g)[<fmt:formatNumber value="${api3.info_CAR/1.3}" pattern=".00"/>%] ', '단백질(g)', '지방(g)', '나트륨(${api3.info_NA}mg) [<fmt:formatNumber value="${api3.info_NA/20}" pattern=".00"/>%] '],
        datasets: [{
            label: '# of Tomatoes',
            data: [${api3.info_CAR}, ${api3.info_PRO}, ${api3.info_FAT}, 0],
            backgroundColor: [
                'rgba(111, 99, 132, 0.5)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.4)',
                'rgba(44, 166, 156, 0.7)',
                'rgba(75, 192, 192, 0.2)'
            ],
            borderColor: [
                'rgba(54, 162, 235, 0)',
                'rgba(54, 162, 235, 0)',
                'rgba(54, 162, 235, 0)',
                'rgba(54, 162, 235, 0)',
                'rgba(54, 162, 235, 0)',
            ],
            borderWidth: 1
        }]
    },
    options: {
        //cutoutPercentage: 40,
        responsive: false,

    }
});