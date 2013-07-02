<?php
    $months = array(
        '01' => 'янв',
        '02' => 'фев',
        '03' => 'мар',
        '04' => 'апр',
        '05' => 'май',
        '06' => 'июн',
        '07' => 'июл',
        '08' => 'авг',
        '09' => 'сен',
        '10' => 'окт',
        '11' => 'ноя',
        '12' => 'дек',
    );

    $timestamp = strtotime($fields['field_event_date']->content);
    $day = date('d', $timestamp);
    $monthKey = date ('m', $timestamp);
    $month = $months[$monthKey];
?>

<a href="<?php print url('node/' . $fields['nid']->content, array('absolute' => true)); ?>">
    <div class="photoreport-content">
        <?php print $fields['field_report_main_foto']->content; ?>
        <div class="photoreport-shadow"></div>
        <div class="photoreport-date" >
            <div class="day"><?php print $day ?></div>
            <div class="month"><?php print $month ?></div>
        </div>
    </div>

    <div class="photoreport-title <?php isset($classes_array[$id]) ? print $classes_array[$id] : false; ?>">
        <?php print $fields['title']->content; ?>
    </div>
</a>
