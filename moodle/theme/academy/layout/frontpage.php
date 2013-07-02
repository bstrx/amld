<?php

$hassidepre = $PAGE->blocks->region_has_content('side-pre', $OUTPUT);
$hassidepost = $PAGE->blocks->region_has_content('side-post', $OUTPUT);
$showsidepre = $hassidepre && !$PAGE->blocks->region_completely_docked('side-pre', $OUTPUT);
$showsidepost = $hassidepost && !$PAGE->blocks->region_completely_docked('side-post', $OUTPUT);

$custommenu = $OUTPUT->custom_menu();
$hascustommenu = (empty($PAGE->layout_options['nocustommenu']) && !empty($custommenu));

$bodyclasses = array();
if ($showsidepre && !$showsidepost) {
    if (!right_to_left()) {
        $bodyclasses[] = 'side-pre-only';
    }else{
        $bodyclasses[] = 'side-post-only';
    }
} else if ($showsidepost && !$showsidepre) {
    if (!right_to_left()) {
        $bodyclasses[] = 'side-post-only';
    }else{
        $bodyclasses[] = 'side-pre-only';
    }
} else if (!$showsidepost && !$showsidepre) {
    $bodyclasses[] = 'content-only';
}
if ($hascustommenu) {
    $bodyclasses[] = 'has_custom_menu';
}

echo $OUTPUT->doctype() ?>
<!-- FRONTPAGE -->
<html <?php echo $OUTPUT->htmlattributes() ?>>
<head>
    <title><?php echo $PAGE->title ?></title>
    <link rel="shortcut icon" href="<?php echo $OUTPUT->pix_url('favicon', 'theme')?>" />
    <meta name="description" content="<?php p(strip_tags(format_text($SITE->summary, FORMAT_HTML))) ?>" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    <?php echo $OUTPUT->standard_head_html() ?>
</head>
<body id="<?php p($PAGE->bodyid) ?>" class="<?php p($PAGE->bodyclasses.' '.join(' ', $bodyclasses)) ?>">
<?php echo $OUTPUT->standard_top_of_body_html() ?>

<div id="page">
    <!-- START OF HEADER -->
    <div id="page-header">

        <div id="user-login-block">
            <div id="user-login-form">
                <form action="<?php echo get_login_url() ?>" method="post" >
                    <div class="bordered">
                        <div class="form-item">
                            <input placeholder="логин" type="text" name="username" id="username" size="15" value="" maxlength="60" required>
                        </div>
                        <div class="form-item">
                            <input placeholder="пароль" type="password" name="password" id="password" size="15" value="" maxlength="128" required>
                        </div>
                        <div class="form-actions">
                            <input type="image" src="<?php echo $OUTPUT->pix_url('login', 'theme')?>">
                        </div>
                        <div class="item-list">
                            <ul>
                                <li><a href="<?php echo $CFG->wwwroot.'/login/forgot_password.php'; ?>" title="Запросить новый пароль по электронной почте.">Забыли пароль?</a></li>
                            </ul>
                        </div>
                    </div>
                </form>
                <div class="item-list">
                    <ul>
                        <li class="first"><a href="<?php echo $CFG->wwwroot.'/login/signup.php'; ?>" title="Регистрация">Регистрация</a></li>
                        <li>
                            <form action="<?php echo get_login_url() ?>" method="post" id="guestlogin">
                                <div class="guestform">
                                    <input type="hidden" name="username" value="guest">
                                    <input type="hidden" name="password" value="guest">
                                    <a href="#" class="submit-link">Зайти гостем</a>
                                </div>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="header">
            <div id="top-menu">

                <div id="login-block">
                    <img src="<?php echo $OUTPUT->pix_url('key', 'theme') ?>" width="19" height="10">
                    <?php echo $OUTPUT->login_info(); ?>
                </div>

                <?php if ($hascustommenu) { ?>
                    <div id="custommenu"><?php echo $custommenu; ?></div>
                <?php } ?>

                <?php if ($hasheading) { ?>
                <div class="headermenu">
                    <?php echo $PAGE->headingmenu; ?>
                </div>
                <?php } ?>
            </div>

            <div id="logo">
                <a href="<?php echo $CFG->wwwroot ?>">
                    <img src="<?php echo $OUTPUT->pix_url('logo', 'theme') ?>" width="364" height="108">
                </a>
            </div>
        </div>
    </div>
    <!-- END OF HEADER -->

    <div id="page-content">
        <div id="region-main-box">
            <div id="region-post-box">

                <div id="region-main-wrap">
                    <div>
                        <div id="region-main" class="shadow">
                            <div class="region-content">
                                <?php echo $OUTPUT->main_content() ?>
                            </div>
                        </div>


                    </div>
                </div>

                <?php if ($hassidepre OR (right_to_left() AND $hassidepost)) { ?>
                <div id="region-pre" class="block-region">
                    <div class="region-content">
                            <?php
                        if (!right_to_left()) {
                            echo $OUTPUT->blocks_for_region('side-pre');
                        } elseif ($hassidepost) {
                            echo $OUTPUT->blocks_for_region('side-post');
                    } ?>

                    </div>
                </div>
                <?php } ?>

                <?php if ($hassidepost OR (right_to_left() AND $hassidepre)) { ?>
                <div id="region-post" class="block-region">
                    <div class="region-content">
                           <?php
                       if (!right_to_left()) {
                           echo $OUTPUT->blocks_for_region('side-post');
                       } elseif ($hassidepre) {
                           echo $OUTPUT->blocks_for_region('side-pre');
                    } ?>
                    </div>
                </div>
                <?php } ?>

            </div>
        </div>
    </div>

    <!-- START OF FOOTER -->
    <div id="page-footer">
        <div id="footer" class="shadow">
            <div id="qr-code"></div>
            <div id="copyright">
                <div class="block">
                    <p>Copyright © 2013 Академия Молодежного Лидерства</p>
                </div>
            </div>
            <div id="social">
                <a href="https://twitter.com/" target="_blank"><img src="<?php echo $OUTPUT->pix_url('twitter', 'theme') ?>" title="Twitter"></a>
                <a href="http://vk.com/" target="_blank"><img src="<?php echo $OUTPUT->pix_url('vk', 'theme') ?>" title="ВКонтакте"></a>
                <a href="http://www.odnoklassniki.ru/" target="_blank"><img src="<?php echo $OUTPUT->pix_url('od', 'theme') ?>" title="Одноклассники"></a>
                <a href="http://www.youtube.com/" target="_blank"><img src="<?php echo $OUTPUT->pix_url('youtube', 'theme') ?>" title="Youtube"></a>
            </div>
        </div>
    </div>
    <!-- END OF FOOTER -->
</div>
<?php echo $OUTPUT->standard_end_of_body_html() ?>

<script type="text/javascript">
    jQuery(document).ready(function($) {
        $('.submit-link').click(function(){
            $(this).parents('form').submit();
        });

        $('#user-login-form input[type=image]').hover(function() {
            $(this).attr('src', '<?php echo $OUTPUT->pix_url('login-hover', 'theme') ?>');
        }, function() {
            $(this).attr('src', '<?php echo $OUTPUT->pix_url('login', 'theme') ?>');
        });

        $('#login-link').toggle(function() {
            $('#user-login-block').slideDown(300);
        }, function() {
            $('#user-login-block').slideUp(300);
        });

        var jLogin = $('#user-login-form input[name=username]');
        var jPass = $('#user-login-form input[name=password]');

        if (jLogin.length && jPass.length) {
            jLogin.watermark('логин');
            jPass.watermark('пароль');
        }
    });
</script>
</body>
</html>
