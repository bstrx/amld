<?php if (!checkSimplenewsSubscription()): ?>

    <p>
        Подпишись на нашу рассылку и получи<br />
        <span>бесплатный видео курс!</span>
    </p>

    <?php print render($form); ?>

<?php else: ?>

    <p>
        Вы подписаны на нашу рассылку!
    </p>

<?php endif ?>

