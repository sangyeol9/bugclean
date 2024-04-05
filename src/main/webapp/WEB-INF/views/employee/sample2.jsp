<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <style>
  .wrapper {
    position: relative;
    width: 400px;
    height: 200px;
    -moz-user-select: none;
    -webkit-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }

  .signature-pad {
    position: absolute;
    left: 0;
    top: 0;
    width:400px;
    height:200px;
    background-color: white;
  }
  </style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- https://github.com/szimek/signature_pad -->
<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
<script>
$( function() {
  var canvas = document.getElementById('signature-pad');

   // 픽셀 비율을 고려하여 캔버스 좌표 공간을 조정합니다.
   // 모바일 장치에서 선명하게 보이도록 합니다.
   // 이것은 또한 캔버스가 지워지게 합니다.
  function resizeCanvas() {
      // 아주 이상한 이유로 100% 미만으로 축소하면,
      // 일부 브라우저는 devicePixelRatio를 1 미만으로 보고합니다.
      // 그러면 캔버스의 일부만 지워집니다.
    var ratio =  Math.max(window.devicePixelRatio || 1, 1);
    canvas.width = canvas.offsetWidth * ratio;
    canvas.height = canvas.offsetHeight * ratio;
    canvas.getContext("2d").scale(ratio, ratio);
  }

  window.onresize = resizeCanvas;
  resizeCanvas();

  var signaturePad = new SignaturePad(canvas, {
    backgroundColor: 'rgb(255, 255, 255, 0)',
    penColor: "rgb(1, 2, 3)"
  });

  document.getElementById('save-png').addEventListener('click', function () {
    if (signaturePad.isEmpty()) {
      return alert("Please provide a signature first.");
    }

    var data = signaturePad.toDataURL('image/png');
    // console.log(data);
    // window.open(data);
    $("#img01").attr('src', data);
  });

  document.getElementById('clear').addEventListener('click', function () {
    signaturePad.clear();
  });

  document.getElementById('draw').addEventListener('click', function () {
    var ctx = canvas.getContext('2d');
    console.log(ctx.globalCompositeOperation);
    ctx.globalCompositeOperation = 'source-over'; // default value
  });

  document.getElementById('erase').addEventListener('click', function () {
    var ctx = canvas.getContext('2d');
    ctx.globalCompositeOperation = 'destination-out';
  });
});
</script>
<body>
  <img src="" id="img01" src="" width=222 height="222" style="border: 1px solid black" />
  <div class="wrapper">
    <canvas id="signature-pad" class="signature-pad" width=400 height=200 style="border: 1px solid black"></canvas>
  </div>

  <button id="save-png">Save as PNG</button>
  <button id="draw">Draw</button>
  <button id="erase">Erase</button>
  <button id="clear">Clear</button>
</body>
</html>
