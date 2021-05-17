 console.log(data);
  //获取选择框
  let box = document.getElementById('box');
  //箭头
  let arrow = document.getElementsByClassName('arrow')[0];
  //获取显示选择结果的文本框
  let text = document.getElementsByClassName('text');
  //定义一个空字符串接收文本
  let pro_text = '';
  let city_text = '';
  let area_text = '';
  //隐藏的选择框
  let content = document.getElementById('content');
  //获取每一个list
  let list = document.getElementsByClassName('list');
  //获取省份、城市、区县按钮
  let chosePCA = document.getElementsByClassName('chosePCA');
  //省份的li标签
  let provinceLi = document.getElementsByClassName('provinceLi');
  let cityLi = document.getElementsByClassName('cityLi');
  let areaLi = document.getElementsByClassName('areaLi');
  //获取选的省份、市、区的索引
  let provinceIndex = 0;
  let cityIndex = 0;
  //空字符串接收省市区的数据,用于动态加载
  let str_province = '';
  let str_city = '';
  let str_area = '';
  //获取重置确定两个按钮
  let btn = document.getElementsByClassName('btn');
  //获取确定后显示的文本框
  let totalConfirm = document.getElementById('totalConfirm');
  //最后需要显示的文本
  let lastText = '';
  //暂时保存最后文本
  let tempProText = '';
  let tempCityText = '';

  //点击空白处，关闭选择界面
  function close(){
    $(document).mouseup(function (e){
      var con=$('#bigOne');
      if (!con.is(e.target) && con.has(e.target).length === 0){
        content.style.display='none';
        btn[0].style.display = 'block';
        btn[1].style.display = 'block';
      }
    })
  }

  //box的点击事件，箭头更换，隐藏的盒子显示
  function boxClick() {
    box.onclick = function () {
      //如果盒子隐藏，点击则显示
      if (content.offsetParent === null) {
        content.style.display = 'block';
        arrow.className = 'iconfont icon-arrow-up arrow';
        btn[0].style.display = 'none';
        btn[1].style.display = 'none';
        showPCAList();
        for (var i = 0; i < list.length; i++) {
          if (i === 0) {
            list[i].style.display = 'block';
            chosePCA[i].classList.add('select');
          } else {
            list[i].style.display = 'none';
            chosePCA[i].classList.remove('select');
          }
        }
        if (str_province === '') {
          addProvince();
        }
      }
      //如果盒子显示，点击则隐藏
      else {
        content.style.display = 'none';
        arrow.className = 'iconfont icon-arrow-down arrow';
        btn[0].style.display = 'block';
        btn[1].style.display = 'block';
      }
    }
  }

  //根据对应的chosePCA显示对应的板块
  function showPCAList() {
    for (var i = 0; i < list.length; i++) {
      if (chosePCA[i].classList.contains('select')) {
        list[i].style.display = 'block';
      } else {
        list[i].style.display = 'none';
      }
    }
  }

  //省份、城市、区县点击事件
  function chosePCAClick() {
    for (var i = 0; i < chosePCA.length; i++) {
      chosePCA[i].onclick = function () {
        for (var k = 0; k < chosePCA.length; k++) {
          chosePCA[k].className = 'chosePCA';
        }
        this.classList.add('select');
        showPCAList();
      }
    }
  }

  //点击省市区文本的时候，显示出对应的选择板块
  function textClick() {
    for (var i = 1; i < 4; i++) {
      (function (i) {
        text[i].onclick = function (e) {
          content.style.display = 'block';
          for (var k = 0; k < 3; k++) {
            chosePCA[k].className = 'chosePCA';
            list[k].style.display = 'none';
          }
          list[i - 1].style.display = 'block';
          chosePCA[i - 1].classList.add('select');
          arrow.className = 'iconfont icon-arrow-up arrow';
          btn[0].style.display = 'none';
          btn[1].style.display = 'none';
          e.stopPropagation();
        }
      })(i)
    }
  }

  //点击省市区的时候，自动跳到下一个板块，点了省，跳到市···
  function changeClass(n) {
    if (n === 0 || n === 1) {
      chosePCA[n].classList.remove('select');
      list[n].style.display = 'none';
      chosePCA[n + 1].classList.add('select');
      list[n + 1].style.display = 'block';
    } else {
      content.style.display = 'none';
      arrow.className = 'iconfont icon-arrow-down arrow';
      btn[0].style.display = 'block';
      btn[1].style.display = 'block';
    }
  }

  //li标签的点击事件，点击后将省市区显示到文本框内
  function textShow() {
    //点省
    $(document).on("click", '.provinceLi', function () {
      //最后显示的文本获取数据
      lastText = '';
      lastText = this.innerText;
      tempProText = this.innerText;
      console.log(lastText);
      //最开始的请选择省/市/区，消失
      text[0].innerHTML = '';
      //重复点省的时候，清空市区的数据
      pro_text = '';
      city_text = '';
      area_text = '';
      text[2].innerHTML = '';
      text[3].innerHTML = '';
      pro_text = this.innerText;
      //省的数据显示到页面
      text[1].innerHTML = pro_text;
      //获取当前省的索引
      provinceIndex = this.value;
      //当前省添加选择样式
      for (var i = 0; i < provinceLi.length; i++) {
        if (i === this.value) {
          this.style.backgroundColor = '#46a4ff';
          this.style.color = '#fff';
        } else {
          provinceLi[i].style.backgroundColor = '';
          provinceLi[i].style.color = '';
        }
      }
      //根据省的索引添加市的数据
      addCity();
      console.log(provinceLi);
      //自动跳到市选择板块
      changeClass(0);
    })
    //点市
    $(document).on("click", '.cityLi', function () {
      //最后显示的文本获取数据
      lastText = tempProText;
      lastText += '/' + this.innerText;
      tempCityText = lastText;
      console.log(lastText);
      //最开始的请选择省/市/区，消失
      text[0].innerHTML = '';
      //重复点市的时候，清空区的数据
      city_text = '';
      area_text = '';
      text[3].innerHTML = '';
      city_text = '/' + this.innerText;
      //市的数据显示到页面
      text[2].innerHTML = city_text;
      //获取市的索引
      cityIndex = this.value;
      //当前市添加选择样式
      for (var i = 0; i < cityLi.length; i++) {
        if (i === this.value) {
          this.style.backgroundColor = '#46a4ff';
          this.style.color = '#fff';
        } else {
          cityLi[i].style.backgroundColor = '';
          cityLi[i].style.color = '';
        }
      }
      //根据市的索引，添加区的数据
      addArea();
      console.log(this.value);
      //自动跳到区选择板块
      changeClass(1);
    })
    //点区
    $(document).on("click", '.areaLi', function () {
      //最后显示的文本获取数据
      lastText = tempCityText
      lastText += '/' + this.innerText;
      console.log(lastText);
      //最开始的请选择省/市/区，消失
      text[0].innerHTML = '';
      //重复点区的时候，清空区的数据
      area_text = '';
      area_text = '/' + this.innerText;
      //区的数据显示到页面
      text[3].innerHTML = area_text;
      //当前区添加选择样式
      for (var i = 0; i < areaLi.length; i++) {
        if (i === this.value) {
          this.style.backgroundColor = '#46a4ff';
          this.style.color = '#fff';
        } else {
          areaLi[i].style.backgroundColor = '';
          areaLi[i].style.color = '';
        }
      }
      //选完后，自动关闭选择界面
      changeClass(2);
    })
  }

  //将省动态添加到省
  function addProvince() {
    //文本置空，防止重选的时候数据重复
    list[0].innerHTML = '';
    str_province = '';
    //读取JSON文件，获取数据
    for (var i = 0; i < data.length; i++) {
      str_province += "<li class='provinceLi' value=" + i + '>' + data[i].name + "</li>";
    }
    list[0].innerHTML = str_province;
  }

  //动态添加市区
  function addCity() {
    //文本置空，防止重选的时候数据重复
    list[1].innerHTML = '';
    str_city = '';
    list[2].innerHTML = '';
    str_area = '';
    //读取JSON文件，获取数据
    var city_data = data[provinceIndex].city;
    for (var i = 0; i < city_data.length; i++) {
      str_city += "<li class='cityLi' value=" + i + '>' + city_data[i].name + "</li>";
    }
    list[1].innerHTML = str_city;
  }

  //动态添加区县
  function addArea() {
    //文本置空，防止重选的时候数据重复
    list[2].innerHTML = '';
    str_area = '';
    //读取JSON文件，获取数据
    var area_data = data[provinceIndex].city[cityIndex].area;
    console.log(area_data);
    for (var i = 0; i < area_data.length; i++) {
      str_area += "<li class='areaLi' value=" + i + '>' + area_data[i] + "</li>";
    }
    list[2].innerHTML = str_area;
  }

  //确定和重置按钮事件
  function btnClick() {
    for (var i = 0; i < btn.length; i++) {
      (function (i) {
        btn[i].onclick = function () {
          //重置按钮
          if (i === 0) {
            text[0].innerHTML = '请选择省/市/区';
            text[1].innerHTML = '';
            text[2].innerHTML = '';
            text[3].innerHTML = '';
            pro_text = '';
            city_text = '';
            area_text = '';
            list[0].innerHTML = '';
            list[1].innerHTML = '';
            list[2].innerHTML = '';
            str_province = '';
            str_city = '';
            str_area = '';
            lastText = '';
            tempProText = '';
            tempCityText = '';
            totalConfirm.style.zIndex = '-9999';
            totalConfirm.style.opacity = '0';
          }
          //确定按钮
          else {
            totalConfirm.style.zIndex = '0';
            totalConfirm.style.opacity = '1';
            totalConfirm.value = lastText;
          }
        }
      })(i)
    }
  }

  window.onload = function () {
    boxClick();
    chosePCAClick();
    textShow();
    textClick();
    btnClick();
    close();
  }