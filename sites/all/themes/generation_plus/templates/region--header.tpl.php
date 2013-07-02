<?php
    $path_to_theme = drupal_get_path('theme', 'generation_plus');
    $theme_path = base_path() . $path_to_theme;

    drupal_add_js('http://yandex.st/share/share.js');
    //add script for placeholders in IE<=8
    drupal_add_js($theme_path .'/js/jquery.watermark.min.js');
?>
<div id="user-login-block">
    <div id="user-login-form">
        <form action="<?php print base_path() ?>moodle/login/index.php" method="post" >
            <div class="bordered">
                <div class="form-item">
                    <input placeholder="логин" type="text" name="username" id="username" size="15" value="" maxlength="60" required>
                </div>
                <div class="form-item">
                    <input placeholder="пароль" type="password" name="password" id="password" size="15" value="" maxlength="128" required>
                </div>
                <div class="form-actions">
                    <input type="image" src="<?php print $theme_path ?>/images/login.png">
                </div>
                <div class="item-list">
                    <ul>
                        <li><a href="<?php print base_path() ?>moodle/login/forgot_password.php" title="Запросить новый пароль по электронной почте.">Забыли пароль?</a></li>
                    </ul>
                </div>
            </div>
        </form>
        <div class="item-list">
            <ul>
                <li class="first"><a href="<?php print base_path() ?>moodle/login/signup.php" title="Регистрация">Регистрация</a></li>
                <li>
                    <form action="<?php print base_path() ?>moodle/login/index.php" method="post" id="guestlogin">
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
        <div id="location">
            <img src="<?php print $theme_path ?>/images/location.png" width="17" height="22">
            <a href="#">Саратов</a>
        </div>

        <div id="login-block">
            <img src="<?php print $theme_path ?>/images/key.png" width="19" height="10">

            <?php if ($userInfo = getActiveMoodleUser()): ?>
                <?php
                    $fullName = $userInfo['firstname'] . ' ' . $userInfo['lastname'];
                    $maxChars = 40;
                    //cut users's name to fit in top menu
                    $limitedFullName = (mb_strlen($fullName, 'UTF-8') > $maxChars) ? trim( mb_substr($fullName, 0, $maxChars,  'UTF-8')) . '...' : $fullName;
                ?>
                Вы зашли под именем
                <?php
                    print l(t($limitedFullName), 'moodle/user/profile.php', array(
                        'absolute' => true,
                        'attributes' => array(
                            'title' => $fullName
                        ),
                        'query' => (array(
                            'id' => $userInfo['id']
                        ))
                    ))
                ?>

                (<?php print l(t('Выход'), 'moodle/login/logout.php', array('absolute' => true)) ?>)
            <?php else: ?>
                <?php print l(t('Войти'), 'moodle/login/index.php', array('absolute' => true, 'attributes' => array('id' => 'login-link'))) ?>
            <?php endif; ?>
        </div>

        <?php
            $tree = menu_tree('menu-top-menu');
            print render($tree);
        ?>
    </div>

    <div id="logo">
        <a href="<?php print base_path()?>">
            <img src="<?php print $theme_path ?>/images/logo.png" width="364" height="108">
        </a>
    </div>

    <div id="quotation">
        <?php
            $block = module_invoke('views', 'block_view', 'quotations-block');
            print render($block);
        ?>
    </div>
</div>

<div id="wrapper-main-menu" class="shadow">
    <div id="main-menu">
        <?php
            $block = module_invoke('menu_block', 'block_view', 2);
            print render($block['content']['#content']);
        ?>
        <div id="search-block-form">
            <?php
                $block = module_invoke('search', 'block_view');
                print render($block);
            ?>
        </div>
    </div>
    <div id="main-menu-sub">
        <?php
            $block = module_invoke('menu_block', 'block_view', 1);
            print render($block['content']['#content']);
        ?>
    </div>
</div>

