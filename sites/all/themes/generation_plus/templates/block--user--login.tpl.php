<?php
$form = drupal_get_form('user_login_block');

$form['name']['#title_display'] = 'invisible';
$form['name']['#required'] = true;
$form['name']['#weight'] = -2;
$form['name']['#attributes']['placeholder'] = t('логин');

$form['pass']['#title_display'] = 'invisible';
$form['pass']['#weight'] = -1;
$form['pass']['#attributes']['placeholder'] = t('пароль');

$form['actions']['#weight'] = 0;
$form['actions']['submit'] = array(
    '#type' => 'image_button',
    '#button_type' => 'submit',
    '#src' => 'sites/all/themes/generation_plus/images/login.png',
);

$divClass = '';
$formError = '';

if ($form['name']['#needs_validation'] || $form['pass']['#needs_validation']) {
    $form['pass']['#attributes']['class'] = array('error');
    $divClass = ' class="visible"';
    $formError = '<div class="error-login">Неверный логин или пароль!</div>';
}

$rendered = drupal_render($form);

$output  = '<div id="user-login-block"' . $divClass . '>' .
    '<form action="' . $form['#action'] .
    '" method="' . $form['#method'] .
    '" id="' . $form['#id'] .
    '" class="'. implode(' ', $form['#attributes']['class']) .
    '" accept-charset="UTF-8"'. $formClass . '>'.
        '<div class="bordered">';

$output .= $formError;
$output .= $form['name']['#children'];
$output .= $form['pass']['#children'];
$output .= $form['actions']['#children'];
$output .= '</div>';
$output .= $form['links']['#children'];
$output .= $form['form_build_id']['#children'];
$output .= $form['form_id']['#children'];
$output .= '</form></div>';

print $output;
?>