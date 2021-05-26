<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
  <!-- Subscribe container -->
  <hr>
  <div class="subscribe-container">
  <!-- test: thêm ${pageContext.request.contextPath} trước assets-->
    <img src="${pageContext.request.contextPath}/assets/image/subscribe.svg" alt="subscribe image">
    <div class="subscribe-text">
      <p>Đăng ký nhận bản tin từ eShop</p>
      <p>Đừng bỏ lỡ những sản phẩm và chương trình siêu hấp dẫn</p>
    </div>
    <form>
      <input type="text" placeholder="Địa chỉ email của bạn" name="subscribe-email" id="subscribe-input">
      <button type="button" value="Đăng ký" id="subscribe-submit">Đăng ký</button>
    </form>
  </div>
  <!-- End Subscribe container -->

  
    <footer class="footer">
      <hr>
      <div class="footer-info-container">
        <div class="footer-info-column">
          <p class="footer-info-title">Về chúng tôi</p>
          <ul>
            <li class="footer-info-item">Giới thiệu</li>
            <li class="footer-info-item">Chính sách bảo mật thông tin</li>
          </ul>
        </div>
        <div class="footer-info-column">
          <p class="footer-info-title">Hỗ trợ khách hàng</p>
          <ul>
            <li class="footer-info-item">Hướng dẫn đặt hàng</li>
            <li class="footer-info-item">Hướng dẫn thanh toán</li>
            <li class="footer-info-item">Chính sách đổi trả</li>
            <li class="footer-info-item">
              <a target="_blank" href="mailto:hotro@eshop.vn">Hỗ trợ khách hàng: hotro@eshop.vn</a>
            </li>
            <li class="footer-info-item">
              <a target="_blank" href="mailto:hotro@eshop.vn">Báo lỗi hệ thống: system@eshop.vn</a>
            </li>
            
          </ul>
        </div>
        <div class="footer-info-column">
          <p class="footer-info-title">Liên hệ</p>
          <ul>
            <li class="footer-info-item">
              <i class="fas fa-map-marker-alt"></i>
              <a target="_blank" href="https://www.google.com/maps/place/Nh%C3%A0+TC+Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+H%E1%BB%8Dc+B%C3%A1ch+Khoa+H%C3%A0+N%E1%BB%99i/@21.0026909,105.8443743,17z/data=!3m1!4b1!4m5!3m4!1s0x3135ac76a80aa08f:0x4ebcb2843f16b1c!8m2!3d21.0026909!4d105.846563">
                104 Lê Thanh Nghị, Bách Khoa, Hai Bà Trưng, Hà Nội
              </a>
            </li>
            <li class="footer-info-item">
              <i class="fas fa-phone-alt"></i>
              <a target="_blank" href="tel:0989123456">0989123456</a>
            </li>
            <li class="footer-info-item">
              <i class="fas fa-envelope"></i>
              <a target="_blank" href="mailto:eshop@gmail.com">eshop@gmail.com</a>
            </li>
            <li class="footer-info-item">
              <a target="_blank" href="#" class="footer-link-icon"><i class="fab fa-facebook-square"></i></a>
              <a target="_blank" href="#" class="footer-link-icon"><i class="fab fa-twitter-square"></i></a>
              <a target="_blank" href="#" class="footer-link-icon"><i class="fab fa-instagram-square"></i></a>
              <a target="_blank" href="#" class="footer-link-icon"><i class="fab fa-youtube-square"></i></a>
            </li>
          </ul>
        </div>
      </div>
      <hr>
      <div>Coppyright &copy; 2021, DQHT Team</div>
    </footer>
    <a id="go-to-head" onclick="topFunction()">
      <i class="fas fa-angle-up"></i>
    </a>

  <!--   <script src="assets/js/slideshow.js"></script>
    <script src="assets/js/index.js"></script>
    <script src="assets/js/scrollToTop.js"></script>
    <script src="assets/js/product.js"></script>
  </body>
  
</html> -->

<!-- test: thêm ${pageContext.request.contextPath} trước assets-->
<script src="${pageContext.request.contextPath}/assets/js/index.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scrollToTop.js"></script>