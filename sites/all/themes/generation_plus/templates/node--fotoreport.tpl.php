<div class="photo-gallery">

<?php
    $mainPhoto = $content['field_report_main_foto']['#items'][0];
    $photos = $content['field_report_foto']['#items'];
    if (!count($photos)) {
        $photos = array();
    }
    array_unshift($photos, $mainPhoto);

    foreach ($photos as $i => $photo) {

        $class = $i % 4 ? '' : 'first';

        $image_settings = array(
            'style_name' => 'photoreport_small',
            'path' => $photo['uri']
        );
        print (
            '<a href="'.file_create_url($photo['uri']).'" title="'.$photo['title'].'" rel="gallery" class="fancybox ' . $class . '">'
            .theme('image_style', $image_settings)
            .'</a>'
        );
    }
?>

</div>