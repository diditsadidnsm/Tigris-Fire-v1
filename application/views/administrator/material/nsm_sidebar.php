<div class="left-side-bar">
    <div class="brand-logo">
        <a href="index.html">
            <img src="<?= base_url() ?>/theme/vendors/images/logo-white.png" alt="" class="dark-logo">
            <img src="<?= base_url() ?>/theme/vendors/images/logo-black.png" alt="" class="light-logo">
        </a>
        <div class="close-sidebar" data-toggle="left-sidebar-close">
            <i class="ion-close-round"></i>
        </div>
    </div>
    <div class="menu-block customscroll">
        <div class="sidebar-menu">
            <ul id="accordion-menu">
                <li>
                    <a href="<?= base_url('administrator/dashboard') ?>" class="dropdown-toggle no-arrow">
                        <span class="micon dw dw-analytics-20"></span><span class="mtext">Dashboard</span>
                    </a>
                </li>
                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle">
                        <span class="micon dw dw-invoice"></span><span class="mtext"> Manage Product </span>
                    </a>
                    <ul class="submenu">
                        <li><a href="<?= base_url('administrator/category') ?>">Category</a></li>
                        <!--<li><a href="<?= base_url('administrator/sub') ?>">Sub Category</a></li>-->
                        <li><a href="<?= base_url('administrator/product') ?>">Primary</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle">
                        <span class="micon dw dw-analytics-19"></span><span class="mtext"> Manage Service </span>
                    </a>
                    <ul class="submenu">
                        <li><a href="<?= base_url('administrator/catserv') ?>">Category</a></li>
                        <!--<li><a href="<?= base_url('administrator/subserv') ?>">Sub Category</a></li>-->
                        <li><a href="<?= base_url('administrator/service') ?>">Primary</a></li>
                    </ul>
                </li>
                <li>
                    <a href="<?= base_url('administrator/certificate') ?>" class="dropdown-toggle no-arrow">
                        <span class="micon dw dw-file-2"></span><span class="mtext">Manage Certificate</span>
                    </a>
                </li>
                <li>
                    <a href="<?= base_url('administrator/order') ?>" class="dropdown-toggle no-arrow">
                        <span class="micon dw dw-calendar-2"></span><span class="mtext">Manage Orders</span>
                    </a>
                </li>
                <li>
                    <a href="<?= base_url('administrator/user') ?>" class="dropdown-toggle no-arrow">
                        <span class="micon dw dw-user-13"></span><span class="mtext">Manage Users</span>
                    </a>
                </li>
                <li>
                    <a href="<?= base_url('administrator/feedback') ?>" class="dropdown-toggle no-arrow">
                        <span class="micon dw dw-mail"></span><span class="mtext">Feedback Users</span>
                    </a>
                </li>
                <li>
                    <a href="<?= base_url('/') ?>" class="dropdown-toggle no-arrow">
                        <span class="micon dw dw-house-1"></span><span class="mtext">Back to Home</span>
                    </a>
                </li>
                <li>
                    <a href="<?= base_url('logout') ?>" class="dropdown-toggle no-arrow">
                        <span class="micon dw dw-logout-2"></span><span class="mtext">Logout Account</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="mobile-menu-overlay"></div>