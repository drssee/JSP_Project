<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>행사 상세</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/reservation.css">
    <script src="javascript/calendar.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
    <script src="javascript/header_sub.js"></script>
    <main id="reservation">
        <div class="sub_tit_line">
            <ul>
                <li class="sub_tit_home"><a href="#">H</a></li>
                <li><a href="#">행사예약</a></li>
                <li><a href="#"></a></li>
            </ul>
        </div>
        <!--     상세페이지 영역       -->
        <div class="container_wrap">
            <section class="reservation_nav">
                <p>
                    <span>1</span>
                    <strong>나의 예약 정보</strong>
                </p>
                <p>
                    <span>2</span>
                    <strong>예약 완료</strong>
                </p>
                <h2>제목</h2>
            </section>
            <section class="reservation_info">
                <form action="/project/resurtReservation.jsp" method="post">
                    
                    <ul class="reservation_wrap">
                        <li class="reservation_date">
                            <h3>예약 날짜</h3>
                            <ul class="caution">
                                <li>유의사항</li>
                                <li>- 원하는 날짜를 선택하세요.</li>
                                <li>- 10명 이상은 상담센터를 통해 따로 예약 신청 부탁드립니다.</li>
                            </ul>
                            <div class="calendar_wrap">
                                <table class="calendar">
                                    <thead>
                                        <tr class="calendar_tit">
                                            <td onClick="prevCalendar();" style="cursor:pointer;">&#60;&#60;</td>
                                            <td colspan="5">
                                                <span id="calYear">YYYY</span>년
                                                <span id="calMonth">MM</span>월
                                            </td>
                                            <td onClick="nextCalendar();" style="cursor:pointer;">&#62;&#62;</td>
                                        </tr>
                                        <tr class="calendar_days">
                                            <td>일</td>
                                            <td>월</td>
                                            <td>화</td>
                                            <td>수</td>
                                            <td>목</td>
                                            <td>금</td>
                                            <td>토</td>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                            <p>
                                <strong>선택한 날짜:</strong>
                                <span id="cal_getDate">2022/01/01</span>
                            </p>
                        </li>
                        <li class="reservation_num">
                            <h3>신청할 인원:</h3>
                            <p class="select_number">
                                <span>
                                    <input type='button' onclick='count("minus")' value='-' /><input type="text" id="useNum" value="0" /><input type='button' onclick='count("plus")' value='+' />
                                </span>
                            </p>
                        </li>
                        <li class="reservation_user_info">
                            <h3>신청자 정보</h3>
                            <table>
                                <tr><td>이름</td><td><input type="text"></td></tr>
                                <tr><td>전화번호</td><td><input type="text"></td></tr>
                                <tr><td>이메일</td><td><input type="text"></td></tr>
                                <tr><td>주소</td><td><input type="text"></td></tr>
                            </table>
                        </li>

                        
                    </ul>
                </form>
                
            </section>
            <section id="myInfo">
               <div>
                    <h3>나의 예약 정보</h3>
                    <ul>
                        <li class="title">한강야생탐사센터</li>
                        <li><span>이용일자</span><strong>날짜</strong></li>
                        <li><span>취소기간</span><strong>z</strong></li>
                    </ul>
                    <p class="btn_reservation"><input type="submit" value="예약하기" /></p>
                </div>
            </section>
        </div>
    </main>

</body></html>