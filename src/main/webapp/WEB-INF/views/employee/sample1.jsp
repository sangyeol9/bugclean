<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/css.css">

		</head>
		<c:import url="../temp/css.jsp"></c:import>

		<body>

			





			<c:import url="../temp/header.jsp"></c:import>
			<c:import url="../temp/sidebar.jsp"></c:import>

			<div class="content-body " style="min-height:900px;">
				<div id="signature-pad" class="m-signature-pad">
					<div class="m-signature-pad--body">
						<canvas></canvas>
					</div>
					<div class="m-signature-pad--footer">
						<div class="description">사인해 주세요~</div>
						<button type="button" class="button clear" data-action="clear">지우기</button>
						<button type="button" class="button save" data-action="save">저장</button>
					</div>
				</div>
			</div>

			<script>
				var canvas = $("#signature-pad canvas")[0]; 
				var sign = new SignaturePad(canvas, { 
					minWidth: 5, 
					maxWidth: 2, 
					penColor: "rgb(1, 2, 3)" 
				});

				$("[data-action]").on("click", function () {
					if ($(this).data("action") == "clear") { 
						sign.clear(); 
					}
					else if ($(this).data("action") == "save") {
						if (sign.isEmpty()) { alert("사인해 주세요!!");
						} else { 
							$.ajax({ 
								url: "save.jsp", 
								method: "post", 
								dataType: "json", 
								data: { sign: sign.toDataURL() }, 
								success: function (r) {
									alert("저장완료 : " + r.filename);
									sign.clear();
								},
								error: function (res) {
									console.log(res);
								}
							});
						}
					}
				});
				
				function resizeCanvas() {
					var canvas = $("#signature-pad canvas")[0];
					var ratio = Math.max(window.devicePixelRatio || 1, 1);
					canvas.width = canvas.offsetWidth * ratio;
					canvas.height = canvas.offsetHeight * ratio;
					canvas.getContext("2d").scale(ratio, ratio);
				}
				
				$(window).on("resize", function () {
					resizeCanvas();
				});
				resizeCanvas();
			</script>

			<c:import url="../temp/footer.jsp"></c:import>
			<c:import url="../temp/js.jsp"></c:import>



		</body>

		</html>