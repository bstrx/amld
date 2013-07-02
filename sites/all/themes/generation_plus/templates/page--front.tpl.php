<?php
    $path_to_theme = drupal_get_path('theme', 'generation_plus');
    $theme_path = base_path() . $path_to_theme;
?>

<div id="wrapper">
    <div id="wrapper-main">

        <?php print render($page['header']); ?>

        <div id="wrapper-content" class="shadow">
            <div id="main-content" class="rounded">
                <div id="video" class="rounded">
                    <object width="576" height="356">
                        <param name="movie" value="http://www.youtube.com/v/_BqgFzmF4WU?version=3&amp;hl=ru_RU&amp;rel=0"></param>
                        <param name="allowFullScreen" value="true"></param>
                        <param name="allowscriptaccess" value="always"></param>
                        <embed src="http://www.youtube.com/v/_BqgFzmF4WU?version=3&amp;hl=ru_RU&amp;rel=0" type="application/x-shockwave-flash" width="576" height="356" allowscriptaccess="always" allowfullscreen="true"></embed>
                    </object>
                </div>
                <div id="subscription">
                    <?php
                        $block = module_invoke('simplenews', 'block_view', '1');
                        print render($block['content']);
                    ?>
                    <div id="share">
                        <img src="<?php print $theme_path ?>/images/share.png" width="21" height="23">
                        <div id="share-icons">
                            <div class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="none" data-yashareQuickServices="vkontakte,twitter,odnoklassniki"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="block-audios">
                <?php
                    $block = module_invoke('views', 'block_view', 'recent_audio-block');
                    print render($block);
                ?>
            </div>
        </div>

        <div id="wrapper-photoreports" class="shadow">
            <div id="header-photoreports">
                <img id="logo-small" src="<?php print $theme_path ?>/images/logo-small.png">
                <h3>ФОТООТЧЕТЫ</h3>
            </div>
            <div id="block-photoreports">
                <?php
                    $block = module_invoke('views', 'block_view', 'recent_photoreports-block');
                    print render($block);
                ?>
            </div>
        </div>

        <div id="block-articles" class="shadow">
            <?php
                $block = module_invoke('views', 'block_view', 'recent_articles-block');
                print render($block);
            ?>
        </div>

        <?php print render($page['footer']); ?>

    </div>
</div>
