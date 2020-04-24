Map<String, dynamic> barOption = {
  "title": {"text": 'ECharts 柱状图'},
  "tooltip": {},
  "legend": {
    "data": ['销量']
  },
  "xAxis": {
    "data": ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"]
  },
  "yAxis": {},
  "series": [
    {
      "name": '销量',
      "type": 'bar',
      "data": [5, 20, 36, 10, 10, 20]
    }
  ]
};

Map<String, dynamic> lineOption = {
  "title": {"text": 'ECharts 折线图'},
  "tooltip": {},
  "legend": {
    "data": ['销量']
  },
  "xAxis": {
    "data": ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"]
  },
  "yAxis": {},
  "series": [
    {
      "name": '销量',
      "type": 'line',
      "data": [5, 20, 36, 10, 10, 20]
    }
  ]
};

Map<String, dynamic> pieOption = {
  "title": {"text": 'ECharts 饼型图'},
  "tooltip": {},
  "legend": {
    "orient": 'vertical',
    "type": 'scroll',
    "x": 'right',
    "data": ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"]
  },
  "series": {
    "name": '销量',
    "type": 'pie',
    "data": [
      {"name": '衬衫', "value": 5},
      {"name": '羊毛衫', "value": 20},
      {"name": '雪纺衫', "value": 36},
      {"name": '裤子', "value": 10},
      {"name": '高跟鞋', "value": 10},
      {"name": '袜子', "value": 20},
    ]
  }
};

Map<String, dynamic> ringOption = {
  "title": {"text": '环形图'},
  "tooltip": {"trigger": 'item', "formatter": "{a} <br/>{b}: {c} ({d}%)"},
  "legend": {
    "orient": 'vertical',
    "x": 'right',
    "data": ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
  },
  "series": [
    {
      "name": '访问来源',
      "type": 'pie',
      "radius": ['50%', '70%'],
      "avoidLabelOverlap": false,
      "label": {
        "normal": {"show": false, "position": 'center'},
        "emphasis": {
          "show": true,
          "textStyle": {"fontSize": '30', "fontWeight": 'bold'}
        }
      },
      "labelLine": {
        "normal": {"show": false}
      },
      "data": [
        {"value": 335, "name": '直接访问'},
        {"value": 310, "name": '邮件营销'},
        {"value": 234, "name": '联盟广告'},
        {"value": 135, "name": '视频广告'},
        {"value": 1548, "name": '搜索引擎'}
      ]
    }
  ]
};
