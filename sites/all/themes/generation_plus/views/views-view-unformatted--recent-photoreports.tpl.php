<tr>
    <?php
    foreach ($rows as $id => $row): ?>
        <td class="<?php print $classes_array[$id] ?>">
            <?php print $row; ?>
        </td>
    <?php endforeach; ?>
</tr>