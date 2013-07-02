<?php

$THEME->name = 'academy';
$THEME->parents = array('base');
$THEME->sheets = array(
    'core',     /** Must come first**/
    'admin',
    'blocks',
    'calendar',
    'course',
    'user',
    'dock',
    'grade',
    'message',
    'modules',
    'question',
    'css3',    /** Sets up CSS 3 + browser specific styles **/
    'academy'
);
$THEME->javascripts = array(
    'jquery.watermark.min',
);
$THEME->enable_dock = true;
$THEME->rendererfactory = 'theme_overridden_renderer_factory';