<div id="wrapper">
    <div id="wrapper-main">

        <?php print render($page['header']); ?>

        <div id="wrapper-content" class="shadow">
            <h1 class="title" id="page-title">
                <?php print render($title); ?>
            </h1>
            <?php print render($page['content']); ?>
        </div>

        <?php print render($page['footer']); ?>
    </div>
</div>
