<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>SAMJO SANGSA</title>
    <link rel="icon" href="/assets/img/favicon_blue.png">
    <%@ include file="../main/include/header.jsp" %>
    <link rel="stylesheet" href="/assets/css/confirm-rqform.css">
</head>

<body>
<div id="body-wrapper">
    <%@ include file="../main/include/left-banner.jsp" %>
    <div class="rqform-container">
        <form action="/hrms/confirm/rq-cnfm" method="post">
            <div class="confirm-titleline">
                <h1>결재요청문</h1>
            </div>
            <%--        헤더 --%>
            <div class="rqform-header">
                <div class="fromEmp section">
                    <div>기안자</div>
                    <div>${login.empName}</div>
                    <input type="hidden" name="fromEmpNo" value="${login.empNo}">
                    <input type="hidden" id="conStatus" name="conStatus" value="승인대기">
                </div>
                <div class="rq-date section">
                    <div>기안일자</div>
                    <div id="write-date"></div>
                </div>
                <div class="department section">
                    <div>부서</div>
                    <div>${boss.deptName}</div>
                </div>
                <div class="dept-head section">
                    <div>부서장</div>
                    <div>${boss.empName}</div>
                    <input type="hidden" name="toEmpNo" value="${boss.empNo}">
                </div>
            </div>
            <%--        본문 --%>

            <div class="rqform-content-wrap">
                <div class="rqform-title">
                    <div>문서제목</div>
                    <div><label for="conTitle"></label><input id="conTitle" class="conTitle" type="text" name="conTitle"
                                                              autofocus></div>
                </div>
                <div class="rqform-content">
                    <div>내용</div>
                    <div><label for="conContent"></label><textarea id="conContent" class="conContent"
                                                                   name="conContent"></textarea></div>
                </div>
            </div>

            <%--         제출버튼 --%>
            <div class="submit">
                <div class="cancel" onclick="history.back()">작성취소</div>
                <div id="addConfirm">결재요청</div>
            </div>
            <button id="addBtn">결재요청</button>

        </form>
    </div>
</div>


<script>
    const $today = document.getElementById('write-date');

    const year = today.getFullYear(); // 년도
    const month = today.getMonth() + 1; // 월
    const date = today.getDate(); // 날짜

    $today.innerText = year + '-' + month + '-' + date;

    const $addBtn = document.getElementById('addConfirm');
    $addBtn.addEventListener('click', addConfirm);

    function addConfirm() {
        let $title = document.getElementById('conTitle').value;
        let $content = document.getElementById('conContent').value;
        if ($title.trim().length === 0) {
            alert("문서 제목을 입력해주세요");
            $title.cursor;
        } else if ($content.trim().length === 0) {
            alert("결재 요청할 내용은 필수로 입력해야 합니다");
            $title.cursor;
        } else {
            document.getElementById('addBtn').click();
        }
    }

</script>

</body>

</html>