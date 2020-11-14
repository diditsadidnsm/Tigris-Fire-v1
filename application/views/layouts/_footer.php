<section class="subscribe-area">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-12 col-lg-6">
                <div class="subscribe-text">
                    <h3>Subscribe To Our Newsletter</h3>
                    <h6>Subcribe Us And Tell Us About Your Story</h6>
                </div>
            </div>
            <div class="col-12 col-lg-6">
                <div class="subscribe-form text-right">
                    <form action="#">
                        <input type="email" name="subscribe-email" id="subscribeEmail">
                        <button type="submit" class="btn crose-btn" disabled>subscribe</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<footer class="footer-area">
    <div class="main-footer-area">
        <div class="container">
            <div class="row">

                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-footer-widget mb-70">
                        <p>PT. Tigris Berkat Sejati menyediakan layanan perencanaan sistem kebakaran, pelaksanaan
                            instalasi sistem kebakaran dan perawatan. Menyediakan berbagai macam peralatan pemadam
                            kebakaran yang berkualitas, serta berpengalaman dalam membangun sistem
                            proteksi. </p>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-footer-widget mb-70">
                        <h5 class="widget-title">Quick Link</h5>
                        <nav class="footer-menu">
                            <ul>
                                <li><a href="<?= base_url('/') ?>"><i class="fa fa-angle-double-right"
                                            aria-hidden="true"></i> Home</a>
                                </li>
                                <li><a href="<?= base_url('/') ?>"><i class="fa fa-angle-double-right"
                                            aria-hidden="true"></i>
                                        Login</a></li>
                                <li><a href="<?= base_url('/') ?>"><i class="fa fa-angle-double-right"
                                            aria-hidden="true"></i>
                                        Registrasi</a></li>
                                <li><a href="<?= base_url('/') ?>"><i class="fa fa-angle-double-right"
                                            aria-hidden="true"></i>
                                        Product</a></li>
                                <li><a href="<?= base_url('/') ?>"><i class="fa fa-angle-double-right"
                                            aria-hidden="true"></i>
                                        About</a></li>
                                <li><a href="<?= base_url('/') ?>"><i class="fa fa-angle-double-right"
                                            aria-hidden="true"></i>
                                        Contact</a></li>
                                <li><a href="https://api.whatsapp.com/send?phone=6281315841625"><i
                                            class="fa fa-angle-double-right" aria-hidden="true"></i>
                                        WhatsApp</a></li>
                                <li><a href="https://api.whatsapp.com/send?phone=6281315841625"><i
                                            class="fa fa-angle-double-right" aria-hidden="true"></i>
                                        Konsultasi</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-footer-widget mb-70">
                        <h5 class="widget-title">Product Latest</h5>
                        <?php foreach (getHome() as $product) : ?>
                        <div class="single-latest-news">
                            <a href="<?= base_url("/shop/detail/$product->slug") ?>"><?= $product->title ?></a>
                        </div>
                        <?php endforeach ?>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-footer-widget mb-70">
                        <h5 class="widget-title">Contact Us</h5>

                        <div class="contact-information">
                            <p><i class="fa fa-map-marker" aria-hidden="true"></i> Jl. RA Kartini No. 23 E Margahyu</p>
                            <a href="callto:0813-1584-1625"><i class="fa fa-phone" aria-hidden="true"></i>
                               0813-8722-7917</a>
                            <a href="mailto:info.deercreative@gmail.com"><i class="fa fa-envelope"
                                    aria-hidden="true"></i> sales@tigrisfire.com</a>
                            <p><i class="fa fa-clock-o" aria-hidden="true"></i> Mon - Sat: 08 AM to 05 PM</p>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="copywrite-area">
        <div class="container h-100">
            <div class="row h-100 align-items-center flex-wrap">
                <div class="col-12 col-md-6">
                    <div class="copywrite-text">
                        <p>Copyright &copy;<script>
                            document.write(new Date().getFullYear());
                            </script> PT Tigris Berkat Sejati All rights reserved</p>
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <div class="footer-social-icon">
                        <a href="https://www.facebook.com/tigrisfire/"><i class="fa fa-facebook" target="_blank"
                                aria-hidden="true"></i></a>
                        <a href="https://twitter.com/tigrisfire"><i class="fa fa-twitter" target="_blank"
                                aria-hidden="true"></i></a>
                        <a href="https://www.instagram.com/tigrisfire/"><i class="fa fa-instagram" target="_blank"
                                aria-hidden="true"></i></a>
                        <a href="https://www.youtube.com/channel/UCBVGmKr6VMxaHjpLPCL7-_w"><i class="fa fa-youtube-play"
                                target="_blank" aria-hidden="true"></i></a>
                        <a href="https://www.linkedin.com/company/tigris-fire-safety/"><i class="fa fa-linkedin"
                                target="_blank" aria-hidden="true"></i></a>
                        <a href="mailto:sales@rumahapi.com"><i class="fa fa-google-plus" target="_blank"
                                aria-hidden="true"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<script type="application/ld+json">
{
  "@context" : "http://schema.org",
  "@type" : "Organization",
  "name" : "Tigris Fire",
 "url" : "https://www.tigrisfire.com",
 "sameAs" : [
   "https://twitter.com/tigrisfire",
   "https://www.facebook.com/tigrisfire/",
   "https://www.linkedin.com/company/tigris-fire-safety/", 
   "https://www.instagram.com/tigrisfire/"
   ],
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "Grand Galaxy Park, Ruko, Jl. Rose Garden 5 No.61, RT.002/RW.017, Jaka Setia, Kec. Bekasi Sel., Kota Bks, Jawa Barat",
    "addressRegion": "ID",
    "postalCode": "17148",
    "addressCountry": "ID"
  }
}
</script>
<script src="<?= base_url(); ?>/assets/js/jquery/jquery-2.2.4.min.js"></script>
<script src="<?= base_url(); ?>/assets/js/bootstrap/popper.min.js"></script>
<script src="<?= base_url(); ?>/assets/js/bootstrap/bootstrap.min.js"></script>
<script src="<?= base_url(); ?>/assets/js/plugins/plugins.js"></script>
<script src="<?= base_url(); ?>/assets/js/sweetalert/sweet-alert.init.js"></script>
<script src="<?= base_url(); ?>/assets/js/sweetalert/sweetalert2.all.min.js"></script>
<script src="<?= base_url(); ?>/assets/js/active.js"></script>
<script type="text/javascript">
    (function () {
        var options = {
            whatsapp: "6281387227917", 
            call_to_action: "Selamat Datang di Tigris Fire", 
            position: "left", 
        };
        var proto = document.location.protocol, host = "getbutton.io", url = proto + "//static." + host;
        var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = url + '/widget-send-button/js/init.js';
        s.onload = function () { WhWidgetSendButton.init(host, proto, options); };
        var x = document.getElementsByTagName('script')[0]; x.parentNode.insertBefore(s, x);
    })();
</script>
</body>

</html>