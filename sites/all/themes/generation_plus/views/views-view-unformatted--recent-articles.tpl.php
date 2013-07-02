<tr>
    <?php
    foreach ($rows as $id => $row): ?>
        <td class="recent-article <?php print $classes_array[$id] ?>">
            <?php print $row; ?>
        </td>
    <?php endforeach; ?>
</tr>