<%--
  Created by IntelliJ IDEA.
  User: hidagara
  Date: 10.05.2016
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Мониторинг системы</title>
    <link rel="stylesheet" href="/resources/css/monitor.css">
    <script src="/resources/js/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highcharts/4.2.1/highcharts.js"></script>
    <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4579/darkThemeHighCharts.js"></script>
</head>
<body>


<section id="main-column" class="dashboard">
    <div id="about">
        <h1> <span>Java</span><span> Мониторинг сервера</span></h1>

    </div>
    <div id="sensorValues">
        <div class="sensor-values">
            <div class="volts">12.0</div>
            <label>RAM</label>
        </div>
        <div class="sensor-values">
            <div class="amps">0.7</div>
            <label>CPU</label>
        </div>
        <div class="sensor-values">
            <div class="moisture">1</div>
            <label>Температура</label>
        </div>
    </div>
    <div id="sensorData"></div>
</section>

<script>


    $(document).ready(function() {
        var $delay = 1000,
                vMin = 11.5,
                vMax = 14.5,
                cMin = .3,
                cMax = 2.5,
                mMin = 20,
                mMax = 50,
                totalPoints = 25,
                $voltageDisplay = $('div.volts'),
                $currentDisplay = $('div.amps'),
                $moistureDisplay = $('div.moisture');

        function getRandomInt(min, max) {
            return Math.floor(Math.random() * (max - min + 1)) + min;
        }

        function updateVoltage(value) {
            $voltageDisplay.html(value);
        }

        function updateCurrent(value) {
            $currentDisplay.html(value);
        }

        function updateMoisture(value) {
            $moistureDisplay.html(value + '<span>%</span>');
        }

        function updateSensorDisplayValues(d) {
            updateVoltage(d[0]);
            updateCurrent(d[1]);
            updateMoisture(d[2]);
        }

        Highcharts.setOptions({
            global: {
                useUTC: false
            },
            plotOptions: {
                series: {
                    marker: {
                        enabled: false
                    }
                }
            },
            tooltip: {
                enabled: false
            }
        });

        $('#sensorData').highcharts({
            chart: {
                type: 'spline',
                events: {
                    load: function() {
                        var voltage = this.series[0];
                        var current = this.series[1];
                        var moisture = this.series[2];
                        var x, volts, amps, mPercent;

                        // faking sensor data
                        // data will be coming from sensors on the MKR1000
                        setInterval(function() {
                            x = (new Date()).getTime(),
                                    volts = getRandomInt(vMin, vMax),
                                    amps = getRandomInt(cMin, cMax),
                                    mPercent = getRandomInt(mMin, mMax);

                            voltage.addPoint([x, volts], false, true);
                            current.addPoint([x, amps], false, true);
                            moisture.addPoint([x, mPercent], true, true);

                            updateSensorDisplayValues([volts, amps, mPercent]);
                        }, $delay);
                    }
                }
            },
            title: {
                text: 'Информация'
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 500
            },
            yAxis: [{
                title: {
                    text: 'RAM',
                    style: {
                        color: '#2b908f',
                        font: '13px sans-serif'
                    }
                },
                min: 0,
                max: 15,
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            }, {
                title: {
                    text: 'CPU',
                    style: {
                        color: '#90ee7e',
                        font: '13px sans-serif'
                    }
                },
                min: 0,
                max: 4,
                opposite: true,
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            }, {
                title: {
                    text: 'Температура',
                    style: {
                        color: '#f45b5b',
                        font: '13px sans-serif'
                    }
                },
                min: 0,
                max: 100,
                opposite: true,
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            }],
            tooltip: {
                formatter: function() {
                    var unitOfMeasurement = this.series.name === 'VOLTAGE' ? ' V' : ' A';
                    return '<b>' + this.series.name + '</b><br/>' +
                            Highcharts.numberFormat(this.y, 1) + unitOfMeasurement;
                }
            },
            legend: {
                enabled: true
            },
            exporting: {
                enabled: false
            },
            series: [{
                name: 'RAM',
                yAxis: 0,
                style: {
                    color: '#2b908f'
                },
                data: (function() {
                    // generate an array of random data
                    var data = [],
                            time = (new Date()).getTime(),
                            i;

                    for (i = -totalPoints; i <= 0; i += 1) {
                        data.push({
                            x: time + i * $delay,
                            y: getRandomInt(12, 12)
                        });
                    }
                    return data;
                }())
            }, {
                name: 'CPU',
                yAxis: 1,
                data: (function() {
                    // generate an array of random data
                    var data = [],
                            time = (new Date()).getTime(),
                            i;

                    for (i = -totalPoints; i <= 0; i += 1) {
                        data.push({
                            x: time + i * $delay,
                            y: getRandomInt(.7, .7)
                        });
                    }
                    return data;
                }())
            }, {
                name: 'Температура',
                yAxis: 2,
                data: (function() {
                    // generate an array of random data
                    var data = [],
                            time = (new Date()).getTime(),
                            i;

                    for (i = -totalPoints; i <= 0; i += 1) {
                        data.push({
                            x: time + i * $delay,
                            y: getRandomInt(1, 1)
                        });
                    }
                    return data;
                }())
            }]
        });
    });
</script>
</body>
</html>
