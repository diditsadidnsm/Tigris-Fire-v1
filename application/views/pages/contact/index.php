<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<?= base_url('/') ?>"><i class="fa fa-home"></i> Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Contact</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="map-area mt-30">
    <iframe
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d126911.71734126491!2d107.05305591141297!3d-6.264891029733982!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e698e7e55555553%3A0x39fe9eebc780614f!2sPT.%20Tigris%20Berkat%20Sejati!5e0!3m2!1sen!2sid!4v1602711622149!5m2!1sen!2sid"
        allowfullscreen></iframe>
</div>

<section class="contact-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="contact-content-area">
                    <div class="row">
                        <div class="col-12 col-md-4">
                            <div class="contact-content contact-information">
                                <h4>Contact</h4>
                                <p>sales@tigrisfire.com</p>
                                <p>081387227917</p>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="contact-content contact-information">
                                <h4>Address</h4>
                                <p>Jl. RA Kartini No. 23 E Margahyu (Sebelah Dealer Honda ) Bekasi, Indonesia 17113</p>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="contact-content contact-information">
                                <h4>Opening Hours</h4>
                                <p>8 A.M - 5 P.M</p>
                                <p>Sunday Off</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="contact-form section-padding-0-100">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading">
                    <h2>Leave A Message</h2>
                    <p>Your email address will not be published. Required fields are marked.</p>
                    <?php $this->load->view('layouts/_alert') ?>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="contact-form-area">
                    <?= form_open($form_action, ['method' => 'POST']) ?>
                        <div class="row">
                            <div class="col-12 col-lg-4">
                                <div class="form-group">
                                    <label for="contact-name">Full Name*:</label>
                                    <?= form_input('name', $input->name, ['class' => 'form-control', 'required' => true]) ?>
                                </div>
                                <?= form_error('name') ?>
                            </div>
                            <div class="col-12 col-lg-4">
                                <div class="form-group">
                                    <label for="contact-email">Email*:</label>
                                    <?= form_input(['type' => 'email', 'name' => 'email', 'value' => $input->email, 'class' => 'form-control', 'required' => true]) ?>
                                </div>
                                <?= form_error('email') ?>
                            </div>
                            <div class="col-12 col-lg-4">
                                <div class="form-group">
                                    <label for="contact-number">Phone*:</label>
                                    <?= form_input(['type' => 'number', 'name' => 'phone', 'value' => $input->phone, 'class' => 'form-control', 'required' => true]) ?>
                                </div>
                                <?= form_error('phone') ?>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="message">Message*:</label>
                                    <?= form_textarea(['name' => 'message', 'value' => $input->message, 'row' => 10, 'class' => 'form-control']) ?>
                                </div>
                                <?= form_error('message') ?>
                            </div>
                            <div class="col-12 text-center">
                                <button type="submit" class="btn crose-btn mt-15">Submit Now</button>
                            </div>
                        </div>
                    <?= form_close() ?>
                </div>
            </div>
        </div>
    </div>
</div>