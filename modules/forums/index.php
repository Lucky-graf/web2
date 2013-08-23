<?php
if (!defined('W2P_BASE_DIR')) {
	die('You should not access this file directly');
}

$forum = new CForum();
$canRead = $forum->canView();
$canAdd  = $forum->canCreate();

if (!$canRead) {
	$AppUI->redirect(ACCESS_DENIED);
}

// retrieve any state parameters
if (isset($_GET['orderby'])) {
	$orderdir = $AppUI->getState('ForumIdxOrderDir') ? ($AppUI->getState('ForumIdxOrderDir') == 'asc' ? 'desc' : 'asc') : 'desc';
	$AppUI->setState('ForumIdxOrderBy', w2PgetParam($_GET, 'orderby', null));
	$AppUI->setState('ForumIdxOrderDir', $orderdir);
}
$orderby = $AppUI->getState('ForumIdxOrderBy') ? $AppUI->getState('ForumIdxOrderBy') : 'forum_name';
$orderdir = $AppUI->getState('ForumIdxOrderDir') ? $AppUI->getState('ForumIdxOrderDir') : 'asc';

$f = w2PgetParam($_POST, 'f', 0);

$forums = $forum->getAllowedForums($AppUI->user_id, $AppUI->user_company, $f, $orderby, $orderdir);

// setup the title block
$titleBlock = new w2p_Theme_TitleBlock('Forums', 'support.png', $m, $m . '.' . $a);
$titleBlock->addCell('<form name="forum_filter" action="?m=forums" method="post" accept-charset="utf-8">' . arraySelect($filters, 'f', 'size="1" class="text" onChange="document.forum_filter.submit();"', $f, true) . '</form>');
$titleBlock->addCell($AppUI->_('Filter') . ':');

if ($canAdd) {
	$titleBlock->addCell('<form action="?m=forums&a=addedit" method="post" accept-charset="utf-8"><input type="submit" class="button btn btn-small dropdown-toggle" value="' . $AppUI->_('new forum') . '"></form>');
}

//TODO: this is a little hack to make sure the table header gets generated in the show() method below
global $a;
$a = 'list';
// End of little hack

$titleBlock->show();
$htmlHelper = new w2p_Output_HTMLHelper($AppUI);

$fieldList = array();
$fieldNames = array();

$module = new w2p_Core_Module();
$fields = $module->loadSettings('forums', 'index_list');

if (count($fields) > 0) {
    $fieldList = array_keys($fields);
    $fieldNames = array_values($fields);
} else {
    // TODO: This is only in place to provide an pre-upgrade-safe
    //   state for versions earlier than v3.0
    //   At some point at/after v4.0, this should be deprecated
    $fieldList = array('watch_user', 'forum_name', 'forum_project', 'forum_description', 'forum_owner',
        'forum_topics', 'forum_replies', 'forum_last_date');
    $fieldNames = array('Watch', 'Forum Name', 'Project', 'Description', 'Owner', 'Topics',
        'Replies', 'Last Post Info');

    //$module->storeSettings('forums', 'index_list', $fieldList, $fieldNames);
    $fields = array_combine($fieldList, $fieldNames);
}
$columnCount = 1 + count($fieldList);

$listTable = new w2p_Output_ListTable($AppUI);

?>

<form name="watcher" action="./index.php?m=forums&f=<?php echo $f; ?>" method="post" accept-charset="utf-8">
	<input type="hidden" name="dosql" value="do_watch_forum" />
	<input type="hidden" name="watch" value="forum" />

    <?php
    echo $listTable->startTable();
    echo $listTable->buildHeader($fields, true, 'forums');

    $p = '';

    foreach ($forums as $row) {
        $htmlHelper->stageRowData($row);
        ?>
        <tr>
            <td class="data">
                <input type="checkbox" name="forum_<?php echo $row['forum_id']; ?>" <?php echo $row['watch_user'] ? 'checked="checked"' : ''; ?> />
            </td>

            <?php
            echo $htmlHelper->createCell('forum_name', $row['forum_name']);
            echo $htmlHelper->createCell('forum_project', $row['forum_project']);
            echo $htmlHelper->createCell('forum_description', $row['forum_description']);
            echo $htmlHelper->createCell('forum_owner', $row['forum_owner']);
            echo $htmlHelper->createCell('topic_count', $row['forum_topics']);
            echo $htmlHelper->createCell('reply_count', $row['forum_replies']);
            echo $htmlHelper->createCell('forum_last_datetime', $row['forum_last_date']);
            ?>
        </tr>
    <?php } ?>
    <tr>
        <td colspan="<?php echo $columnCount; ?>">
            <input type="submit" class="button" value="<?php echo $AppUI->_('update watches'); ?>" />
        </td>
    </tr>
    <?php
    echo $listTable->endTable();
    ?>
</form>