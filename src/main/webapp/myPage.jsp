<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link rel="stylesheet" href="css/sub.css">
    <link rel="stylesheet" href="css/myPage.css">
    <script src="javascript/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function() {

        });

    </script>
</head>

<body>
    <jsp:include page="common/header.jsp" flush="true" />
    <main id="mypage">
        <div class="sub_tit_line">
            <ul>
                <li class="sub_tit_home"><a href="#">H</a></li>
                <li><a href="#">마이페이지</a></li>
                <li><a href="#"></a></li>
            </ul>
        </div>
        <!--     상세페이지 영역       -->
        <div class="container_wrap">
            <h2 class="mypage_tit">마이페이지</h2>
            <section class="mypage_list">
                <ul>
                    <li class="on profile"><img src="images/user_default.png" alt="" />
                        <h4>김진경</h4>
                    </li>
                    <li><a href="#">회원 정보 관리</a></li>
                    <li><a href="#">예약 관리</a></li>
                    <!--                    <li><a href="#">1:1 문의 내역</a></li>-->
                </ul>
            </section>
            <section class="mypage_con">
                <!--    회원 정보 관리    -->
                <div class="mypage_user_info">
                    <h3>회원 정보 관리</h3>
                    <table>
                        <tr>
                            <td>이름</td>
                            <td><input type="text" value="${}" readonly></td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td><input type="text" value="${}" readonly></td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td><input type="text" value="${}" readonly></td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td><input type="text" value="${}" readonly></td>
                        </tr>
                    </table>
                </div>
                <!--    예약 관리    -->
                <div class="mypage_reserve_info">
                    <h3>예약 내역</h3>
<!--                    여기서부터 c:foreach로 반복-->
                    <div id="my_reserve_wrap">
                        <form action="">
                            <table>
                                <tr>
                                    <td>제목</td>
                                    <td><input type="text" value="${}" readonly></td>
                                </tr>
                                <tr>
                                    <td>장소</td>
                                    <td><input type="text" value="${}" readonly></td>
                                </tr>
                                <tr>
                                    <td>예약 날짜</td>
                                    <td><input type="text" value="${}" readonly></td>
                                </tr>
                                <tr>
                                    <td>예약 인원</td>
                                    <td><input type="text" value="${}" readonly></td>
                                </tr>
                                <tr>
                                    <td>문의전화</td>
                                    <td><input type="text" value="${}" readonly></td>
                                </tr>
                            </table>
                            <p class="btn_cancel">
                                <button type="submit">예약 취소</button>
                            </p>
                        </form>
                    </div>
<!--                    여기까지 c:foreach 반복 끝-->
                </div>
            </section>

        </div>
    </main>

</body>

</html>
