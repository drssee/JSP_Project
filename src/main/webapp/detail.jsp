<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>${culture.getSvc_nm()}</title>

    <link rel="stylesheet" href="css/sub.css">
    <link rel="stylesheet" href="css/detail.css">
    <script src="javascript/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="common/header.jsp" flush="true"/>
<jsp:include page="common/navigation.jsp" flush="true"/>
<main id="festival_detail">
    <div class="sub_tit_line">
        <ul>
            <li class="sub_tit_home"><a href="/project">H</a></li>
            <li><a href="/project/list">행사 예약</a></li>
            <li><a href="#">행사 상세</a></li>
        </ul>
    </div>
    <!--     상세페이지 영역       -->
    <div class="container_wrap">
        <section class="detail_overview">
            <div>
                <h1>${culture.getSvc_nm()} <br>
                    <span class="detail_date">행사 기간 : ${culture.getSvc_opn_bgn_dt()} ~ ${culture.getSvc_opn_end_dt()}</span>
                </h1>
                <table id="detail_table">
                    <tr>
                        <th>대상</th>
                        <td>${culture.getUse_tgt_info()}</td>
                    </tr>
                    <tr>
                        <th>장소</th>
                        <td>${culture.getArea_nm()} ${culture.getPlace_nm()}</td>
                    </tr>
                    <tr>
                        <th>모집정원</th>
                        <td>${culture.getCapacity()}명</td>
                    </tr>
                    <tr>
                        <th>이용기간</th>
                        <td>${culture.getSvc_opn_bgn_dt()} ~ ${culture.getSvc_opn_end_dt()}</td>
                    </tr>
                    <tr>
                        <th>취소기간</th>
                        <td>${culture.getRevstd_day_nm()} ~ ${culture.getRevstd_day()}</td>
                    </tr>
                    <tr>
                        <th>이용요금 유무</th>
                        <td>${culture.getPay_ay_nm()}</td>
                    </tr>
                    <tr>
                        <th>문의전화</th>
                        <td>${culture.getTel_no()}</td>
                    </tr>
                    <tr>
                        <th>기타</th>
                        <td> </td>
                    </tr>
                </table>
            </div>
            <p class="bg"></p>
        </section>
        <section class="detail_select_date">
            <div>
                <h2>날짜 확인</h2>
                <jsp:include page="common/calendar.jsp" flush="true"/>
                <div class="calendar_desc">
                    <form action="/project/insertReservation.html" method="post">
                        <p class="select_date">
                            <strong><i class="material-icons">date_range</i> 선택한 날짜:</strong>
                            <input type="text" name="sel_y" id="cal_getYear" value=""/> /
                            <input type="text" name="sel_m" id="cal_getMonth" value=""/> /
                            <input type="text" name="sel_d" id="cal_getDay" value=""/>
                        </p>
                        <p class="select_number">
                            <strong><i class="material-icons">people</i> 이용 인원:</strong>
                            <span class="select_number_val">
                                <b>( <a>1</a> / <a>10</a> 명)</b>
                                <input type='button' onclick='count("minus")' value='-' /><input type="text" id="useNum" value="0" /><input type='button' onclick='count("plus")' value='+' />
                            </span>
                        </p>
                        <p class="btn_reservation">
                            <input type="submit" value="예약하기" />
                        </p>
                    </form>
                </div>
            </div>
        </section>
        <section class="detail_desc">
            <div>
                <h2>이용 안내</h2>
                <div id="description">
                  ${fn:replace(fn:replace(requestScope.culture.getDtlcont(), "\\r\\n", " "), "\\t", " ")}
                </div>
            </div>
        </section>
        <!--리뷰 작성-->
        <!--댓글작성/수정-->
        <section class="detail_review">
            <div>
                <h2>참여 후기</h2>
                <ul class="review_overview">
                    <li class="review_overview_left">
                        <p><strong>4.6</strong><span>/ 5.0</span></p>
                        <p class="review_stars">
                            <img src="images/star1.png" alt="star" width="50">
                            <img src="images/star1.png" alt="star" width="50">
                            <img src="images/star1.png" alt="star" width="50">
                            <img src="images/star1.png" alt="star" width="50">
                            <img src="images/star1.png" alt="star" width="50">
                        </p>
                    </li>
                    <li class="review_overview_right">
                        <ul>
                            <li><span>5점</span><span>0</span><span class="review_count">4</span></li>
                            <li><span>4점</span><span>0</span><span class="review_count">0</span></li>
                            <li><span>3점</span><span>0</span><span class="review_count">0</span></li>
                            <li><span>2점</span><span>0</span><span class="review_count">0</span></li>
                            <li><span>1점</span><span>0</span><span class="review_count">0</span></li>
                        </ul>
                    </li>
                </ul>
                <div class="review_write">
                    <div>
                        <h3>리뷰 쓰기</h3>
                        <p class="review_grade">
                            <label for="grade">평점 </label>
                            <strong class="review_write_star">
                                <span>별</span>
                                <span>별</span>
                                <span>별</span>
                                <span>별</span>
                                <span>별</span>
                            </strong>
                            <input type="text" name="grade" id="grade" placeholder="">
<%--                            <span name="grade" id="grade">ff</span>--%>
                        </p>
                    </div>
                    <p class="review_txt">
                        <textarea cols="50" rows="5" name="content" id="content" placeholder="리뷰내용"></textarea>
                        <button id="writeBtn" type="button">리뷰 등록</button>
                        <button id="modBtn" type="button" style="display: none;">리뷰 수정</button>
                    </p>

                </div>

                <!--리뷰 리스트-->
                <p class="review_default">
                    아직 등록된 리뷰가 없습니다. 지금 첫 리뷰를 작성해 보세요.
                </p>
                <div id="reviewList" data-cno="${requestScope.culture.getCno()}" data-id="${sessionScope.user}">
                    <ul>
                        <li>
                            <p class="review_list_id"><img src="images/user_default.png" alt="사용자프로필" width="35" /><span class="id">jinkyeong1004</span></p>

                            <div>
                                <p class="review_list_grade"><span class="grade"><img src="images/star1.png" alt="star"></span></p>
                                <p class="review_list_date"><span class="date">2022-10-21</span></p>
                            </div>
                            <p class="review_list_content"><span class="content">아주 좋아요. 재미있어요.</span></p>
                            <p class="btn_wrap">
                                <button class="modBtn">수정</button>
                                <button class="delBtn">삭제</button>
                            </p>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
    </div>
    <script>
        function count(type)  {
            // 결과를 표시할 element
            const resultElement = document.getElementById('useNum');
            let number = resultElement.value;

            //인원이 0~10명 사이에서만 신청 가능하도록 조정
            if(type === 'plus') {
                number = parseInt(number) + 1;
                if(number > 10){number = 10; alert('10인 이상은 단체 문의 부탁드립니다.');}
            }
            else if(type === 'minus')  {
                number = parseInt(number) - 1;
                if(number < 0){number = 0;}
            }

            // 결과 출력
            resultElement.value = number;
        }
        $(document).ready(function(){
            let data_cno = $("#reviewList").attr("data-cno");
            let data_id = $("#reviewList").attr("data-id");
            //u d
            // 시작하면서 해당 cno의 모든 리뷰 리스트를 가져옴
            getReviews(data_cno);

            //리뷰쓰기버튼 클릭이벤트
            $("#writeBtn").click(function(){
                let reviewVO = {id : data_id ,
                    cno : data_cno,
                    content : $("textarea[name=content]").val(),
                    grade : $("input[name=grade]").val()
                }
                writeReview(reviewVO);
            });

            //리뷰수정버튼 클릭이벤트
            $("#reviewList").on("click",".modBtn",function(){ //아래의 클래스 modBtn클릭
                //1. writeBtn숨기고 숨겨진 #modBtn 버튼 다시 보이게
                $("#writeBtn").css("display","none");
                $("#modBtn").css("display","block");
                //2. 수정에 필요한 content,grade
                let data_cno = $("#reviewList").attr("data-cno");
                let data_content = $(this).siblings(':eq(1)').text();
                let data_grade = $(this).parent().parent().attr("data-grade");
                //3. 검증에 필요한 re_no
                let data_re_no = $(this).parent().parent().attr("data-re_no");
                //4. 현재 리뷰 내용 textarea에 표시 + 평점도 표시
                $("textarea[name=content]").val(data_content);
                $("input[name=grade]").val(data_grade);

                $("#modBtn").click(function(){
                    let reviewVO = {
                        re_no : data_re_no,
                        cno : data_cno,
                        content : $("textarea[name=content]").val(),
                        grade : $("input[name=grade]").val()
                    }
                    updateReview(reviewVO);
                })
            })//리뷰수정버튼 클릭이벤트

            //리뷰삭제버튼 클릭이벤트
            $("#reviewList").on("click",".delBtn",function(){ //아래의 클래스 modBtn클릭
                //1. 삭제,검증에 필요한 re_no
                let re_no = $(this).parent().parent().attr("data-re_no");
                //2. 목록 불러오기에 필요한 cno
                let cno = $("#reviewList").attr("data-cno");
                deleteReview(re_no,cno);
            })//리뷰삭제버튼 클릭이벤트

            $("#reviewList").on("click",".reviewPage",function(){
                //페이지를 cno와 같이 넘겨준다
                let page = $(this).text();
                getReviews2(data_cno,page);
            })//리뷰 페이징

            //별 클릭 이벤트
            $(".review_write_star span").click(function() {
                $(".review_write_star span").removeClass("on");
                $(this).addClass("on");
                $(this).prevAll("span").addClass("on");
                $("#grade").val($(this).index()+1);
            });

        }); //document.ready

        //////////////////////////////////////////////

        let getReviews = function(cno) {
            $.ajax({
                url: '/project/review?cno='+cno,
                type: 'GET',
                headers: {"content-type":"application/json"},

                success : function(result){
                    //result = pageresponse

                    if(result.total === 0){
                        $(".review_default").css("display","block");
                    } else{
                        $(".review_default").css("display","none");
                    }
                    $("#reviewList").html(toHtml(result));
                },
                error: function() {
                    alert("error");
                }
            });//ajax
        }//getReviews

        let getReviews2 = function(cno,page) {
            $.ajax({
                url: '/project/review?cno='+cno+'&page='+page,
                type: 'GET',
                headers: {"content-type":"application/json"},

                success : function(result){
                    //result = pageresponse
                    $("#reviewList").html(toHtml(result));
                },
                error: function() {
                    alert("error");
                }
            });//ajax
        }//getReviews

        let writeReview = function(reviewVO) {
            $.ajax({
                url: '/project/review',
                type: 'POST',
                headers: {"content-type":"application/json"},
                data: JSON.stringify(reviewVO),

                success : function(result) {
                    alert("리뷰 등록 성공");
                    getReviews(reviewVO.cno);
                },
                error: function() {
                    alert("error");
                }
            })//ajax
        }//writeReivew

        let updateReview = function(reviewVO) {
            alert(reviewVO.re_no)
            $.ajax({
                url: '/project/review/'+reviewVO.re_no,
                type: 'PUT',
                headers: {"content-type":"application/json"},
                data: JSON.stringify(reviewVO),

                success : function(result) {
                    alert("리뷰 수정 성공");
                    $("textarea[name=content]").val('');
                    $("input[name=grade]").val('');
                    $("#writeBtn").css("display","block");
                    $("#modBtn").css("display","none");
                    getReviews(reviewVO.cno);
                },
                error: function() {
                    alert("error");
                }
            })//ajax
        }//updateReview

        let deleteReview = function(re_no,cno) {
            $.ajax({
                url: '/project/review/'+re_no,
                type: 'DELETE',
                headers: {"content-type":"application/json"},

                success : function(result) {
                    alert("삭제 성공");
                    getReviews(cno);
                },
                error: function() {
                    alert("error");
                }
            })//ajax
        }//deleteReview

        //배열로 들어온 (js 객체를 html 문자로) 바꿔주는 함수
        let toHtml = function(pageResponse) {
            let reviews = pageResponse.pageList;
            let tmp = "<ul>";
            reviews.forEach(function(review) {
                tmp += '<li data-cno='+review.cno +' data-grade='+review.grade+' data-re_no='+review.re_no+'>'
                tmp += '<p class="review_list_id"><img src="images/user_default.png" alt="사용자프로필" width="35" /><span class="id">'+review.id+'</span></p>'
                tmp += '<div><p class="review_list_grade"><span class="grade"><img src="images/star1.png" alt="star">' + review.grade +' / </span></p>'
                tmp += '<p class="review_list_date"><span class="date">'+review.regDate+'</span></p></div>'
                tmp += '<p class="review_list_content"><span class="content">'+review.content+'</span></p>'
                tmp += '<p class="btn_wrap"><button class = "delBtn">삭제</button>'
                tmp += '<button class = "modBtn">수정</button>'
                tmp += '</p></li>'
            })//foreach
            tmp += '</ul>';
            //page nav
            if(pageResponse.showPrev){
                tmp += '[PREV]';
            }
            for(var i = pageResponse.start; i<=pageResponse.end ; i++){
                tmp += '<div class="reviewPage" style="display:inline-block; cursor: pointer;">'+i+'</div>';
            }
            if(pageResponse.showNext){
                tmp += '[NEXT]';
            }
            return tmp;
        }
    </script>
</main>
</body>
</html>
