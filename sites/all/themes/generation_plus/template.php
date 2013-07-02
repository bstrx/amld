<?php
function generation_plus_menu_tree__main_menu($variables) {
  return '<ul class="menu">' . $variables['tree'] . '</ul>';
}

function generation_plus_menu_link__main_menu(array $variables) {
    $element = $variables['element'];
    $sub_menu = '';

    if ($element['#below']) {
        $sub_menu = drupal_render($element['#below']);
    }
    $output = l($element['#title'], $element['#href'], $element['#localized_options']);

    $link = '<li' . drupal_attributes($element['#attributes']) . '>' . $output . $sub_menu;

    //if menu item doesn't have parent
    if (!$element['#original_link']['plid']) {
        global $base_root;
        $img_base = $base_root . base_path() . path_to_theme();
        $link .= '<img src= "' . $img_base . '/images/main-menu-active-corner.png">';
    }

    $link .= '</li>';

    return $link;
}

function generation_plus_theme() {

    return array(
        'opensoft_mailing_form' => array(
            'render element' => 'form',
            'template' => 'mailing-form',
        ),
    );
}

function generation_plus_form_alter(&$form, &$form_state, $form_id) {
    switch ($form_id) {
        case 'simplenews_block_form_1': {
            $form['realname'] = array(
                '#type' => 'textfield',
                '#required' => true,
                '#size' => 26,
                '#attributes' => array(
                    'placeholder' => t('ваше имя')
                ),
                '#weight' => 1
            );
            $form['mail'] = array(
                '#type' => 'textfield',
                '#required' => true,
                '#size' => 26,
                '#attributes' => array(
                    'placeholder' => t('ваш e-mail')
                ),
                '#weight' => 2
            );
            $form['submit'] = array(
                '#type' => 'image_button',
                '#button_type' => 'submit',
                '#src' => 'sites/all/themes/generation_plus/images/subscription.png',
                '#weight' => 3
            );
            break;
        } case 'search_block_form': {
            $form['search_block_form']['#size'] = 17;
            $form['search_block_form']['#attributes'] = array(
                'title' => t('Введите значение для поиска и нажмите Enter'),
                'placeholder' => t('поиск'),
                'class' => array('rounded')
            );
            break;
        }
    }
}
?>